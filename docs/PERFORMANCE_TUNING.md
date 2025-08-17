# Performance Tuning Guide

## Memory Optimization

### 1. Model Quantization
Use quantized versions for memory efficiency:
```bash
# 4-bit quantized model
ollama pull qwen3-coder:30b-a3b-q4_K_M

# 8-bit quantized model  
ollama pull qwen3-coder:30b-a3b-q8_0
```

### 2. GPU Memory Management
```bash
# Monitor GPU usage
nvidia-smi

# Set memory limits (if using Docker)
docker run --gpus all --memory=24g your-image
```

## API Performance

### 1. Worker Configuration
```yaml
# In litellm-config.yaml
general_settings:
  num_workers: 4  # Adjust based on CPU cores
  request_timeout: 300  # 5 minute timeout
```

### 2. Caching Strategy
Implement response caching for frequently requested prompts:
```bash
# Use Redis for caching (optional)
pip install redis
```

## Monitoring

### 1. Health Checks
```bash
# Regular health check
curl https://your-endpoint/v1/health

# Model status
curl https://your-endpoint/v1/models
```

### 2. Logging
```bash
# Monitor logs
tail -f /workspace/logs/ollama.log
tail -f /workspace/logs/litellm.log
```

## Resource Optimization

### CPU Usage
```bash
# Limit CPU cores (if using Docker)
docker run --cpus="4" your-image

# Monitor CPU usage
top -p $(pgrep ollama)
```

### Disk I/O Optimization
```bash
# Use SSD storage for model files
# Mount models directory to fast storage
```

## Scaling Strategies

### Horizontal Scaling
```bash
# Run multiple model instances
ollama run qwen3-coder:480b &
ollama run qwen3-coder:30b &
```

### Load Balancing
```bash
# Use NGINX for load balancing (advanced)
# Configure multiple backend servers
```

## Performance Testing

### Benchmark Scripts
```bash
# Test response time
time curl https://your-endpoint/v1/chat/completions \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"model": "qwen3-coder", "messages": [{"role": "user", "content": "Hello"}]}'
```

### Stress Testing
```bash
# Use tools like Apache Bench
ab -n 100 -c 10 \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -p test-payload.json \
  https://your-endpoint/v1/chat/completions
```

## Optimization Tips

### 1. Model Selection
- Use 480B for maximum performance
- Use 30B for balanced performance/memory
- Use quantized versions for memory constraints

### 2. Prompt Engineering
- Keep prompts concise and specific
- Use system messages for context
- Cache frequent prompts

### 3. Response Management
- Set appropriate max_tokens
- Use streaming for long responses
- Implement proper error handling