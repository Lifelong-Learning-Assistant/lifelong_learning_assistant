#!/bin/bash

# Скрипт для последовательного запуска сервисов с группировкой по проектам в Docker (PROD)

echo "🚀 Starting Life Learning Assistant (PROD)..."

# Экспортируем токен для WebSocket (используется в docker-compose-prod.yml)
export WS_TOKEN=dev_token_123

# Функция для запуска группы
start_group() {
    local folder=$1
    local project_name=$2
    echo "📂 Starting group: $project_name (folder: $folder)..."
    docker compose -f "$folder/docker-compose-prod.yml" -p "$project_name" up -d
}

# 1. RAG Group (База знаний)
start_group "rag" "lifelong_learning-rag"

# 2. Test Generator Group
start_group "test_generator" "lifelong_learning-test_generator"

# 3. Web UI Group (Backend + Frontend)
start_group "web_ui_service" "lifelong_learning-web_ui"

# 4. Agent Service (Оркестратор - запускаем последним)
start_group "agent_service" "lifelong_learning-agent"

echo "✅ All groups started in PROD mode!"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"