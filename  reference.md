# SD_1907 開発に必要そうなもの

入力情報

出発地
予算
帰着日
人数

=>ここからリクエストを返す

宿の写真も

返してほしいの
交通費のトーたるの値段、所要時間、距離

->経路表示(Google Map)
電話番号・URL

## 実装中のAPI

- Rakuten Travel API
- Google Maps API


## Reference

mongoDB (t-takuya.com:27017/local/jphacks):結果保存
mongoDB (t-takuya.com:27017/local/jphacks_req):リクエスト結果(updateで結果をアプデ)

- リクエストクエリ
- 必須：req_id(DB識別のため)
- (1) rakuten
    - Prefecture
    - City
- (2) 

# サーバー側で使ってる技術
- AWS(API Gateway, Lambda, EC2, Dynamo DB)
- Python
- Node.js