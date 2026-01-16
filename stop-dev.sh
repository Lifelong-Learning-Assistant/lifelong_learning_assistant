#!/bin/bash

# Скрипт для остановки сервисов с группировкой по проектам в Docker

echo "🛑 Stopping Life Learning Assistant (DEV)..."

# Функция для остановки группы
stop_group() {
    local folder=$1
    local project_name=$2
    echo "📂 Stopping group: $project_name..."
    (cd "$folder" && docker compose -f docker-compose-dev.yml -p "$project_name" down)
}

# Останавливаем в обратном порядке
stop_group "agent_service" "lifelong_learning-agent"
stop_group "web_ui_service" "lifelong_learning-web_ui"
stop_group "test_generator" "lifelong_learning-test_generator"
stop_group "rag" "lifelong_learning-rag"

echo "✅ All groups stopped!"