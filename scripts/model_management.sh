#!/bin/bash
# Model management scripts

# List all models
list_models() {
    echo "Available models:"
    ollama list
}

# Pull specific model
pull_model() {
    local model_name=$1
    echo "Pulling $model_name..."
    ollama pull $model_name
}

# Run model
run_model() {
    local model_name=$1
    echo "Running $model_name..."
    ollama run $model_name
}

# Export model
export_model() {
    local model_name=$1
    local output_file=$2
    echo "Exporting $model_name to $output_file..."
    ollama export $model_name > $output_file
}

# Main script logic
case "$1" in
    "list")
        list_models
        ;;
    "pull")
        pull_model $2
        ;;
    "run")
        run_model $2
        ;;
    "export")
        export_model $2 $3
        ;;
    *)
        echo "Usage: $0 {list|pull|run|export} [model_name] [output_file]"
        exit 1
        ;;
esac