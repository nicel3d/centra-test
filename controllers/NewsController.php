<?php

namespace app\controllers;

use app\models\NewsToTag;
use tags\Tags;
use Yii;
use news\News;
use news\search\NewsSearch;
use yii\behaviors\TimestampBehavior;
use yii\db\Expression;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;

/**
 * NewsController implements the CRUD actions for News model.
 */
class NewsController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            [
                'class' => TimestampBehavior::className(),
                'createdAtAttribute' => 'create_time',
                'updatedAtAttribute' => 'update_time',
                'value' => new Expression('NOW()'),
            ],
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all News models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new NewsSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single News model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new News model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new News();

        if ($model->load(Yii::$app->request->post())) {
            $model->user_id = Yii::$app->user->id;
            if ($model->save(false))
                return $this->redirect(['index']);
        }

        $tags = Tags::find()->asArray()->all();
        $all_tags = [];
        foreach($tags as $tag) $all_tags[$tag['id']] = $tag['title'];

        return $this->render('create', [
            'model' => $model,
            'all_tags' => $all_tags
        ]);
    }

    /**
     * Updates an existing News model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        if ($model->load(Yii::$app->request->post())) {
            $model->user_id = Yii::$app->user->id;
            $tags = $model->_tags;
            $model->_file = UploadedFile::getInstance($model, '_file');

            if ($model->_file && $model->validate()) {
                $model->_file->saveAs('img/article/' . $model->_file->baseName . '.' . $model->_file->extension);
                $model->image = $model->_file->baseName . '.' . $model->_file->extension;
            }
//            if (!$model->_file instanceof UploadedFile || $model->_file->error == UPLOAD_ERR_NO_FILE) {
//                return [$this->uploadRequired, []];
//            }
            if ($model->save(false)){
                NewsToTag::deleteAll(['news_id' => $id]);
                foreach ($tags as $tag){
                    $tsave = new NewsToTag();
                    $tsave->news_id = $id;
                    $tsave->tag_id = $tag;
                    $tsave->save();
                }
                return $this->redirect(['index']);
            }
        }

        $tags = Tags::find()->asArray()->all();
        $all_tags = [];
        foreach($tags as $tag) $all_tags[$tag['id']] = $tag['title'];

        return $this->render('update', [
            'model' => $model,
            'all_tags' => $all_tags
        ]);
    }



    /**
     * Deletes an existing News model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the News model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return News the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = News::findOne($id)) !== null) {
            $selected = [];
            $elements = NewsToTag::find()->select('tag_id')->where(['news_id' => $id])->asArray()->all();
            foreach ($elements as $element)
                $selected[] = $element['tag_id'];
            $model->_tags = $selected;
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }
}
