# file2list.jl
Julia: 1次元配列(ベクトル)をテキストファイルに書き出す。テキストファイルから1次元配列(ベクトル)を読み込む。

(拙作の[Python版](https://github.com/j0306043/file2list.py)もありますので、よかったらどうぞ。)

# 概要

Juliaの配列の表現に近い形で配列をファイルに書き出します。
配列の(トップレベルの)1要素がテキストファイルの1行に対応します。
整数、浮動小数点数、文字列、さらには、入れ子の配列などがほぼ人間に見やすい表現で書き出されます。

一方、そのようなテキストファイルを読み込んで配列にすることができます。
テキストファイルの例は、[sample_read.txt](https://github.com/j0306043/file2list.jl/blob/master/sample_read.txt)をご覧ください。
整数、浮動小数点数、文字列、さらには、(入れ子の)配列などがほぼそのまま使えます。
からくりとしては、行単位でMeta.parseを使って変換しているだけです。
したがって、Meta.parseが読める形式なら読み込んで配列にすることができます。
人間にとって見やすい単純な形式のテキストファイルですので、個人的なちょっとしたデータ解析や実験等で便利に使えると思います。

# 使い方

使い方の例として、[sample.jl](https://github.com/j0306043/file2list.jl/blob/master/sample.jl)をご覧ください。

## file_to_list(file_name)

ファイルfile_nameから内容を読み込み、配列にして返します。

## list_to_file(lst, file_name)

配列lstを、ファイルfile_nameに書き出します。
すでにファイルが存在する場合には、上書きします。

## 実行例

```
% julia sample.jl
lis1=Any[1000, 3.1415, [9.99, 12.0], ["abc", "DeF", "GHi"], "BIG", "small"]
lis2=Any[1000, 3.1415, [9.99, 12.0], ["abc", "DeF", "GHi"], "BIG", "small"]
See also sample_write.txt generated.
```

sample_read.txtから読んだものがlis1です。
lis1をsample_write.txtに書いて再度読み込んだものがlis2です。
lis1とlis2が一致している様子を表しています。

## 実行例2

```
% julia sample2.jl
lis1=Vector{Any}[[[0, 5], 100], [[8, 2], 300], [[3, 8], 200]]
See two files: sample_write_mixed_array_with_any.txt and sample_write_mixed_array_without_any.txt.
lis2=[([0, 5], 100), ([8, 2], 300), ([3, 8], 200)]
See sample_write_tuple.txt.
```

読み込む例がlis1([sample_read_mixed_array.txt](https://github.com/j0306043/file2list.jl/blob/master/sample_read_mixed_array.txt))のように、配列の要素が型が混在した配列の場合、list_to_fileで書き出したとき、Anyという型表記が書き込まれます(実行結果のsample_write_mixed_array_with_any.txtを見てみてください)。
これが鬱陶しいという場合は、:typeinfoに型を指定すると消せる場合があります。
参考例は、[sample2.jl](https://github.com/j0306043/file2list.jl/blob/master/sample2.jl)をご覧ください。
実行結果の、sample_write_mixed_array_with_any.txt と sample_write_mixed_array_without_any.txtが、それぞれ:typeinfoに型を指定しなかった場合とした場合ですので、比べてみてください。
:typeinfoに指定できるものは、IOContextの:typeinfoと同じです。内部的にIOContextに渡しているだけです。

なお、要素の型が混在する場合は、配列を使うのではなく、lis2([sample_read_tuple.txt](https://github.com/j0306043/file2list.jl/blob/master/sample_read_tuple.txt))のようにタプルを使う方がJuliaとしては良い作法です。
タプルの場合は、:typeinfoの指定は不要です。
参考例は、[sample2.jl](https://github.com/j0306043/file2list.jl/blob/master/sample2.jl)を、実行結果の例は、sample_write_tuple.txtをご覧ください。
