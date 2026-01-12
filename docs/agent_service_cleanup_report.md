# Отчет по очистке проекта agent_service

## Основные файлы для работы сервиса

### Конфигурация и настройки
- [`agent_service/app_settings.json`](agent_service/app_settings.json): Основные настройки приложения.
- [`agent_service/app_settings-dev.json`](agent_service/app_settings-dev.json): Настройки для разработки.
- [`agent_service/app_settings-prod.json`](agent_service/app_settings-prod.json): Настройки для продакшена.

### Основной код сервиса
- [`agent_service/app.py`](agent_service/app.py): Основное приложение.
- [`agent_service/agent_session.py`](agent_service/agent_session.py): Управление сессиями агента.
- [`agent_service/agent_system.py`](agent_service/agent_system.py): Основная логика агента.
- [`agent_service/langchain_tools.py`](agent_service/langchain_tools.py): Инструменты для работы с LangChain.
- [`agent_service/prompt_loader.py`](agent_service/prompt_loader.py): Загрузка промптов.

### Docker и развертывание
- [`agent_service/docker-compose-dev.yml`](agent_service/docker-compose-dev.yml): Docker Compose для разработки.
- [`agent_service/docker-compose-preprod.yml`](agent_service/docker-compose-preprod.yml): Docker Compose для пре-продакшена.
- [`agent_service/docker-compose-prod.yml`](agent_service/docker-compose-prod.yml): Docker Compose для продакшена.
- [`agent_service/Dockerfile-dev`](agent_service/Dockerfile-dev): Dockerfile для разработки.
- [`agent_service/Dockerfile-prod`](agent_service/Dockerfile-prod): Dockerfile для продакшена.

## Тесты
- [`agent_service/tests/test_agent_session.py`](agent_service/tests/test_agent_session.py): Тесты для сессий агента.
- [`agent_service/tests/test_agent_system_sessions.py`](agent_service/tests/test_agent_system_sessions.py): Тесты для системных сессий агента.
- [`agent_service/tests/test_interactive_quiz.py`](agent_service/tests/test_interactive_quiz.py): Тесты для интерактивных викторин.
- [`agent_service/tests/components/test_agent_rag_integration.py`](agent_service/tests/components/test_agent_rag_integration.py): Тесты для интеграции RAG.
- [`agent_service/tests/components/test_openrouter.py`](agent_service/tests/components/test_openrouter.py): Тесты для OpenRouter.
- [`agent_service/tests/components/test_rag_tools.py`](agent_service/tests/components/test_rag_tools.py): Тесты для инструментов RAG.
- [`agent_service/tests/components/test_simple_prompt.py`](agent_service/tests/components/test_simple_prompt.py): Тесты для простых промптов.
- [`agent_service/tests/components/test_test_generator_integration.py`](agent_service/tests/components/test_test_generator_integration.py): Тесты для интеграции генератора тестов.
- [`agent_service/tests/pipeline/test_chitchat_pipeline.py`](agent_service/tests/pipeline/test_chitchat_pipeline.py): Тесты для пайплайна чата.
- [`agent_service/tests/pipeline/test_quiz_pipeline.py`](agent_service/tests/pipeline/test_quiz_pipeline.py): Тесты для пайплайна викторин.
- [`agent_service/tests/pipeline/test_rag_pipeline.py`](agent_service/tests/pipeline/test_rag_pipeline.py): Тесты для пайплайна RAG.

### Документация
- [`agent_service/docs/agent_documentation.md`](agent_service/docs/agent_documentation.md): Документация агента.
- [`agent_service/docs/async_tools_setup.md`](agent_service/docs/async_tools_setup.md): Настройка асинхронных инструментов.
- [`agent_service/docs/docker_deployment.md`](agent_service/docs/docker_deployment.md): Развертывание с Docker.
- [`agent_service/docs/network_interaction.md`](agent_service/docs/network_interaction.md): Взаимодействие с сетью.
- [`agent_service/docs/project_architecture.md`](agent_service/docs/project_architecture.md): Архитектура проекта.
- [`agent_service/docs/release_notes.md`](agent_service/docs/release_notes.md): Заметки о релизах.
- [`agent_service/docs/test_documentation.md`](agent_service/docs/test_documentation.md): Документация по тестам.

### Промпты
- [`agent_service/prompts/intent_determination.txt`](agent_service/prompts/intent_determination.txt): Промпт для определения намерений.
- [`agent_service/prompts/reformat_latex.txt`](agent_service/prompts/reformat_latex.txt): Промпт для переформатирования LaTeX.
- [`agent_service/prompts/system_prompt.txt`](agent_service/prompts/system_prompt.txt): Системный промпт.

### LLM сервис
- [`agent_service/llm_service/llm_client.py`](agent_service/llm_service/llm_client.py): Клиент для работы с LLM.
- [`agent_service/llm_service/utils.py`](agent_service/llm_service/utils.py): Утилиты для LLM.

## Актуальные тесты для текущей версии кода

### Основные тесты
- [`agent_service/tests/test_agent_session.py`](agent_service/tests/test_agent_session.py): Тесты для сессий агента.
- [`agent_service/tests/test_agent_system_sessions.py`](agent_service/tests/test_agent_system_sessions.py): Тесты для системных сессий агента.
- [`agent_service/tests/test_interactive_quiz.py`](agent_service/tests/test_interactive_quiz.py): Тесты для интерактивных викторин.

### Тесты компонентов
- [`agent_service/tests/components/test_agent_rag_integration.py`](agent_service/tests/components/test_agent_rag_integration.py): Тесты для интеграции RAG.
- [`agent_service/tests/components/test_openrouter.py`](agent_service/tests/components/test_openrouter.py): Тесты для OpenRouter.
- [`agent_service/tests/components/test_rag_tools.py`](agent_service/tests/components/test_rag_tools.py): Тесты для инструментов RAG.
- [`agent_service/tests/components/test_simple_prompt.py`](agent_service/tests/components/test_simple_prompt.py): Тесты для простых промптов.
- [`agent_service/tests/components/test_test_generator_integration.py`](agent_service/tests/components/test_test_generator_integration.py): Тесты для интеграции генератора тестов.

### Тесты пайплайнов (перенести в интеграционные тесты)
- [`agent_service/tests/pipeline/test_chitchat_pipeline.py`](agent_service/tests/pipeline/test_chitchat_pipeline.py): Тесты для пайплайна чата.
- [`agent_service/tests/pipeline/test_quiz_pipeline.py`](agent_service/tests/pipeline/test_quiz_pipeline.py): Тесты для пайплайна викторин.
- [`agent_service/tests/pipeline/test_rag_pipeline.py`](agent_service/tests/pipeline/test_rag_pipeline.py): Тесты для пайплайна RAG.

## Список файлов для удаления

### Устаревшие или дублирующиеся файлы
1. **Файл**: [`agent_service/tests/test_agent_session_updated.py`](agent_service/tests/test_agent_session_updated.py)
   **Причина**: Дублирует функциональность [`agent_service/tests/test_agent_session.py`](agent_service/tests/test_agent_session.py).