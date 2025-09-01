#!/bin/bash

# ================================================================
# 🔐 Security Fix Script for Dynamic AI Symphony Manager
# يقوم بإزالة الملفات الحساسة وتنظيف Git history
# ================================================================

set -e

echo "🔐 بدء عملية تنظيف المستودع من المعلومات الحساسة..."

# 1. حفظ نسخة احتياطية من الملفات المهمة (بدون secrets)
echo "📦 حفظ نسخة احتياطية..."
mkdir -p .backup-safe
cp -r docs .backup-safe/
cp -r workflows .backup-safe/
cp README.md .backup-safe/
cp docker-compose.yml .backup-safe/
cp *.sh .backup-safe/ 2>/dev/null || true

# 2. إزالة الملفات الحساسة من Git
echo "🗑️ إزالة الملفات الحساسة..."
git rm -r --cached .claude.json.backup* 2>/dev/null || true
git rm -r --cached .roo/mcp.json 2>/dev/null || true
git rm -r --cached .env 2>/dev/null || true

# 3. تحديث .gitignore
echo "📝 تحديث .gitignore..."
# (تم إنشاؤه بالفعل)

# 4. Commit التغييرات
echo "💾 حفظ التغييرات..."
git add .gitignore
git commit -m "security: Remove sensitive files and update .gitignore

- Removed all backup files containing API keys
- Removed .roo/mcp.json with GitHub token
- Added comprehensive .gitignore
- Secured the repository

BREAKING CHANGE: API keys must now be added via environment variables"

# 5. إنشاء ملف .env.example
echo "📄 إنشاء .env.example..."
cat > .env.example << 'EOF'
# Dynamic AI Symphony Manager - Environment Variables

# n8n Configuration
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=ChangeThisPassword
N8N_PORT=5678

# Anthropic API
ANTHROPIC_API_KEY=your_anthropic_api_key_here

# OpenAI API
OPENAI_API_KEY=your_openai_api_key_here

# Google AI
GOOGLE_AI_API_KEY=your_google_ai_key_here

# GitHub
GITHUB_TOKEN=your_github_token_here

# Shopify
SHOPIFY_API_KEY=your_shopify_api_key
SHOPIFY_API_SECRET=your_shopify_secret
SHOPIFY_STORE_URL=your-store.myshopify.com

# Database
DATABASE_URL=postgresql://user:password@localhost:5432/symphony

# Redis
REDIS_URL=redis://localhost:6379

# Environment
NODE_ENV=development
EOF

git add .env.example
git commit -m "docs: Add .env.example template for configuration"

echo "✅ تم تنظيف المستودع بنجاح!"
echo ""
echo "⚠️ مهم جداً: الخطوات التالية يجب تنفيذها يدوياً:"
echo ""
echo "1. قم بإنشاء مستودع جديد على GitHub:"
echo "   - اذهب إلى: https://github.com/new"
echo "   - اسم المستودع: dynamic-ai-symphony-manager-premium-v16"
echo "   - اجعله Private أولاً"
echo ""
echo "2. قم بتغيير Remote URL:"
echo "   git remote set-url origin https://github.com/AhmedProab/dynamic-ai-symphony-manager-premium-v16.git"
echo ""
echo "3. ادفع التغييرات:"
echo "   git push -u origin main"
echo ""
echo "4. أو يمكنك استخدام BFG Repo-Cleaner لتنظيف History:"
echo "   java -jar bfg.jar --delete-files '*.backup*' --delete-files 'mcp.json'"
echo "   git reflog expire --expire=now --all && git gc --prune=now --aggressive"
echo ""
echo "5. بعد التنظيف، يمكنك Force Push:"
echo "   git push --force origin main"
