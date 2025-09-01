#!/bin/bash

echo "🚀 تثبيت n8n-MCP Server لـ Claude Desktop"
echo "=========================================="

# 1. Clone المشروع
echo "📦 تحميل n8n-MCP..."
cd ~/
git clone https://github.com/czlonkowski/n8n-mcp.git
cd n8n-mcp

# 2. تثبيت Dependencies
echo "📦 تثبيت المكتبات..."
npm install

# 3. إعداد Configuration
echo "⚙️ إعداد الإعدادات..."
cat > config.json << 'EOF'
{
  "N8N_API_URL": "http://localhost:5678",
  "N8N_API_KEY": "YOUR_API_KEY_HERE",
  "ENABLE_WORKFLOW_MANAGEMENT": true
}
EOF

# 4. تحديث Claude Desktop Config
echo "🔧 إضافة MCP Server لـ Claude..."
cat > ~/update-claude-mcp.json << 'EOF'
{
  "mcpServers": {
    "filesystem-symphony": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "/Users/ahmedabdullah/dynamic-ai-symphony-manager-premium"
      ]
    },
    "n8n-mcp": {
      "command": "node",
      "args": ["/Users/ahmedabdullah/n8n-mcp/dist/index.js"],
      "env": {
        "N8N_API_URL": "http://localhost:5678",
        "N8N_API_KEY": "${N8N_API_KEY}"
      }
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_TOKEN": "${GITHUB_TOKEN}"
      }
    },
    "sequential-thinking": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sequential-thinking"]
    },
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"]
    }
  }
}
EOF

echo "
╔══════════════════════════════════════════════════════════════╗
║         ✅ n8n-MCP Server جاهز للتثبيت!                    ║
╚══════════════════════════════════════════════════════════════╝

الخطوات التالية:
================
1. احصل على API Key من n8n:
   - افتح http://localhost:5678
   - Settings → API → Create API Key

2. عدّل config.json:
   cd ~/n8n-mcp
   nano config.json
   (أضف API Key)

3. بناء المشروع:
   npm run build

4. طبق على Claude:
   cp ~/update-claude-mcp.json ~/Library/Application\\ Support/Claude/claude_desktop_config.json

5. أعد تشغيل Claude Desktop

بعدها يمكنك:
==============
- 'search n8n nodes for email'
- 'create workflow for shopify'
- 'show me webhook node properties'
- 'build multi-agent system'

🎯 المميزات:
- 535+ n8n nodes documentation
- إنشاء workflows مباشرة
- تشغيل workflows
- معرفة خصائص كل node
"
