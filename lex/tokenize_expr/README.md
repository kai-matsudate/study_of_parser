# 数式トークナイザー

この例では、算術式を読み取り、含まれる数値と演算子をトークンとして識別する字句解析器を実装しています。

## 字句解析の動作フロー

```mermaid
flowchart LR
    A[入力文字列\n"3 + 4 * 2"] --> B[字句解析器\nyylex()]
    B -->|トークン1| C[NUMBER: 3]
    B -->|トークン2| D[PLUS: +]
    B -->|トークン3| E[NUMBER: 4]
    B -->|トークン4| F[MULT: *]
    B -->|トークン5| G[NUMBER: 2]
    
    style B fill:#f9d5e5,stroke:#333,stroke-width:2px
    style C fill:#e6f7ff,stroke:#333,stroke-width:1px
    style D fill:#e6f7ff,stroke:#333,stroke-width:1px
    style E fill:#e6f7ff,stroke:#333,stroke-width:1px
    style F fill:#e6f7ff,stroke:#333,stroke-width:1px
    style G fill:#e6f7ff,stroke:#333,stroke-width:1px
```

## パターンマッチングの仕組み

```mermaid
flowchart TD
    A[入力バッファ] --> B{パターンマッチング}
    B -->|[0-9]+| C[NUMBER]
    B -->|"+"| D[PLUS]
    B -->|"*"| E[MULT]
    C & D & E --> F[次のトークンへ]
    F --> B
    
    style B fill:#f9d5e5,stroke:#333,stroke-width:2px
```

## 学習ポイント

- トークンの定義と識別
- 数値と演算子の認識
- トークン情報の出力

## 実行方法

```bash
make
./lexer
```

プログラムを実行し、数式（例：`3.14 + 2 * 5`）を入力すると、各部分がトークンとして識別され、その種類が表示されます。

## コードの説明

`lex.l` ファイルでは以下のようなトークンを定義しています：

- `NUMBER` - 整数または小数
- `PLUS` - 加算演算子 `+`
- `MINUS` - 減算演算子 `-`
- `MULT` - 乗算演算子 `*`
- `DIV` - 除算演算子 `/`

このサンプルは、構文解析の前段階である「トークン化」の基本を示しています。入力テキストを意味のある最小単位（トークン）に分割することで、後の構文解析が容易になります。
