# Troubleshooting Guide

## Common Issues

### 1. Connection Refused
**Problem**: API returns connection refused errors
**Solution**:
```bash
# Check if services are running
ps aux | grep -E "(ollama|litellm)"

# Check port binding
netstat -tlnp | grep :11434
netstat -tlnp | grep :8000

# Restart services
./deployment/start_ollama.sh
```

### 2. Authentication Failed
**Problem**: API returns 401 Unauthorized
**Solution**:
```bash
# Verify API key
cat /workspace/api-key.txt

# Test with curl
curl https://your-endpoint/v1/models \
  -H "Authorization: Bearer $(cat /workspace/api-key.txt)"
```

### 3. Model Loading Issues
**Problem**: Model fails to load or takes too long
**Solution**:
```bash
# Check available memory
free -h

# Check disk space
df -h

# Restart Ollama service
pkill -f ollama
ollama serve &
```

### 4. VS Code Integration Problems
**Problem**: Cline extension not working
**Solution**:
1. Verify API endpoint URL
2. Check API key is correct
3. Restart VS Code
4. Check VS Code console for errors

## Debugging Commands

### Check Logs
```bash
# Ollama logs
tail -f /workspace/logs/ollama.log

# LiteLLM logs
tail -f /workspace/logs/litellm.log
```

### Test Endpoints
```bash
# Test Ollama
curl http://localhost:11434/api/tags

# Test LiteLLM
curl http://localhost:8000/health

# Test with API key
curl http://localhost:8000/v1/models \
  -H "Authorization: Bearer YOUR_API_KEY"
```

### Resource Monitoring
```bash
# Check GPU usage
nvidia-smi

# Check memory usage
free -h

# Check disk usage
df -h
```

## Recovery Procedures

### Service Restart
```bash
# Stop all services
pkill -f ollama
pkill -f litellm

# Wait a moment
sleep 5

# Start services
./deployment/start_ollama.sh
```

### Model Recovery
```bash
# List models
ollama list

# If model missing, pull it again
ollama pull qwen3-coder:480b
```

### Configuration Reset
```bash
# Reset LiteLLM config
cp deployment/litellm-config.yaml.backup configs/litellm-config.yaml

# Restart services
./deployment/start_ollama.sh