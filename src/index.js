/**
 * 🎼 Dynamic AI Symphony Manager Premium V16.1.0
 * Main Entry Point
 */

require('dotenv').config();
const express = require('express');
const { logger } = require('./utils/logger');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Health Check
app.get('/health', (req, res) => {
  res.json({
    status: 'healthy',
    version: '16.1.0',
    services: {
      n8n: process.env.N8N_URL || 'http://localhost:5678',
      database: 'postgresql',
      cache: 'redis'
    },
    timestamp: new Date().toISOString()
  });
});

// Root endpoint
app.get('/', (req, res) => {
  res.json({
    name: 'Dynamic AI Symphony Manager Premium',
    version: '16.1.0',
    description: 'Advanced Shopify management with AI',
    features: [
      '35+ AI Models',
      '15+ Intelligent Agents',
      '7 Orchestration Systems',
      'Aurora AI Theme',
      'Claude Code Sub-Agents',
      'n8n Workflow Automation'
    ],
    endpoints: {
      health: '/health',
      api: '/api/v1',
      docs: '/docs',
      n8n: process.env.N8N_URL || 'http://localhost:5678'
    }
  });
});

// API Routes (placeholder)
app.use('/api/v1', (req, res) => {
  res.json({
    message: 'API v1 - Under Development',
    availableEndpoints: [
      '/api/v1/ai-models',
      '/api/v1/agents',
      '/api/v1/workflows',
      '/api/v1/shopify'
    ]
  });
});

// Error handling
app.use((err, req, res, next) => {
  logger.error('Server Error:', err);
  res.status(500).json({
    error: 'Internal Server Error',
    message: process.env.NODE_ENV === 'development' ? err.message : 'Something went wrong'
  });
});

// Start server
app.listen(PORT, () => {
  console.log(`
╔════════════════════════════════════════════════════════════════╗
║                                                                ║
║     🎼 Dynamic AI Symphony Manager Premium V16.1.0            ║
║                                                                ║
║     Server running at: http://localhost:${PORT}                   ║
║     n8n Dashboard: http://localhost:5678                      ║
║     Documentation: http://localhost:${PORT}/docs                  ║
║                                                                ║
║     Environment: ${process.env.NODE_ENV || 'development'}                                  ║
║     Ready to orchestrate AI magic! 🚀                         ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝
  `);
  
  logger.info(`Server started on port ${PORT}`);
});

// Graceful shutdown
process.on('SIGTERM', () => {
  logger.info('SIGTERM signal received: closing HTTP server');
  app.close(() => {
    logger.info('HTTP server closed');
    process.exit(0);
  });
});

module.exports = app;