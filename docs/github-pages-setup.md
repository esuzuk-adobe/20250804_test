# GitHub Pages セットアップガイド

このドキュメントでは、GitHub Pagesの設定方法を詳しく説明します。

## 📋 セットアップ手順

### 1. リポジトリでのGitHub Pages有効化

1. GitHubでリポジトリを開く
2. **Settings** タブをクリック
3. 左サイドバーの **Pages** をクリック
4. **Source** セクションで以下を選択：
   - **Deploy from a branch** ではなく **GitHub Actions** を選択

### 2. ワークフロー権限の設定

GitHub Actionsがページをデプロイできるよう権限を設定：

1. リポジトリの **Settings** > **Actions** > **General**
2. **Workflow permissions** セクションで：
   - **Read and write permissions** を選択
   - **Allow GitHub Actions to create and approve pull requests** をチェック

### 3. 環境の設定（自動作成されますが確認）

1. **Settings** > **Environments**
2. `github-pages` 環境が存在することを確認
3. 存在しない場合は、初回デプロイ時に自動作成されます

## 🔧 トラブルシューティング

### よくある問題と解決方法

#### 1. "Error: Not Found" エラー

**症状**: GitHub Actionsでデプロイ時に404エラー

**解決方法**:
- Settings > Pages で **GitHub Actions** が選択されているか確認
- リポジトリが **Public** であるか確認（Privateの場合は有料プランが必要）

#### 2. "Permission denied" エラー

**症状**: GitHub ActionsでPages作成権限エラー

**解決方法**:
- Settings > Actions > General > Workflow permissions で **Read and write permissions** を有効化
- GITHUB_TOKEN に適切な権限があることを確認

#### 3. CSSが読み込まれない

**症状**: HTMLは表示されるがスタイルが適用されない

**解決方法**:
- GitHub Actions ログで CSS ファイルがコピーされているか確認
- ブラウザの開発者ツールでCSSファイルのパスを確認
- `templates/page-template.html` の CSS パスが相対パスになっているか確認

#### 4. GitHub Actions ワークフローが実行されない

**症状**: コミット後にワークフローが起動しない

**解決方法**:
- `.github/workflows/publish.yml` ファイルが正しい場所にあるか確認
- YAML の構文エラーがないか確認
- リポジトリの **Actions** タブで実行履歴を確認

## 🌐 デプロイされたサイトの確認

デプロイが成功すると、以下のURLでサイトにアクセスできます：

```
https://{username}.github.io/{repository-name}/
```

例：
- ユーザー名: `esuzuki`
- リポジトリ名: `20250804_test`
- URL: `https://esuzuki.github.io/20250804_test/`

## 📊 デプロイステータスの確認

### GitHub Actions 実行状況

1. リポジトリの **Actions** タブを開く
2. 最新のワークフロー実行をクリック
3. 各ステップの実行状況とログを確認

### デプロイメント履歴

1. リポジトリの **Deployments** セクション（右サイドバー）
2. または **Settings** > **Pages** でデプロイメント履歴を確認

## 🔄 更新フロー

### 通常のコンテンツ更新

1. `markdown/` フォルダ内のファイルを編集
2. コミット・プッシュ
3. GitHub Actions が自動実行
4. 数分後にサイトが更新される

### CSSやテンプレートの更新

1. `css/` や `templates/` フォルダ内のファイルを編集
2. ローカルでテスト（`npm run dev`）
3. コミット・プッシュ
4. 自動デプロイ

## 🚀 パフォーマンス最適化

### キャッシュ効率化

GitHub Pagesは自動的にCDNを使用しますが、追加最適化として：

- 画像ファイルは圧縮して使用
- CSSは必要な部分のみ読み込み
- 大きなCSSファイルは minify を検討

### ビルド時間短縮

- 不要なCSSファイルは除外
- Pandoc変換のオプションを最適化
- GitHub Actions キャッシュを活用

## 🔐 セキュリティ

### リポジトリの公開設定

- GitHub Pages用リポジトリは通常 **Public** に設定
- センシティブな情報は含めない
- `.gitignore` でローカルファイルを除外

### シークレット管理

- `GITHUB_TOKEN` は自動で提供される
- 追加のAPIキーなどが必要な場合はリポジトリシークレットを使用

## 📝 メンテナンス

### 定期的な確認事項

- GitHub Actions の実行状況
- ログファイルの確認
- 依存関係の更新（Pandoc、Node.js バージョンなど）
- デッドリンクの確認

### バックアップ

- GitHub リポジトリ自体がバックアップ
- 生成された HTML は `output/` フォルダで確認可能
- ローカルでのビルドも可能なため復旧は容易