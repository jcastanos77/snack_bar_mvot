#!/bin/bash

# Compila el proyecto
flutter build web

# Reemplaza el placeholder del base href en el index.html
INDEX_PATH="build/web/index.html"
sed -i '' 's|<base href="\$FLUTTER_BASE_HREF">|<base href="/">|' "$INDEX_PATH"

echo "✅ Flutter Web compilado y base href corregido."
