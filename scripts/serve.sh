#!/bin/bash

# Local Development Server Script
# ローカル開発サーバーを起動します

set -e

# Check if output directory exists
if [ ! -d "output" ]; then
    echo "❌ Output directory not found. Please run the build script first:"
    echo "   ./scripts/build.sh"
    exit 1
fi

# Start local server
echo "🌐 Starting local development server..."
echo "📂 Serving files from ./output directory"
echo "🔗 Open http://localhost:8000 in your browser"
echo ""
echo "Press Ctrl+C to stop the server"

cd output
python3 -m http.server 8000