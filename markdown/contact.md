---
title: Contact - お問い合わせ
date: 2025-08-04
---

# Contact - お問い合わせ

[🏠 ホーム](index.html) | [ℹ️ About Us](about.html) | [🎨 CSS Demo](design-system-demo.html)

---

このページでは様々なコンタクト方法をご紹介しています。お気軽にお声がけください。

## 📞 連絡先情報

### 基本情報

**プロジェクト名**: Markdown to HTML Publisher  
**開発者**: Web Development Team  
**メールアドレス**: `contact@example.com`  
**GitHub**: [github.com/username/20250804_test](https://github.com/username/20250804_test)

## 📧 お問い合わせフォーム

以下の項目についてご連絡いただけます：

### 📝 お問い合わせ種別

1. **技術的なご質問**
   - セットアップに関する質問
   - エラーの解決方法
   - カスタマイズのご相談

2. **機能のご要望**
   - 新機能の提案
   - 改善のアイデア
   - UIデザインの提案

3. **バグレポート**
   - 動作不良の報告
   - 表示崩れの報告
   - パフォーマンス問題

### 🏷️ 優先度レベル

| 優先度 | 対応時間 | 対象 |
|--------|----------|------|
| 🔴 **緊急** | 24時間以内 | セキュリティ問題、サービス停止 |
| 🟡 **高** | 3営業日以内 | 機能障害、重要なバグ |
| 🟢 **中** | 1週間以内 | 一般的な質問、要望 |
| ⚫ **低** | 2週間以内 | ドキュメント、小さな改善 |

## 🛠️ トラブルシューティング

### よくある質問 (FAQ)

#### Q1: CSSが適用されません
```bash
# ローカルビルドで確認
npm run build
open output/index.html
```

**解決策**:
- ビルドプロセスが正常に完了しているか確認
- ブラウザのキャッシュをクリア
- 開発者ツールでHTML内のCSSを確認

#### Q2: GitHub Actionsが失敗します

**チェックポイント**:
1. **Pandocインストール** - ワークフローでインストールされているか
2. **ファイルパス** - 大文字小文字の区別
3. **権限設定** - GitHub Pagesの権限確認

```yaml
# .github/workflows/publish.yml の設定例
permissions:
  contents: read
  pages: write
  id-token: write
```

#### Q3: ローカル環境が動作しません

**前提条件の確認**:
- [ ] Node.js v18以上
- [ ] Python 3
- [ ] Pandoc

```bash
# バージョン確認コマンド
node --version
python3 --version
pandoc --version
```

### 🐛 バグ報告テンプレート

バグを報告する際は、以下の情報をお知らせください：

```markdown
## 環境情報
- OS: macOS 14.6 / Ubuntu 22.04 / Windows 11
- ブラウザ: Chrome 120.0 / Firefox 121.0 / Safari 17.0
- Node.js: v18.20.8

## 再現手順
1. ○○をクリック
2. △△を入力
3. □□ボタンを押下

## 期待される動作
正常に○○が表示される

## 実際の動作
エラーメッセージが表示される

## スクリーンショット
（可能であれば添付）

## 追加情報
その他関連する情報があれば
```

## 🤝 コントリビューション

### 開発に参加したい方

1. **リポジトリのフォーク**
   ```bash
   git clone https://github.com/your-username/20250804_test.git
   cd 20250804_test
   ```

2. **ローカル環境のセットアップ**
   ```bash
   npm install
   npm run build
   npm run serve
   ```

3. **開発ブランチの作成**
   ```bash
   git checkout -b feature/your-feature-name
   ```

4. **プルリクエストの作成**
   - 明確な説明文
   - テスト済みのコード
   - ドキュメントの更新

### 📋 開発ガイドライン

#### コーディング規約
- **HTML**: セマンティックなマークアップ
- **CSS**: Spectrum CSSデザインシステムに準拠  
- **JavaScript**: ES2020以降の構文
- **Markdown**: 日本語と英語の混在OK

#### コミットメッセージ
```
type: 簡潔な説明

詳細な説明（必要に応じて）

- 変更点1
- 変更点2
```

**Types**: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

## 📞 その他の連絡手段

### ソーシャルメディア

- **Twitter**: [@project_name](https://twitter.com/project_name)
- **Discord**: コミュニティサーバー招待リンク
- **Slack**: 開発者向けワークスペース

### 📅 定期ミーティング

**開発チーム定例会**:
- **日時**: 毎週水曜日 19:00-20:00 JST
- **場所**: オンライン (Zoom/Google Meet)
- **参加方法**: [ミーティングリンク](https://example.com/meeting)

## 🙏 謝辞

このプロジェクトは以下のオープンソースプロジェクトの恩恵を受けています：

- [Pandoc](https://pandoc.org/) - 文書変換ツール
- [Adobe Spectrum CSS](https://spectrum.adobe.com/) - デザインシステム
- [GitHub Pages](https://pages.github.com/) - ホスティングサービス

---

**最終更新**: 2025年8月4日  
**お問い合わせ対応時間**: 平日 9:00-18:00 JST

*お忙しい中お読みいただき、ありがとうございます。*
