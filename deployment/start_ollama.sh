#!/bin/bash
# Start Ollama with Qwen3-Coder model

echo "Starting Ollama with Qwen3-Coder 480B model..."

# Stop any existing ollama processes
pkill -f ollama

# Start ollama server
ollama serve &

# Wait for server to start
sleep 5

# Load the 480B model
echo "Loading Qwen3-Coder 480B model..."
ollama run qwen3-coder:480b

echo "Ollama with 480B model started successfully"