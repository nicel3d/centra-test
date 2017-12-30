<?php

use yii\bootstrap\ActiveForm;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model news\News */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="news-form">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'alias')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, '_tags')->dropDownList(
        $all_tags
    , ['multiple' => 'true'])?>

    <div class="row" style="vertical-align: middle">
        <div class="col-md-4">
            <?php if ($model->image != Null or $model->image != ''): ?>
                <img class="image-article" src="/img/article/<?= $model->image?>" alt="<?=$model->title?>">
            <?php endif;?>
        </div>
        <div class="col-md-8">
            <?= $form->field($model, '_file')->fileInput() ?>
        </div>
    </div>

    <?= $form->field($model, 'article')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
