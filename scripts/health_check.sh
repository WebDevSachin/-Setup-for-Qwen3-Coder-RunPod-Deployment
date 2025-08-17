#!/bin/bash
# Health check scripts

# Check if services are running
check_services() {
    echo "Checking services..."
    
    # Check Ollama
    if pgrep -f "ollama" > /dev/null; then
        echo "✅ Ollama is running"
    else
        echo "❌ Ollama is not running"
    fi
    
    # Check LiteLLM
    if pgrep -f "litellm" > /dev/null; then
        echo "✅ LiteLLM is running"
    else
        echo "❌ LiteLLM is not running"
    fi
}

# Check port binding
check_ports() {
    echo "Checking port binding..."
    
    # Check port 11434 (Ollama)
    if netstat -tlnp 2>/dev/null | grep :11434 > /dev/null; then
        echo "✅ Port 11434 (Ollama) is bound"
    else
        echo "❌ Port 11434 (Ollama) is not bound"
    fi
    
    # Check port 8000 (LiteLLM)
    if netstat -tlnp 2>/dev/null | grep :8000 > /dev/null; then
        echo "✅ Port 8000 (LiteLLM) is bound"
    else
        echo "❌ Port 8000 (LiteLLM) is not bound"
    fi
}

# Check model status
check_model() {
    echo "Checking model status..."
    
    # Test Ollama API
    if curl -s http://localhost:11434/api/tags > /dev/null; then
        echo "✅ Ollama API is responding"
    else
        echo "❌ Ollama API is not responding"
    fi
    
    # Test LiteLLM API
    if curl -s http://localhost:8000/health > /dev/null; then
        echo "✅ LiteLLM API is responding"
    else
        echo "❌ LiteLLM API is not responding"
    fi
}

# Main health check
echo "=== RunPod Health Check ==="
check_services
echo ""
check_ports
echo ""
check_model
echo ""
echo "=== Health Check Complete ==="