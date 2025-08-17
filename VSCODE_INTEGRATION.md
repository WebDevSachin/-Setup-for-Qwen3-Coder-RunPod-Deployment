# VS Code Integration Guide

## 🚀 Setup Instructions

### 1. Install Cline Extension
1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X)
3. Search for "Cline" and install

### 2. Configure Cline Settings
Add to VS Code `settings.json`:
```json
{
  "cline.customModel": "qwen3-coder",
  "cline.customEndpoint": "https://your-runpod-endpoint.runpod.io/v1",
  "cline.customApiKey": "YOUR_API_KEY_HERE"
}
```

### 3. Environment Variables (Alternative)
Set in your terminal:
```bash
export OPENAI_API_KEY="YOUR_API_KEY_HERE"
export OPENAI_BASE_URL="https://your-runpod-endpoint.runpod.io/v1"
```

## 🧪 Testing Integration
```bash
# Test API access
curl https://your-runpod-endpoint.runpod.io/v1/models \
  -H "Authorization: Bearer YOUR_API_KEY_HERE"
```

## 🎯 Common Tasks
- Code explanation: Select code and ask Cline to explain
- Code generation: Ask Cline to write functions, classes, or scripts
- Bug fixing: Highlight problematic code and ask for fixes
- Code optimization: Request performance improvements
- Documentation: Generate docstrings and comments