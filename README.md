# ssm-start-session

AWS CLI を利用したセッションマネージャーの実行をサポートします  

## 使い方

このリポジトリをcloneしてmakeを実行してください

```bash
git clone git@github.com:proshunsuke/ssm-start-session.git
cd ssm-start-session
make
```

接続したいインスタンスのTagsに `Name=instance_name` 追加されていて、aws profileが `your_provile_name` として定義されている状態で、以下のように実行することでセッションマネージャーを実行します

```bash
ssm-start-session instance_name your_provile_name
```
