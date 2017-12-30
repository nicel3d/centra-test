<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel news\search\NewsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'News');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="news-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create News'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            [
                'attribute' => 'title',
                'value' => function ($data) {
                    return Html::a(Html::encode($data->title), ['news/'.$data->id]);
                },
                'format' => 'raw',
                'label' => Yii::t('app','created_at'),
            ],
//            'image',
//            'alias',
//            'article:ntext',
            [
                'attribute' => 'created_at',
                'value' => function ($data) {
                    return date('d.m.Y H:i:s', (int)$data->created_at);
                },
                'format' => 'raw',
                'label' => Yii::t('app','created_at'),
            ],
            [
                'attribute' => 'updated_at',
                'value' => function ($data) {
                    return date('d.m.Y H:i:s', (int)$data->updated_at);
                },
                'format' => 'raw',
                'label' => Yii::t('app','updated_at'),
            ],
            [
                'attribute' => 'user_id',
                'value' => function ($data) {
                    return Html::encode(\users\User::findIdentity($data->user_id)->username);
                },
                'format' => 'raw',
                'label' => Yii::t('app','user_id'),
            ],
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{update} {delete}',
            ],
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>
