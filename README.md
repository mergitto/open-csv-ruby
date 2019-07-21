# 農薬データの取得スクリプト
1. FAMICの農薬データ(zip)をcsv形式で取得する(open-write.rb)
1. FAMICの農薬データ一覧ページから、zipリンクを取得する(scrape.rb)
1. csvで展開したデータを読み込んで、出力してみる

## セットアップ
`./setup.sh`

## csvデータの読み込み
`ruby readcsv.rb`
