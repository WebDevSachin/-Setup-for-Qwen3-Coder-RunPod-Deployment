# Qwen3-Coder RunPod Ollama API

Deploy Qwen3-Coder (30B/480B) on RunPod GPU with Ollama and LiteLLM proxy. Complete setup with secure OpenAI-compatible API endpoint, authentication, persistent storage, automated backups, and VS Code integration.

## 🚀 Features
- Secure OpenAI-compatible API endpoint
- API key authentication
- Persistent storage configuration
- Automated backup system
- VS Code integration ready
- Multi-model support (30B/480B)
- Production-ready deployment

## 🛠️ Requirements
- RunPod account with GPU instance
- Docker (optional but recommended)
- VS Code with Cline extension

## 📁 Project Structure
```
runpod/
├── README.md
├── VSCODE_INTEGRATION.md
├── deployment/
│   ├── start_ollama.sh
│   ├── backup_config.sh
│   └── litellm-config.yaml
├── scripts/
│   ├── model_management.sh
│   └── health_check.sh
├── configs/
│   ├── .env.example
│   └── docker-compose.yml
└── docs/
    ├── TROUBLESHOOTING.md
    └── PERFORMANCE_TUNING.md
```

## 📋 Setup Instructions
1. Create RunPod instance with PyTorch template
2. Install Ollama and required dependencies
3. Pull Qwen3-Coder model
4. Configure LiteLLM proxy with authentication
5. Start services with deployment scripts
6. Configure VS Code integration

## 🎯 Usage
- API Endpoint: `https://your-runpod-endpoint.runpod.io/v1`
- Model Names: `qwen3-coder`, `gpt-3.5-turbo`, `gpt-4`
- Authentication: Bearer token required