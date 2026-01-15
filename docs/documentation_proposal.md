# Предложение по реструктуризации документации проекта Lifelong Learning Assistant

## 1. Концепция распределения
Документация делится на два уровня:
- **Центральная (docs/)**: Высокоуровневая архитектура, взаимодействие компонентов, руководства по развертыванию всей системы, общие стандарты и FAQ.
- **Компонентная (внутри сервисов)**: Детальное описание API конкретного сервиса, его внутренняя архитектура, специфичные настройки и инструкции по локальному запуску/тестированию.

## 2. Предлагаемая структура

### Корневая документация (docs/)
- [`01-overview.md`](docs/01-overview.md): Общая цель и карта системы.
- [`03-architecture.md`](docs/03-architecture.md): Глобальные sequence diagrams (как в `agent_service/docs/agent_documentation.md`).
- [`deployment_scripts.md`](docs/deployment_scripts.md): Инструкции по `start-dev.sh` / `stop-dev.sh`.
- [`components/index.md`](docs/components/index.md): Список всех сервисов со ссылками на их внутреннюю документацию.
- [`FAQ/`](docs/FAQ/): Общие вопросы по системе.

### Сервисная документация (пример для agent_service)
- `agent_service/README.md`: Быстрый старт сервиса.
- `agent_service/docs/api.md`: Описание эндпоинтов (на базе `app.py`).
- `agent_service/docs/architecture.md`: Описание LangGraph и системы сессий.
- `agent_service/docs/testing.md`: Как запускать тесты.

## 3. План актуализации
1. **README.md (корень)**: Обновить ссылки на актуальные порты (8270 для агента) и компоненты.
2. **agent_service**: Синхронизировать `agent_documentation.md` с кодом (LangGraph узлы, WebSocket).
3. **rag**: Дополнить `README.md` описанием эндпоинтов `/search` и `/rag`.
4. **test_generator**: Обновить `README.md`, указав актуальный порт 52812.
5. **.kilocode/rules**: Обновить правила, чтобы они соответствовали новой структуре документации.

## 4. Связи (Links)
Все документы должны использовать относительные пути для удобства навигации в VS Code и GitHub.
Например, из центрального `docs/components/index.md` ссылка на RAG: `[RAG Service](../../rag/README.md)`.