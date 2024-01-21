## アプリケーション名
- BuyBye

## アプリケーション概要
- フリマアプリに出品した不用品に出品期限を設定することで、効率的に処分することができる

## URL

## テスト用アカウント

## 利用方法
1 出品物の登録




## アプリケーションを作成した背景
- 購入者側の立場では、商品を探すと商品の最終更新が６ヶ月前で出品したままのものが散見される。

- 出品者側の立場では、出品を忘れていてある日いいねが付くと商品を保管していたか不安になったこと、また、どこかのタイミングで値下げや商品の取り下げ期限が決まった方が不用品整理が効率よくできると考えたため。

## 洗い出した要件

## 実装した機能についての画像やGIFおよびその説明

## 実装予定の機能

## データベース設計

### users テーブル

| Column             | Type    | Options            |
| ------------------ | ------- | ------------------ |
| nickname           | string  | null: false        |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false        |

#### Association

- has_many :sells
- has_many :buys

### sells テーブル

| Column                        | Type   | Options     |
| ----------------------------- | ------ | -----------
| user                          | references | null false, foreign_key: true |
| item                          | string  | null: false |
| memo                          | text    |             |
| status_id                     | integer | null: false |
| price                         | integer |             |
| wish                          | integer |             |
| limit                         | date    | null: false |

- belongs_to :user
- has_one :buys
- belongs_to :status

### buys テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |
| commition       | integer    | null: false,                   |
| postage         | integer    | null: false,                   |
| memo            | text       |                                |

- belongs_to :user
- belongs_to :sell

## 画面遷移図

## 開発環境

## ローカルでの動作方法

## 工夫したポイント

## 改善点

## 制作時間