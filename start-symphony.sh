#!/bin/bash

echo "🎼 بدء العمل على Symphony Manager"
echo "===================================="

# التحقق من Docker
echo "🐳 فحص Docker containers..."
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" | grep symphony

echo -e "\n📊 حالة الخدمات:"
echo "=================="

# فحص n8n
if curl -s http://localhost:5678 > /dev/null 2>&1; then
    echo "✅ n8n يعمل على: http://localhost:5678"
    echo "   Login: admin / Symphony2025"
else
    echo "⚠️ n8n لا يعمل. تشغيله الآن..."
    docker-compose up -d
    echo "⏳ انتظر 10 ثواني..."
    sleep 10
fi

# فحص postgres
if docker exec symphony-db pg_isready -U n8n > /dev/null 2>&1; then
    echo "✅ PostgreSQL يعمل"
else
    echo "⚠️ PostgreSQL لا يعمل"
fi

# فحص Redis
if docker exec symphony-cache redis-cli ping > /dev/null 2>&1; then
    echo "✅ Redis يعمل"
else
    echo "⚠️ Redis لا يعمل"
fi

echo "
╔══════════════════════════════════════════════════════════════╗
║              🚀 جاهز للعمل على Symphony!                   ║
╚══════════════════════════════════════════════════════════════╝

📋 خطة العمل:
============
1. افتح n8n في المتصفح
2. أنشئ أول workflow
3. اربط مع Shopify API
4. أضف AI automations

🔗 الروابط المهمة:
==================
n8n Dashboard: http://localhost:5678
Login: admin / Symphony2025

💡 أفكار Workflows:
==================
- Shopify Order → AI Analysis → Email
- Product Update → AI Description → Shopify
- Customer Query → AI Response → Support Ticket
- Inventory Low → AI Prediction → Reorder

🎯 ابدأ الآن:
"
open http://localhost:5678
