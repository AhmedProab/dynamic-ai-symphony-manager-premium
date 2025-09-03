# 🚀 دليل التشغيل السريع - Quick Start Guide

## ✅ الخدمات التي تعمل حالياً:

```yaml
Docker Services: ✅ تعمل
- symphony-db (PostgreSQL): ✅ Running
- symphony-cache (Redis): ✅ Running  
- symphony-n8n (n8n): ✅ Running at http://localhost:5678
```

## 📝 خطوات التشغيل:

### 1. تثبيت التبعيات:
```bash
# تأكد أنك في المجلد الصحيح
cd ~/dynamic-ai-symphony-manager-premium

# تثبيت التبعيات
npm install
```

### 2. إعداد البيئة:
```bash
# انسخ ملف البيئة إذا لم يكن موجوداً
cp .env.example .env

# عدّل الإعدادات حسب حاجتك
nano .env
```

### 3. تشغيل الخدمات:
```bash
# Docker services (تعمل بالفعل ✅)
docker-compose up -d

# تشغيل السيرفر الرئيسي
npm start

# أو للتطوير مع auto-reload
npm run dev
```

## 🌐 الواجهات المتاحة:

| الخدمة | الرابط | الحالة | Credentials |
|--------|--------|--------|-------------|
| **n8n Dashboard** | http://localhost:5678 | ✅ يعمل | admin / Symphony2025 |
| **API Server** | http://localhost:3000 | ⏳ يحتاج npm start | - |
| **Health Check** | http://localhost:3000/health | ⏳ | - |
| **PostgreSQL** | localhost:5432 | ✅ يعمل | user/pass من .env |
| **Redis** | localhost:6379 | ✅ يعمل | - |

## 🛠️ أوامر مفيدة:

```bash
# عرض حالة Docker
docker ps

# عرض logs لـ n8n
docker-compose logs -f symphony-n8n

# إيقاف كل الخدمات
docker-compose down

# إعادة تشغيل الخدمات
docker-compose restart

# تنظيف وإعادة البناء
docker-compose down -v
docker-compose up -d --build
```

## 🔧 حل المشاكل:

### إذا فشل npm install:
```bash
# تنظيف npm cache
npm cache clean --force

# حذف node_modules إن وُجد
rm -rf node_modules package-lock.json

# إعادة التثبيت
npm install
```

### إذا كان Port 3000 مشغول:
```bash
# إيجاد العملية
lsof -i :3000

# إيقافها
kill -9 [PID]

# أو غيّر PORT في .env
PORT=3001
```

### إذا لم يعمل Docker:
```bash
# تأكد من تشغيل Docker Desktop
open -a Docker

# انتظر حتى يبدأ ثم:
docker-compose up -d
```

## ✅ التحقق من العمل:

1. **n8n**: http://localhost:5678 (يجب أن يفتح)
2. **Database**: 
   ```bash
   docker exec -it symphony-db psql -U user -d symphony
   ```
3. **Redis**:
   ```bash
   docker exec -it symphony-cache redis-cli ping
   # يجب أن يرد: PONG
   ```

## 📊 الحالة الحالية:

```
✅ GitHub Repository: تم الدفع بنجاح
✅ Docker Services: تعمل جميعها
✅ n8n: يعمل على localhost:5678
⏳ Node.js Server: يحتاج npm install & npm start
⏳ Shopify Integration: يحتاج إعداد API keys
```

---

**آخر تحديث:** September 02, 2025