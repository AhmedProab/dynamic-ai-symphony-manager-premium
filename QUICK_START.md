# 🎼 Symphony Manager - دليل البدء السريع

## ✅ الخطوة 1: إزالة المشروع القديم من Claude

```bash
cd ~/dynamic-ai-agents-manager-premium
chmod +x focus-on-symphony.sh
./focus-on-symphony.sh
```

## ✅ الخطوة 2: بدء Symphony

```bash
cd ~/dynamic-ai-symphony-manager-premium
chmod +x start-symphony.sh
./start-symphony.sh
```

## 🎯 الخطوة 3: أول Workflow في n8n

### Workflow 1: Shopify Order Processing
1. **Webhook Node** - استقبال Shopify orders
2. **AI Node** - تحليل الطلب
3. **Email Node** - إرسال تأكيد ذكي

### Workflow 2: AI Product Descriptions
1. **Shopify Node** - جلب منتجات جديدة
2. **OpenAI Node** - توليد وصف
3. **Shopify Node** - تحديث المنتج

### Workflow 3: Customer Support Bot
1. **Webhook** - استقبال رسائل
2. **AI Chain** - معالجة ذكية
3. **Response** - رد تلقائي

## 📚 الموارد المفيدة

- [n8n Documentation](https://docs.n8n.io)
- [Shopify API](https://shopify.dev/api)
- [OpenAI Integration](https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.openai/)

## 🚀 نصائح احترافية

1. **ابدأ بسيط** - workflow واحد بسيط
2. **اختبر كثيراً** - استخدم Test Workflow
3. **احفظ دائماً** - Ctrl+S بعد كل تغيير
4. **استخدم Variables** - لا تكرر البيانات

## 🎨 أفكار متقدمة

- **Multi-AI Pipeline**: GPT-4 → Claude → Gemini
- **Smart Inventory**: AI predictions للمخزون
- **Dynamic Pricing**: AI-based pricing strategy
- **Customer Insights**: AI analysis للعملاء

---

## ⚡ الأوامر السريعة

```bash
# إعادة تشغيل الخدمات
docker-compose restart

# عرض السجلات
docker-compose logs -f n8n

# إيقاف كل شيء
docker-compose down

# تشغيل كل شيء
docker-compose up -d
```

## 🆘 حل المشاكل

### n8n لا يعمل؟
```bash
docker-compose down
docker-compose up -d
```

### نسيت كلمة المرور؟
- User: admin
- Pass: Symphony2025

### Port 5678 مشغول؟
```bash
lsof -i :5678
kill -9 [PID]
```

---

**تم التحديث:** 2025-08-13
**بواسطة:** Ahmed Abdullah
**المشروع:** Dynamic AI Symphony Manager Premium
