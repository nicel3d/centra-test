<?php
/**
 * Created by PhpStorm.
 * User: nikel
 * Date: 30.12.2017
 * Time: 7:05
 */

use yii\bootstrap\Html;

/* @var $this yii\web\View */
/* @var $user app\models\User */

$resetLink = Yii::$app->urlManager->createAbsoluteUrl(['user/default/password-reset', 'token' => $user->password_reset_token]);
?>

    Здравствуйте, <?= Html::encode($user->username) ?>!

    Пройдите по ссылке, чтобы сменить пароль:

<?= Html::a(Html::encode($resetLink), $resetLink) ?>