#!/bin/bash

# Скрипт для первичной инициализации системы на новом сервере

echo "🌟 Initializing Life Learning Assistant on a new server..."

# 1. Создание Docker-сетей
echo "🌐 Creating Docker networks..."
docker network create rag_rag_network 2>/dev/null || echo "Network rag_rag_network already exists"
docker network create test_generator_default 2>/dev/null || echo "Network test_generator_default already exists"
docker network create web_ui_network 2>/dev/null || echo "Network web_ui_network already exists"
docker network create user_service_network 2>/dev/null || echo "Network user_service_network already exists"

# 1.5 Создание Docker томов (volumes)
echo "📦 Creating Docker volumes..."
docker volume create rag_qdrant_storage 2>/dev/null || echo "Volume rag_qdrant_storage already exists"
docker volume create rag_redis_data 2>/dev/null || echo "Volume rag_redis_data already exists"
docker volume create user_postgres_data 2>/dev/null || echo "Volume user_postgres_data already exists"

# 2. Инициализация RAG (Qdrant + Redis)
echo "📚 Bootstrapping RAG Service (Knowledge Base)..."
(cd rag && docker compose -f docker-compose-bootstrap.yml up --abort-on-container-exit)

if [ $? -eq 0 ]; then
    echo "✅ RAG Bootstrap successful."
else
    echo "❌ RAG Bootstrap failed!"
    exit 1
fi

# Очистка временных контейнеров бутстрапа, но сохранение томов
(cd rag && docker compose -f docker-compose-bootstrap.yml down)

# 3. Инициализация User Service (PostgreSQL + Migrations)
echo "👤 Bootstrapping User Service (Database + Migrations)..."
(cd user_service && docker compose -f user-service/docker-compose-bootstrap.yml up --abort-on-container-exit)

if [ $? -eq 0 ]; then
    echo "✅ User Service Bootstrap successful."
else
    echo "❌ User Service Bootstrap failed!"
    exit 1
fi

# Очистка временных контейнеров бутстрапа
(cd user_service && docker compose -f docker-compose-bootstrap.yml down)

echo ""
echo "🎉 System initialization completed successfully!"
echo "🚀 You can now start the production environment using:"
echo "   ./start-prod.sh"