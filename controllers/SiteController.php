<?php

namespace app\controllers;

use app\models\NewsToTag;
use news\News;
use tags\Tags;
use Yii;
use yii\data\ActiveDataProvider;
use yii\data\Pagination;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\ContactForm;

class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        $param = Yii::$app->request->get('tag');

        if($param === Null)
            $list_news = News::find();
        else {
            $newlist = [];
            $list = NewsToTag::find()->select('news_id')->where(['tag_id' => $param])->all();
            foreach ($list as $item)
                $newlist[] = $item['news_id'];
            $list_news = News::find()->where(['id' => $newlist]);
        }

        $list_news->orderBy(['updated_at' => SORT_DESC]);

        $list_tag_array = [];
        $list_tag = Tags::find()->all();
        foreach ($list_tag as $tag){
            $list_tag_array[$tag->id] = $tag->title;
        }

        $pagination = new Pagination([
            'defaultPageSize'=>20,
            'totalCount'=>$list_news->count()
        ]);

        $list_news2 = $list_news->offset($pagination->offset)
            ->limit($pagination->limit)->with(['newsToTags'])->all();

        return $this->render('index', [
            'pagination' => $pagination,
            'list_news' => $list_news2,
            'list_tag' => $list_tag,
            'list_tag_array' => $list_tag_array,
            'param' => $param
        ]);
    }


    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionAbout()
    {
        return $this->render('about');
    }
}
