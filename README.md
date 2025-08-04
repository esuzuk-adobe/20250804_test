# Markdown to HTML Publisher

このプロジェクトは、MarkdownファイルをHTMLに変換し、GitHub Pagesで自動パブリッシュするシステムです。

## 📁 ディレクトリ構造

```
20250804_test/
├── .github/
│   └── workflows/
│       └── publish.yml          # GitHub Actions ワークフロー
├── markdown/                    # Markdownファイル（コンテンツ）
│   ├── index.md
│   ├── about.md
│   └── contact.md
├── templates/                   # HTMLテンプレート
│   └── page-template.html
├── css/                        # CSSスタイル（Spectrum CSS）
│   ├── tokens/                 # デザイントークン
│   ├── typography/             # タイポグラフィ
│   ├── button/                 # ボタンコンポーネント
│   ├── icon/                   # アイコンコンポーネント
│   └── page/                   # ページレイアウト
├── scripts/                    # ビルドスクリプト
│   ├── build.sh               # ローカルビルド
│   └── serve.sh               # ローカルサーバー
├── output/                     # 生成されたHTMLファイル
└── package.json               # プロジェクト設定
```

## 🚀 使用方法

### 前提条件

以下がインストールされている必要があります：

- **Node.js** (v18以上)
- **Pandoc** (MarkdownをHTMLに変換)

#### Pandocのインストール

```bash
# macOS
brew install pandoc

# Ubuntu/Debian
sudo apt-get install pandoc

# Windows
# https://pandoc.org/installing.html からダウンロード
```

### ローカル開発

1. **ビルド実行**
   ```bash
   npm run build
   # または
   ./scripts/build.sh
   ```

2. **ローカルサーバー起動**
   ```bash
   npm run serve
   # または
   ./scripts/serve.sh
   ```

3. **開発モード（ビルド + サーバー起動）**
   ```bash
   npm run dev
   ```

4. **生成ファイルのクリーンアップ**
   ```bash
   npm run clean
   ```

### GitHub Pages での自動デプロイ

1. **GitHub Pages の有効化**
   - GitHubリポジトリの Settings > Pages
   - Source を "GitHub Actions" に設定

2. **Markdownファイルの編集**
   - `markdown/` フォルダ内のファイルを編集
   - Frontmatter（YAML形式）でメタデータを設定可能

3. **プッシュして自動デプロイ**
   ```bash
   git add .
   git commit -m "Update content"
   git push origin main
   ```

## 📝 Markdownファイルの書き方

Markdownファイルの先頭にFrontmatterを追加できます：

```markdown
---
title: ページタイトル
date: 2025-08-04
---

# コンテンツ

ここにMarkdownコンテンツを書きます。
```

### 利用可能なFrontmatterフィールド

- `title`: ページタイトル（HTMLの`<title>`タグとh1見出しに使用）
- `date`: 公開日（ページ上に表示）

## 🎨 CSSカスタマイズ

このプロジェクトは Adobe Spectrum CSS デザインシステムを使用しています。

### テンプレートのカスタマイズ

`templates/page-template.html` を編集することで、HTMLの構造やスタイルを変更できます。

### CSSの追加

1. **既存のコンポーネントを使用**: `css/` フォルダ内の既存コンポーネントを活用
2. **カスタムスタイル**: テンプレート内の `<style>` タグにCSSを追加
3. **新しいCSSファイル**: `css/` フォルダに新しいファイルを作成し、テンプレートで読み込み

## 🔧 トラブルシューティング

### よくある問題

1. **Pandocが見つからない**
   ```
   Error: pandoc is not installed
   ```
   → Pandocをインストールしてください

2. **GitHub Actions が失敗する**
   - リポジトリの Settings > Pages で "GitHub Actions" が選択されているか確認
   - Actions タブでエラーログを確認

3. **CSSが適用されない**
   - `templates/page-template.html` のCSS読み込みパスを確認
   - ビルド時にCSSファイルが正しくコピーされているか確認

### デバッグ

ローカルでビルドしてエラーを確認：

```bash
./scripts/build.sh
```

## 🌟 機能

- ✅ MarkdownからHTMLへの自動変換
- ✅ Spectrum CSS デザインシステム統合
- ✅ GitHub Actions による自動デプロイ
- ✅ ローカル開発環境
- ✅ レスポンシブデザイン
- ✅ Frontmatter サポート
- ✅ 日本語対応

## 📄 ライセンス

MIT License
