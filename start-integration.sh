#!/bin/bash

echo "
╔══════════════════════════════════════════════════════════════╗
║       🚀 Claude + n8n Integration Wizard                     ║
╚══════════════════════════════════════════════════════════════╝
"

echo "اختر طريقة التكامل:"
echo "===================="
echo "1) 🎯 Quick Import (الأسهل - موصى به)"
echo "2) 🔧 API Setup (متوسط)"
echo "3) 🐍 Python Controller (متقدم)"
echo "4) 🌟 MCP Server (احترافي)"
echo "5) 📚 اقرأ الدليل الكامل"
echo ""
read -p "اختر رقم (1-5): " choice

case $choice in
    1)
        echo "🎯 Quick Import Method"
        echo "====================="
        
        # فتح n8n
        open http://localhost:5678
        
        # فتح مجلد الـ workflows
        open ~/dynamic-ai-symphony-manager-premium/workflows/
        
        echo "
✅ تم فتح:
1. n8n في المتصفح
2. مجلد الـ workflows

📋 الخطوات:
1. في n8n: Menu → Import from File
2. اختر: symphony-complete.json
3. اضغط Import
4. Execute Workflow!

🎉 مبروك! Workflow جاهز للعمل!
        "
        ;;
        
    2)
        echo "🔧 API Setup"
        echo "==========="
        chmod +x setup-n8n-api.sh
        ./setup-n8n-api.sh
        ;;
        
    3)
        echo "🐍 Python Controller"
        echo "==================="
        echo "تثبيت المكتبات..."
        pip3 install requests
        
        echo "تشغيل Controller..."
        python3 n8n_controller.py
        ;;
        
    4)
        echo "🌟 MCP Server Installation"
        echo "========================="
        chmod +x install-n8n-mcp.sh
        ./install-n8n-mcp.sh
        ;;
        
    5)
        echo "📚 فتح الدليل..."
        open CLAUDE_N8N_INTEGRATION_GUIDE.md
        ;;
        
    *)
        echo "❌ اختيار غير صحيح"
        ;;
esac

echo "
💡 نصيحة سريعة:
===============
يمكنك دائماً أن تطلب مني:
'اكتب لي workflow يفعل X'
وسأعطيك JSON كامل جاهز للـ import!

🆘 للمساعدة:
اسأل: 'كيف أستورد workflow في n8n؟'
"
