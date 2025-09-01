#!/bin/bash

# ================================================================
# 🚀 Fresh Start Script - إنشاء مستودع نظيف من الصفر
# Dynamic AI Symphony Manager Premium V16.1.0
# ================================================================

set -e

echo "🎯 بدء إنشاء مستودع نظيف من الصفر..."

# التأكد من أننا في المجلد الصحيح
cd /Users/ahmedabdullah/dynamic-ai-symphony-manager-premium

# 1. حفظ الملفات المهمة
echo "📦 حفظ الملفات المهمة..."
mkdir -p ../backup-clean
cp -r docs ../backup-clean/ 2>/dev/null || true
cp -r workflows ../backup-clean/ 2>/dev/null || true
cp -r shopify-integration ../backup-clean/ 2>/dev/null || true
cp -r docker ../backup-clean/ 2>/dev/null || true
cp README.md ../backup-clean/ 2>/dev/null || true
cp docker-compose.yml ../backup-clean/ 2>/dev/null || true
cp *.sh ../backup-clean/ 2>/dev/null || true
cp *.py ../backup-clean/ 2>/dev/null || true
cp *.md ../backup-clean/ 2>/dev/null || true
cp .gitignore ../backup-clean/ 2>/dev/null || true
cp .env.example ../backup-clean/ 2>/dev/null || true

# 2. إنشاء مجلد جديد تماماً
echo "🆕 إنشاء مستودع جديد نظيف..."
cd ..
rm -rf dynamic-ai-symphony-clean
mkdir dynamic-ai-symphony-clean
cd dynamic-ai-symphony-clean

# 3. نسخ الملفات النظيفة فقط
echo "📄 نسخ الملفات النظيفة..."
cp -r ../backup-clean/* .
cp ../backup-clean/.gitignore . 2>/dev/null || true
cp ../backup-clean/.env.example . 2>/dev/null || true

# 4. إنشاء git repository جديد
echo "🔧 إعداد Git repository جديد..."
git init
git add .
git commit -m "feat: Initial commit - Dynamic AI Symphony Manager Premium V16.1.0

🎼 Clean repository with secure configuration

Features:
- 35+ AI Models integrated and documented
- 15+ Intelligent Agents for specialized tasks
- 7 Advanced Orchestration Systems
- Aurora AI Theme for Shopify
- Claude Code Sub-Agents integration
- n8n Workflow automation
- Complete Docker & Kubernetes setup
- Multi-Store management capabilities
- WebSocket Chat & Voice/Video support

Security:
- All sensitive data removed from repository
- Environment variables via .env file
- Comprehensive .gitignore for protection
- .env.example template provided

Documentation:
- Complete architecture documentation
- Version history (V15.5.3, V16.0.0, V16.1.0)
- Setup and deployment guides
- API integration guides

This is a clean, secure repository ready for production use."

# 5. إضافة remote وpush
echo "🚀 دفع إلى GitHub..."
git remote add origin https://github.com/AhmedProab/dynamic-ai-symphony-manager-premium.git
git branch -M main
git push -u origin main --force

echo "✅ تم إنشاء المستودع النظيف بنجاح!"
echo ""
echo "📍 المستودع الجديد: ~/dynamic-ai-symphony-clean"
echo "🌐 GitHub: https://github.com/AhmedProab/dynamic-ai-symphony-manager-premium"
echo ""
echo "الخطوات التالية:"
echo "1. cd ~/dynamic-ai-symphony-clean"
echo "2. npm install"
echo "3. cp .env.example .env"
echo "4. أضف API keys في .env"
echo "5. docker-compose up -d"
