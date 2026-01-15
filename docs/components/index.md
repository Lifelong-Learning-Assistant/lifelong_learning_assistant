# Компоненты системы

Данный раздел содержит ссылки на актуальную документацию по всем компонентам системы Lifelong Learning Assistant. Документация поддерживается непосредственно внутри соответствующих сервисов.

## Основные сервисы

| Сервис | Описание | Документация |
|-----------|----------|------|
| **Agent Service** | Основной оркестратор системы (FastAPI + LangGraph) | [`agent_service/docs/`](../../agent_service/docs/) |
| **RAG Service** | Сервис поиска по учебным материалам (FastAPI + Qdrant) | [`rag/docs/`](../../rag/docs/) |
| **Test Generator** | Генератор квизов и оценка ответов | [`test_generator/docs/`](../../test_generator/docs/) |
| **Web UI Service** | Веб-сервис: фронтенд (React) и бэкенд (FastAPI) | [`web_ui_service/docs/`](../../web_ui_service/docs/) |

## Дополнительная информация

* **Архитектура системы**: [`03-architecture.md`](../03-architecture.md)
* **Обзор компонентов**: [`01-overview.md`](../01-overview.md)
* **Скрипты развертывания**: [`deployment_scripts.md`](../deployment_scripts.md)

---

*Документ обновлен: 2026-01-15*  
*Статус: Актуально (ссылки на внутреннюю документацию сервисов)*