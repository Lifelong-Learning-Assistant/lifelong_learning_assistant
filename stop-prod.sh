#!/bin/bash

# Скрипт для остановки сервисов с группировкой по проектам в Docker (PROD)

echo "🛑 Stopping Life Learning Assistant (PROD)..."

# Функция для остановки группы
stop_group() {
    local folder=$1
    local project_name=$2
    echo "📂 Stopping group: $project_name..."
    docker compose -f "$folder/docker-compose-prod.yml" -p "$project_name" down --remove-orphans
}

# Останавливаем в обратном порядке
stop_group "agent_service" "lifelong_learning-agent"
stop_group "web_ui_service" "lifelong_learning-web_ui"
stop_group "test_generator" "lifelong_learning-test_generator"
stop_group "rag" "lifelong_learning-rag"

echo "✅ All groups stopped!"