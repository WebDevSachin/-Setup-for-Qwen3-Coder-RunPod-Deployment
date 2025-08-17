#!/bin/bash
# Backup configuration and models

BACKUP_DIR="/home/ollama/backups"
DATE=$(date +%Y%m%d_%H%M%S)

echo "Creating backup..."
mkdir -p $BACKUP_DIR

# Backup model list
ollama list > $BACKUP_DIR/model_list_$DATE.txt

# Backup configuration files
cp -r /root/.ollama/* $BACKUP_DIR/ 2>/dev/null || true

echo "Backup completed: $BACKUP_DIR/model_list_$DATE.txt"