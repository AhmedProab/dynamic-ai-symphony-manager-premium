#!/bin/bash

# ================================================================
# 🚀 Setup Script for Dynamic AI Symphony Manager Premium
# One command to rule them all!
# ================================================================

set -e

echo "
╔════════════════════════════════════════════════════════════════╗
║     🎼 Dynamic AI Symphony Manager Premium Setup              ║
║                          V16.1.0                              ║
╚════════════════════════════════════════════════════════════════╝
"

# Check prerequisites
echo "📋 Checking prerequisites..."

# Check Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found! Please install Node.js 20+"
    exit 1
fi
echo "✅ Node.js: $(node -v)"

# Check npm
if ! command -v npm &> /dev/null; then
    echo "❌ npm not found!"
    exit 1
fi
echo "✅ npm: $(npm -v)"

# Check Docker
if ! command -v docker &> /dev/null; then
    echo "❌ Docker not found! Please install Docker Desktop"
    exit 1
fi
echo "✅ Docker: $(docker -v)"

# Check Docker Compose
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose not found!"
    exit 1
fi
echo "✅ Docker Compose: $(docker-compose -v)"

# Setup environment
echo ""
echo "⚙️ Setting up environment..."
if [ ! -f .env ]; then
    cp .env.example .env
    echo "✅ Created .env file from template"
else
    echo "✅ .env file already exists"
fi

# Install dependencies
echo ""
echo "📦 Installing dependencies..."
npm install

# Start Docker services
echo ""
echo "🐳 Starting Docker services..."
docker-compose up -d

# Wait for services
echo ""
echo "⏳ Waiting for services to start..."
sleep 5

# Check services
echo ""
echo "🔍 Checking services..."
docker ps --format "table {{.Names}}\t{{.Status}}"

# Start application
echo ""
echo "🚀 Starting application..."
echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                                                                ║"
echo "║     ✅ Setup Complete!                                        ║"
echo "║                                                                ║"
echo "║     🌐 Services:                                              ║"
echo "║     • API Server: http://localhost:3000                       ║"
echo "║     • n8n Dashboard: http://localhost:5678                    ║"
echo "║       (Login: admin / Symphony2025)                           ║"
echo "║                                                                ║"
echo "║     📝 Next steps:                                            ║"
echo "║     1. Add your API keys to .env file                         ║"
echo "║     2. Import workflows: npm run workflows:import             ║"
echo "║     3. Start building! 🎉                                     ║"
echo "║                                                                ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# Start the server
npm start