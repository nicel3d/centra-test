<?php
/**
 * Created by PhpStorm.
 * User: nikel
 * Date: 30.12.2017
 * Time: 6:50
 */

use yii\bootstrap\Html;

/* @var $this yii\web\View */
/* @var $user app\models\User */

$confirmLink = Yii::$app->urlManager->createAbsoluteUrl(['user/email-confirm', 'token' => $user->email_confirm_token]);
?>

<div>Здравствуйте, <?= Html::encode($user->username) ?>!</div>

<div>Для подтверждения адреса пройдите по ссылке:</div>

<?= Html::a(Html::encode($confirmLink), $confirmLink) ?>

<div>Если Вы не регистрировались на нашем сайте, то просто удалите это письмо.</div>
