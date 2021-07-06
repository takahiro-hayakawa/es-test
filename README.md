# es-test
参考記事  
https://qiita.com/kiyokiyo_kzsby/items/344fb2e9aead158a5545

実行方法  
```shell
docker-compose build
docker-compose up -d
```

終了  
```shell
docker-compose down
```

Kibana  
http://localhost:5601  
起動に時間がかかるっぽい  


## ヘルスチェック
```shell
 curl -X GET "localhost:9200/_cat/health?v&pretty"
```

## ノード確認
```shell
 curl -X GET "localhost:9200/_cat/nodes?v&pretty"
```

## コンテナ内の設定ファイルのパス
```shell
/usr/share/elasticsearch/
```

## 用語メモ
- ノード  
ElasticSearchが動作する1つのインスタンスのこと
  

- クラスタ  
複数のノードをグループとして動作させる時のノードグループのこと
  

- シャード  
ElasticSearchはインデックスデータを分割して異なるノードに分散配置させる仕組みを持っており、 
その分割した各部分のこと


- レプリカ  
シャード、ノードの可用性を高める目的で各シャードには自動的に複製される仕組みがある。
この複製のこと
  

- インデックス  
ドキュメントを保存する場所。RDBでいうところのテーブルに相当
  

- ドキュメント  
1つの文章の単位。JSONオブジェクトで1つ以上のフィールドによって構成される。
RDBの1行のレコードに相当
  

- フィールド  
ドキュメント内の項目(Key)と値(Value)の組。RDBの1行レコードの1列の値に相当
  

- マッピング  
ドキュメントがどのようなフィールドから構成されるかの構造(ドキュメントタイプ)を具体的に定義したもの
ドキュメント内の各フィールドのデータ型をマッピングしたもの
  
## 実行例
kibanaのconsole上での実行

### インデックス作成
```shell
PUT customer
```

### ドキュメント操作
```
PUT customer/_doc/1
{
  "user_name": "Takahiro Hayakawa",
  "date": "2021-07-07T00:58:00",
  "message": "Hello"
}
```

### ドキュメント取得  
```
GET customer/_doc/1
# メタ情報は除く
GET customer/_source/1
```

### ドキュメント一部更新
```shell
POST customer/_update/1
{
  "doc" : {
    "message": "Hello World"
  }
}
```
