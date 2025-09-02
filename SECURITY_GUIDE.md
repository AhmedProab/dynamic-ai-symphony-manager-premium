# 🔐 دليل الملفات الحساسة - Security Guide

## ⚠️ مهم جداً - IMPORTANT

### الملفات الحساسة في المشروع:

| الملف | الغرض | الحالة | ملاحظة |
|-------|-------|--------|--------|
| **.env** | متغيرات البيئة وAPI Keys | ✅ موجود | **ضروري للتشغيل** |
| **.mcp.json** | تكوين MCP للعمل مع Claude | ✅ موجود | **ضروري لـ Claude** |
| **.claude.json** | إعدادات Claude Desktop | ✅ موجود | **ضروري لـ Claude Desktop** |
| **.roo/mcp.json** | تكوين Roo Code MCP | ✅ موجود | **ضروري لـ VS Code** |
| **.env.example** | قالب للمتغيرات | ✅ موجود | يُرفع على GitHub |
| **.env.backup** | نسخة احتياطية | ✅ موجود | **لا يُرفع على GitHub** |

## 🛡️ كيفية الحماية:

### 1. **الملفات موجودة محلياً للعمل** ✅
```bash
# هذه الملفات ضرورية وموجودة:
.env                 # للتشغيل المحلي
.mcp.json           # لـ Claude MCP
.claude.json        # لـ Claude Desktop
.roo/mcp.json      # لـ VS Code
```

### 2. **محمية من الرفع لـ GitHub** ✅
```bash
# كل هذه الملفات في .gitignore:
✅ .env
✅ .mcp.json
✅ .claude.json
✅ .roo/mcp.json
✅ *.backup
```

### 3. **للمطورين الجدد** 📝
```bash
# 1. انسخ القالب
cp .env.example .env

# 2. أضف API Keys الخاصة بك
nano .env

# 3. لا ترفع .env أبداً لـ GitHub!
```

## ❌ أخطاء شائعة يجب تجنبها:

### **خطأ 1: حذف الملفات الحساسة**
```bash
# ❌ خطأ - لا تحذف هذه الملفات
rm .env
rm .mcp.json

# ✅ الصحيح - احتفظ بها واحمها بـ .gitignore
```

### **خطأ 2: رفعها لـ GitHub**
```bash
# ❌ خطأ
git add .env
git add .mcp.json

# ✅ الصحيح - تأكد أنها في .gitignore
git status  # تأكد أنها غير مرئية
```

### **خطأ 3: وضع API Keys في الكود**
```javascript
// ❌ خطأ
const apiKey = "sk-ant-api03-xxxxx";

// ✅ الصحيح
const apiKey = process.env.ANTHROPIC_API_KEY;
```

## 🔄 النسخ الاحتياطي:

### **نسخ احتياطية آمنة:**
```bash
# إنشاء نسخة احتياطية
cp .env .env.backup.$(date +%Y%m%d)

# حفظ في مكان آمن (خارج Git)
mkdir -p ~/.config/symphony-backup/
cp .env ~/.config/symphony-backup/
```

## ✅ القاعدة الذهبية:

> **الملفات الحساسة يجب أن:**
> 1. **تبقى موجودة** في المشروع للعمل
> 2. **تُحمى** بواسطة .gitignore
> 3. **لا تُرفع أبداً** إلى GitHub
> 4. **تُنسخ احتياطياً** في مكان آمن

## 🚨 في حالة رفع ملف حساس بالخطأ:

```bash
# 1. احذف المستودع من GitHub فوراً
# 2. غيّر كل API Keys المكشوفة
# 3. نظف Git History
# 4. أنشئ مستودع جديد

# أو استخدم BFG Repo-Cleaner
java -jar bfg.jar --delete-files '.env'
git reflog expire --expire=now --all
git gc --prune=now --aggressive
```

---

**تذكر:** الأمان أولاً! 🔐

**آخر تحديث:** September 01, 2025