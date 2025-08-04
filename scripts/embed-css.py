#!/usr/bin/env python3
"""
CSS Embedding Script
HTMLテンプレートにCSSファイルを埋め込みます
"""

import sys
import os

def embed_css(template_path, css_path, output_path):
    """HTMLテンプレートにCSSを埋め込む"""
    
    # CSSファイルを読み込み
    try:
        with open(css_path, 'r', encoding='utf-8') as f:
            css_content = f.read()
    except FileNotFoundError:
        print(f"❌ Error: CSS file not found: {css_path}")
        sys.exit(1)
    except Exception as e:
        print(f"❌ Error reading CSS file: {e}")
        sys.exit(1)
    
    # HTMLテンプレートを読み込み
    try:
        with open(template_path, 'r', encoding='utf-8') as f:
            template_content = f.read()
    except FileNotFoundError:
        print(f"❌ Error: Template file not found: {template_path}")
        sys.exit(1)
    except Exception as e:
        print(f"❌ Error reading template file: {e}")
        sys.exit(1)
    
    # CSSを埋め込み
    final_content = template_content.replace("/* CSS_PLACEHOLDER */", css_content)
    
    # 出力ファイルに書き込み
    try:
        os.makedirs(os.path.dirname(output_path), exist_ok=True)
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(final_content)
    except Exception as e:
        print(f"❌ Error writing output file: {e}")
        sys.exit(1)
    
    print(f"✅ CSS embedded successfully")
    print(f"   Template: {template_path}")
    print(f"   CSS: {css_path}")
    print(f"   Output: {output_path}")
    print(f"   CSS size: {len(css_content):,} characters")

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: python3 embed-css.py <template_path> <css_path> <output_path>")
        sys.exit(1)
    
    template_path = sys.argv[1]
    css_path = sys.argv[2]
    output_path = sys.argv[3]
    
    embed_css(template_path, css_path, output_path)