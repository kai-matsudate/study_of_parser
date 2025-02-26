# lexer

lexer の仕事は、与えられた文字列を意味のある単位に分割することです。
この「意味のある単位」をプログラミング言語においては「トークン」と呼びます。
例えば以下のような文字列が与えられたとき、

```ruby
10.times do |i|
  puts i
end
```

lexer は以下のようなトークンに分割します。

```
(integer, 10)(dot, .)(identifier, times)(keyword, do)(identifier, i)
  (identifier, puts)(identifier, i)
(keyword, end)

※ 簡便のため、トークンの種類を簡略化しています
```

実際に手元で確認してみましょう。以下のコードを terminal で実行してみてください。

```ruby
require 'ripper'

code = '10.times do |i| puts i end'
tokens = Ripper.lex(code)

tokens.each do |token|
  p token
end
```


ここまでが lexer の仕事です。逆にいうと、トークンにした結果、プログラミング言語の構文として間違っているかどうかは lexer の預かり知るところではないのです。

## tokenize のアルゴリズム
