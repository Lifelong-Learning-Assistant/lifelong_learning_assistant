#!/bin/bash

# Скрипт для сборки всех Docker образов для PROD окружения

echo "🔨 Building all Docker images for PROD mode..."

# Функция для сборки образа
build_image() {
    local folder=$1
    local dockerfile=$2
    local image_name=$3
    echo "📦 Building: $image_name"
    (cd "$folder" && docker build -f "$dockerfile" -t "$image_name" .)
    if [ $? -eq 0 ]; then
        echo "✅ Successfully built: $image_name"
    else
        echo "❌ Failed to build: $image_name"
        exit 1
    fi
}

# 1. User Service
build_image "user_service" "Dockerfile-prod" "ghcr.io/lifelong-learning-assisttant/user_service:v001"

# 2. RAG Service
build_image "rag" "Dockerfile" "ghcr.io/lifelong-learning-assisttant/rag-api:v001"

# 3. Test Generator
build_image "test_generator" "Dockerfile" "ghcr.io/lifelong-learning-assisttant/test_generator:v001"

# 4. Web UI Backend
build_image "web_ui_service/backend" "Dockerfile-prod" "ghcr.io/lifelong-learning-assisttant/web_ui_backend:v001"

# 5. Web UI Frontend
build_image "web_ui_service/frontend" "Dockerfile-prod" "ghcr.io/lifelong-learning-assisttant/web_ui_frontend:v001"

# 6. Agent Service
build_image "agent_service" "Dockerfile-prod" "ghcr.io/lifelong-learning-assisttant/agent_service:v001"

echo ""
echo "🎉 All images built successfully!"
echo ""
echo "Built images:"
echo "  - ghcr.io/lifelong-learning-assisttant/user_service:v001"
echo "  - ghcr.io/lifelong-learning-assisttant/rag-api:v001"
echo "  - ghcr.io/lifelong-learning-assisttant/test_generator:v001"
echo "  - ghcr.io/lifelong-learning-assisttant/web_ui_backend:v001"
echo "  - ghcr.io/lifelong-learning-assisttant/web_ui_frontend:v001"
echo "  - ghcr.io/lifelong-learning-assisttant/agent_service:v001"
echo ""
echo "📝 To push images to GHCR, run:"
echo "  docker push ghcr.io/lifelong-learning-assisttant/user_service:v001"
echo "  docker push ghcr.io/lifelong-learning-assisttant/rag-api:v001"
echo "  docker push ghcr.io/lifelong-learning-assisttant/test_generator:v001"
echo "  docker push ghcr.io/lifelong-learning-assisttant/web_ui_backend:v001"
echo "  docker push ghcr.io/lifelong-learning-assisttant/web_ui_frontend:v001"
echo "  docker push ghcr.io/lifelong-learning-assisttant/agent_service:v001"
