#!/bin/bash

# CSS Combination Script
# 複数のCSSファイルを連結して単一のファイルを生成します

set -e

echo "🎨 Combining CSS files..."

# Create temporary directory for processing
mkdir -p temp

# Output combined CSS file
OUTPUT_FILE="temp/combined.css"

# Clear output file
> "$OUTPUT_FILE"

echo "/* Combined CSS for Markdown to HTML Publisher */" >> "$OUTPUT_FILE"
echo "/* Generated automatically - DO NOT EDIT MANUALLY */" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# CSS files to combine in order (dependency order is important)
CSS_FILES=(
    "css/tokens/custom/global-vars.css"
    "css/tokens/custom/light-vars.css"
    "css/tokens/custom/medium-vars.css"
    "css/typography/index.css"
    "css/page/index.css"
    "css/button/index.css"
    "css/icon/index.css"
)

# Combine CSS files
for css_file in "${CSS_FILES[@]}"; do
    if [ -f "$css_file" ]; then
        echo "  Adding: $css_file"
        echo "" >> "$OUTPUT_FILE"
        echo "/* From: $css_file */" >> "$OUTPUT_FILE"
        cat "$css_file" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
    else
        echo "  ⚠️  Warning: $css_file not found, skipping..."
    fi
done

# Add any additional theme files that exist
THEME_FILES=(
    "css/page/themes/spectrum-two.css"
    "css/button/themes/spectrum-two.css"
    "css/icon/icons.css"
    "css/icon/workflow-icons.css"
    "css/icon/ui-icons.css"
)

for theme_file in "${THEME_FILES[@]}"; do
    if [ -f "$theme_file" ]; then
        echo "  Adding theme: $theme_file"
        echo "" >> "$OUTPUT_FILE"
        echo "/* From: $theme_file */" >> "$OUTPUT_FILE"
        cat "$theme_file" >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
    fi
done

echo "✅ CSS combination completed: $OUTPUT_FILE"
echo "📊 Combined file size: $(wc -c < "$OUTPUT_FILE") bytes"