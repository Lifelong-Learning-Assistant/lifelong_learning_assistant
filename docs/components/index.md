# Компоненты системы

Данный раздел содержит ссылки на актуальную документацию по всем компонентам системы Lifelong Learning Assistant. Документация поддерживается непосредственно внутри соответствующих сервисов.

## Основные сервисы

| Сервис | Описание | Документация |
|-----------|----------|------|
| **Agent Service** | Основной оркестратор системы (FastAPI + LangGraph) | [`agent_service/`](../../agent_service/README.md) |
| **RAG Service** | Сервис поиска по учебным материалам (FastAPI + Qdrant) | [`rag/`](../../rag/README.md) |
| **Test Generator** | Генератор квизов и оценка ответов | [`test_generator/`](../../test_generator/README.md) |
| **Web UI Service** | Веб-сервис: фронтенд (React) и бэкенд (FastAPI) | [`web_ui_service/`](../../web_ui_service/README.md) |

## Дополнительная информация

* **Архитектура системы**: [`architecture.md`](../architecture.md)
* **Обзор компонентов**: [`index.md`](../index.md)
* **Скрипты развертывания**: [`deployment/scripts.md`](../deployment/scripts.md)

---

*Документ обновлен: 2026-01-15*  
*Статус: Актуально (ссылки на внутреннюю документацию сервисов)*