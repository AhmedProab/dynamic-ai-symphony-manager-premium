#!/usr/bin/env python3
"""
n8n Control Script - يمكن لـ Claude استخدامه للتحكم في n8n
"""

import json
import requests
import os
from typing import Dict, List, Any

class N8NController:
    def __init__(self):
        self.base_url = "http://localhost:5678/api/v1"
        self.api_key = os.getenv("N8N_API_KEY", "")
        self.headers = {
            "X-N8N-API-KEY": self.api_key,
            "Content-Type": "application/json"
        }
    
    def create_workflow(self, workflow_json: Dict) -> Dict:
        """إنشاء workflow جديد"""
        response = requests.post(
            f"{self.base_url}/workflows",
            headers=self.headers,
            json=workflow_json
        )
        return response.json()
    
    def import_workflow(self, workflow_file: str) -> Dict:
        """استيراد workflow من ملف JSON"""
        with open(workflow_file, 'r') as f:
            workflow = json.load(f)
        return self.create_workflow(workflow)
    
    def execute_workflow(self, workflow_id: str, data: Dict = None) -> Dict:
        """تشغيل workflow"""
        response = requests.post(
            f"{self.base_url}/workflows/{workflow_id}/execute",
            headers=self.headers,
            json={"data": data or {}}
        )
        return response.json()
    
    def list_workflows(self) -> List[Dict]:
        """عرض كل الـ workflows"""
        response = requests.get(
            f"{self.base_url}/workflows",
            headers=self.headers
        )
        return response.json().get("data", [])
    
    def create_shopify_workflow(self):
        """إنشاء Shopify AI Workflow"""
        workflow = {
            "name": "Shopify AI Assistant (Created by Claude)",
            "active": True,
            "nodes": [
                {
                    "parameters": {
                        "path": "ai-chat",
                        "responseMode": "responseNode",
                        "options": {
                            "allowedOrigins": "*"
                        }
                    },
                    "id": "webhook_1",
                    "name": "Chat Trigger",
                    "type": "n8n-nodes-base.webhook",
                    "typeVersion": 1.1,
                    "position": [250, 300]
                },
                {
                    "parameters": {
                        "prompt": {
                            "messages": [
                                {
                                    "role": "system",
                                    "content": "أنت مساعد ذكي لمتجر Shopify. ساعد العملاء في:\n- البحث عن المنتجات\n- معلومات الطلبات\n- الدعم الفني"
                                },
                                {
                                    "role": "user", 
                                    "content": "={{ $json.body.message }}"
                                }
                            ]
                        },
                        "options": {
                            "temperature": 0.7,
                            "maxTokens": 1000
                        }
                    },
                    "id": "ai_agent",
                    "name": "AI Agent",
                    "type": "@n8n/n8n-nodes-langchain.agent",
                    "typeVersion": 1,
                    "position": [550, 300]
                },
                {
                    "parameters": {},
                    "id": "respond_1",
                    "name": "Respond",
                    "type": "n8n-nodes-base.respondToWebhook",
                    "typeVersion": 1,
                    "position": [850, 300]
                }
            ],
            "connections": {
                "Chat Trigger": {
                    "main": [[{"node": "AI Agent", "type": "main", "index": 0}]]
                },
                "AI Agent": {
                    "main": [[{"node": "Respond", "type": "main", "index": 0}]]
                }
            }
        }
        return self.create_workflow(workflow)
    
    def create_multi_agent_workflow(self):
        """إنشاء Multi-Agent System"""
        workflow = {
            "name": "Multi-Agent Shopify System",
            "active": True,
            "nodes": [
                # Master Agent
                {
                    "parameters": {
                        "prompt": {
                            "messages": [
                                {
                                    "role": "system",
                                    "content": "أنت المدير الرئيسي. وزع المهام على:\n- Sales Agent\n- Support Agent\n- Analytics Agent"
                                }
                            ]
                        }
                    },
                    "id": "master_agent",
                    "name": "Master Agent",
                    "type": "@n8n/n8n-nodes-langchain.agent",
                    "position": [250, 300]
                },
                # Sales Agent Tool
                {
                    "parameters": {
                        "name": "Sales Agent",
                        "description": "يتعامل مع المبيعات والعروض"
                    },
                    "id": "sales_tool",
                    "name": "Sales Agent Tool",
                    "type": "@n8n/n8n-nodes-langchain.toolAgent",
                    "position": [550, 200]
                },
                # Support Agent Tool
                {
                    "parameters": {
                        "name": "Support Agent",
                        "description": "يتعامل مع دعم العملاء"
                    },
                    "id": "support_tool",
                    "name": "Support Agent Tool",
                    "type": "@n8n/n8n-nodes-langchain.toolAgent",
                    "position": [550, 400]
                }
            ],
            "connections": {
                "Master Agent": {
                    "ai_tool": [
                        [{"node": "Sales Agent Tool", "type": "ai_tool", "index": 0}],
                        [{"node": "Support Agent Tool", "type": "ai_tool", "index": 0}]
                    ]
                }
            }
        }
        return self.create_workflow(workflow)

# للاستخدام المباشر
if __name__ == "__main__":
    controller = N8NController()
    
    print("🚀 n8n Controller Ready!")
    print("=" * 50)
    
    # عرض الـ workflows الموجودة
    workflows = controller.list_workflows()
    print(f"📋 عدد الـ Workflows: {len(workflows)}")
    
    for wf in workflows:
        print(f"  - {wf['name']} (ID: {wf['id']})")
    
    print("\n💡 يمكنك الآن:")
    print("1. controller.create_shopify_workflow()")
    print("2. controller.create_multi_agent_workflow()")
    print("3. controller.import_workflow('file.json')")
    print("4. controller.execute_workflow('workflow_id')")
