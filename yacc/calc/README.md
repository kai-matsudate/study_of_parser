# 簡易電卓

この例では、lexとyaccを組み合わせて、四則演算（加減乗除）が可能な簡単な電卓を実装しています。

## LexとYaccの連携の詳細

```mermaid
sequenceDiagram
    participant Input as 入力テキスト
    participant Lex as 字句解析器(yylex)
    participant Yacc as 構文解析器(yyparse)
    participant Action as アクション処理
    
    Note over Input,Action: 例: "2 + 3 * 4" の処理
    Input->>Lex: 文字列入力
    loop トークン化
        Lex->>Lex: パターンマッチング
        Lex-->>Yacc: NUMBER(2)
        Lex-->>Yacc: PLUS
        Lex-->>Yacc: NUMBER(3)
        Lex-->>Yacc: MULT
        Lex-->>Yacc: NUMBER(4)
    end
    
    Yacc->>Yacc: 文法規則に基づく解析
    Yacc->>Action: 計算実行
    Action-->>Input: 結果出力: 14
```

この図は、入力テキスト "2 + 3 * 4" が字句解析され、構文解析され、最終的に計算結果が得られるまでの過程を示しています。

## 学習ポイント

- lexとyaccの連携方法
- 文法規則の定義
- 式の評価と計算

## 実行方法

```bash
make
./calc
```

プログラムを実行し、数式（例：`2 + 3 * 4`）を入力すると、計算結果が表示されます。

## コードの説明

### calc.l（字句解析部分）

数字や演算子などのトークンを定義しています。各トークンは構文解析器に渡されます。

### calc.y（構文解析部分）

文法規則と、それに対応するアクション（計算処理）を定義しています。主な特徴：

1. 演算子の優先順位を定義：乗算・除算は加算・減算より優先される
2. 左再帰的な文法規則を使用して式を定義
3. 各規則に対応するアクションで実際の計算を実行

この例は、字句解析と構文解析がどのように連携するかを示す基本的な例です。入力テキストがどのように処理され、構造化された計算に変換されるかを学ぶことができます。
