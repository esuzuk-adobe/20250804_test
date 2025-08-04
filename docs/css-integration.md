# CSS統合システム

このドキュメントでは、複数のCSSファイルを統合してHTMLに埋め込む仕組みについて説明します。

## 🎯 課題解決

### 問題
- GitHub Pagesで相対パスのCSSファイルが読み込まれない
- 複数のCSSファイルの依存関係管理が複雑
- ネットワークリクエスト数の最適化が必要

### 解決方法
- 全CSSファイルを単一ファイルに結合
- 結合したCSSをHTMLテンプレートに直接埋め込み
- 外部ファイル依存を完全に除去

## 🔧 システム構成

### 1. CSS結合スクリプト (`scripts/combine-css.sh`)

指定された順序でCSSファイルを結合します：

```bash
CSS_FILES=(
    "css/tokens/custom/global-vars.css"    # グローバル変数
    "css/tokens/custom/light-vars.css"     # ライトテーマ
    "css/tokens/custom/medium-vars.css"    # ミディアムサイズ
    "css/typography/index.css"             # タイポグラフィ
    "css/page/index.css"                   # ページレイアウト
    "css/button/index.css"                 # ボタンコンポーネント
    "css/icon/index.css"                   # アイコンコンポーネント
)
```

### 2. CSS埋め込みスクリプト (`scripts/embed-css.py`)

Python3を使用してHTMLテンプレートにCSSを埋め込み：

- 多言語文字（日本語）の安全な処理
- 複数行CSSファイルの正確な処理
- エラーハンドリングとログ出力

### 3. インライン対応テンプレート (`templates/page-template-inline.html`)

- `/* CSS_PLACEHOLDER */` マーカーでCSS挿入位置を指定
- フォールバック値付きCSS変数使用
- レスポンシブデザイン対応
- 日本語Webフォント最適化

## 🚀 ビルドプロセス

### GitHub Actions
```yaml
1. CSSファイル結合 (combine-css.sh)
2. HTMLテンプレート作成 (embed-css.py)
3. Markdown→HTML変換 (Pandoc)
4. GitHub Pages デプロイ
```

### ローカル開発
```bash
npm run build      # 全体ビルド
npm run css:combine # CSS結合のみ
npm run css:embed  # CSS埋め込みのみ
npm run test:build # ビルドテスト
```

## 🎨 CSS階層とカスケード

### 読み込み順序（重要度順）

1. **グローバル変数** (`global-vars.css`)
   - CSS カスタムプロパティ定義
   - システム全体の基本トークン

2. **テーマ変数** (`light-vars.css`, `medium-vars.css`)
   - カラーパレット
   - サイズスケール

3. **ベースコンポーネント** (`typography/`, `page/`)
   - テキストスタイル
   - レイアウト基盤

4. **UIコンポーネント** (`button/`, `icon/`)
   - インタラクティブ要素
   - 装飾的要素

5. **カスタムスタイル** (テンプレート内)
   - プロジェクト固有のスタイル
   - レスポンシブ調整

## 🔍 デバッグ方法

### 1. CSS結合確認
```bash
./scripts/combine-css.sh
cat temp/combined.css | head -50  # 先頭50行確認
```

### 2. HTML生成確認
```bash
npm run build
open output/index.html  # ブラウザで確認
```

### 3. ブラウザ開発者ツール
- **Elements** タブで`<style>`内のCSS確認
- **Console** タブでCSS変数エラー確認
- **Network** タブで外部ファイル読み込み確認

## ⚡ パフォーマンス最適化

### 利点
- ✅ **ゼロ外部リクエスト**: 全CSS埋め込み済み
- ✅ **高速初期表示**: CSSブロッキングなし
- ✅ **オフライン対応**: 外部依存なし
- ✅ **CDN効率**: HTMLファイルのみキャッシュ

### 注意点
- ⚠️ **ファイルサイズ増加**: HTMLファイルが大きくなる
- ⚠️ **キャッシュ効率**: CSS変更時にHTMLも再取得
- ⚠️ **デバッグ複雑化**: 結合後CSSの追跡が困難

## 🛠️ カスタマイズ方法

### 1. CSSファイル追加
`scripts/combine-css.sh` の `CSS_FILES` 配列に追加：

```bash
CSS_FILES=(
    # 既存ファイル...
    "css/custom/my-styles.css"  # 新規追加
)
```

### 2. テーマファイル追加
`THEME_FILES` 配列に追加：

```bash
THEME_FILES=(
    # 既存ファイル...
    "css/custom/dark-theme.css"  # ダークテーマ
)
```

### 3. カスタムスタイル修正
`templates/page-template-inline.html` の `<style>` 内を編集

## 🔄 メンテナンス

### 定期確認事項
- CSS変数の未定義エラー
- 結合後のファイルサイズ
- ブラウザ互換性
- レスポンシブデザイン動作

### トラブルシューティング
1. **CSS適用されない**: ビルドログでCSS結合状況確認
2. **レイアウト崩れ**: CSS変数フォールバック値確認
3. **文字化け**: Python3のUTF-8エンコーディング確認

## 📊 ファイル構成図

```
css/
├── tokens/custom/
│   ├── global-vars.css    → 結合順序: 1
│   ├── light-vars.css     → 結合順序: 2
│   └── medium-vars.css    → 結合順序: 3
├── typography/index.css   → 結合順序: 4
├── page/index.css         → 結合順序: 5
├── button/index.css       → 結合順序: 6
└── icon/index.css         → 結合順序: 7
              ↓
        [結合処理]
              ↓
    temp/combined.css
              ↓
        [HTML埋め込み]
              ↓
    output/*.html (CSS埋め込み済み)
```

この仕組みにより、GitHub Pagesでの確実なCSS適用と、開発効率の両立を実現しています。