# file2list.jl
Julia: リストをテキストファイルに書き出す。テキストファイルからリストを読み込む。

(拙作の[Python版](https://github.com/j0306043/file2list.py)もありますので、よかったらどうぞ。)

# 概要

Juliaのリストの表現に近い形でリストをファイルに書き出します。
リストの(トップレベルの)1要素がテキストファイルの1行に対応します。
整数、浮動小数点数、文字列、さらには、入れ子のリストなどがほぼ人間に見やすい表現で書き出されます。

一方、そのようなテキストファイルを読み込んでリストにすることができます。
テキストファイルの例は、[sample_read.txt](https://github.com/j0306043/file2list.jl/blob/main/sample_read.txt)をご覧ください。
整数、浮動小数点数、文字列、さらには、(入れ子の)リストなどがほぼそのまま使えます。
からくりとしては、行単位でMeta.parseを使って変換しているだけです。
したがって、Meta.parseが読める形式なら読み込んでリストにすることができます。
人間にとって見やすい単純な形式のテキストファイルですので、個人的なちょっとしたデータ解析や実験等で便利に使えると思います。

# 使い方

使い方の例として、[sample.jl](https://github.com/j0306043/file2list.jl/blob/main/sample.jl)をご覧ください。

## file_to_list(file_name)

ファイルfile_nameから内容を読み込み、リストにして返します。

## list_to_file(lst, file_name)

リストlstを、ファイルfile_nameに書き出します。
すでにファイルが存在する場合には、上書きします。

## 実行例

```
% julia sample.jl
lis1=Any[1000, 3.1415, [9.99, 12.0], ["abc", "DeF", "GHi"], "BIG", "small"]
lis2=Any[1000, 3.1415, [9.99, 12.0], ["abc", "DeF", "GHi"], "BIG", "small"]
```

sample_read.txtから読んだものがlis1です。
lis1をsample_write.txtに書いて再度読み込んだものがlis2です。
lis1とlis2が一致している様子を表しています。
