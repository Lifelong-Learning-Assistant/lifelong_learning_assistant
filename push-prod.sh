#!/bin/bash

# Скрипт для отправки всех Docker образов в GHCR

echo "📤 Pushing all Docker images to GHCR..."

# Функция для пуша образа
push_image() {
    local image_name=$1
    echo "📤 Pushing: $image_name"
    docker push "$image_name"
    if [ $? -eq 0 ]; then
        echo "✅ Successfully pushed: $image_name"
    else
        echo "❌ Failed to push: $image_name"
        exit 1
    fi
}

# Пушим все образы
push_image "ghcr.io/lifelong-learning-assisttant/user_service:v001"
push_image "ghcr.io/lifelong-learning-assisttant/rag-api:v001"
push_image "ghcr.io/lifelong-learning-assisttant/test_generator:v001"
push_image "ghcr.io/lifelong-learning-assisttant/web_ui_backend:v001"
push_image "ghcr.io/lifelong-learning-assisttant/web_ui_frontend:v001"
push_image "ghcr.io/lifelong-learning-assisttant/agent_service:v001"

echo ""
echo "🎉 All images pushed successfully!"
