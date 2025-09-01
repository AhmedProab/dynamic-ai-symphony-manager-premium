#!/bin/bash

echo "🔧 إعداد n8n API للتحكم من Claude"
echo "====================================="

# 1. الحصول على API Key من n8n
echo "📝 خطوات الحصول على API Key:"
echo "1. افتح n8n: http://localhost:5678"
echo "2. اذهب إلى Settings → API"
echo "3. انسخ API Key"
echo ""
read -p "📋 الصق API Key هنا: " API_KEY

# 2. حفظ الإعدادات
cat > ~/.n8n-api-config << EOF
N8N_API_URL=http://localhost:5678/api/v1
N8N_API_KEY=$API_KEY
EOF

echo "✅ تم حفظ الإعدادات!"

# 3. اختبار الاتصال
echo -e "\n🔍 اختبار الاتصال..."
curl -s -H "X-N8N-API-KEY: $API_KEY" \
     http://localhost:5678/api/v1/workflows | jq '.data[0].name' 2>/dev/null && \
     echo "✅ الاتصال يعمل!" || echo "❌ فشل الاتصال"

echo "
╔══════════════════════════════════════════════════════════════╗
║          ✅ n8n API جاهز للتحكم من Claude                  ║
╚══════════════════════════════════════════════════════════════╝

يمكنك الآن:
1. إنشاء workflows برمجياً
2. تشغيل workflows
3. تعديل workflows
4. استيراد/تصدير

من داخل Claude Desktop!
"
