<?php

namespace tags;

use app\models\NewsToTag;
use Yii;
use yii\behaviors\TimestampBehavior;

/**
 * This is the model class for table "{{%tags}}".
 *
 * @property int $id
 * @property string $title
 * @property int $created_at
 * @property int $updated_at
 *
 * @property NewsToTag[] $newsToTags
 */
class Tags extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%tags}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['created_at', 'updated_at'], 'integer'],
            [['title'], 'string', 'max' => 30],
            ['title', 'match', 'pattern' => '/^#[A-zА-я0-9]{4,}#$/'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'title' => Yii::t('app', 'Title'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }

    public function behaviors()
    {
        return [
            TimestampBehavior::className(),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNewsToTags()
    {
        return $this->hasMany(NewsToTag::className(), ['tag_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return \tags\query\TagsQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \tags\query\TagsQuery(get_called_class());
    }
}
