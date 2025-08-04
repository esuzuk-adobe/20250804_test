#!/bin/bash

# Markdown to HTML Build Script
# このスクリプトはMarkdownファイルをHTMLに変換し、CSSを適用します

set -e

echo "🚀 Starting build process..."

# Check if pandoc is installed
if ! command -v pandoc &> /dev/null; then
    echo "❌ Error: pandoc is not installed. Please install pandoc first."
    echo "   macOS: brew install pandoc"
    echo "   Ubuntu: sudo apt-get install pandoc"
    exit 1
fi

# Create output directory
echo "📁 Creating output directory..."
mkdir -p output

# Copy CSS files to output
echo "📄 Copying CSS files..."
cp -r css output/

# Combine CSS files
echo "🎨 Combining CSS files..."
mkdir -p temp
./scripts/combine-css.sh

# Create template with embedded CSS
echo "📄 Creating template with embedded CSS..."
python3 scripts/embed-css.py \
    templates/page-template-inline.html \
    temp/combined.css \
    temp/final-template.html

# Convert Markdown to HTML
echo "🔄 Converting Markdown files to HTML..."

for file in markdown/*.md; do
    if [ -f "$file" ]; then
        filename=$(basename "$file" .md)
        echo "   Converting: $file -> output/$filename.html"
        
        pandoc "$file" \
            --template=temp/final-template.html \
            --standalone \
            --to=html5 \
            -o "output/$filename.html"
    fi
done

# Clean up temporary files
echo "🧹 Cleaning up temporary files..."
rm -rf temp

echo "✅ Build completed successfully!"
echo "📂 Generated files are in the 'output' directory"
echo "🌐 You can serve the output directory with any web server"
echo ""
echo "To serve locally:"
echo "   cd output && python3 -m http.server 8000"
echo "   then open http://localhost:8000"