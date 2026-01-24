# План рефакторинга Docker инфраструктуры (2026 Best Practices)

**Статус:** Запланировано (Backlog)
**Приоритет:** Высокий (Технический долг)

## Обоснование

Текущая инфраструктура проекта использует дублирование конфигураций (`docker-compose-dev.yml` и `docker-compose-prod.yml`) и простые Dockerfile. Это приводит к следующим проблемам:
1.  **Рассинхронизация:** Изменения в DEV часто забывают перенести в PROD.
2.  **Медленные сборки:** Отсутствие оптимизации кэширования слоев (особенно для Python зависимостей).
3.  **Большой размер образов:** В PROD попадают инструменты разработки.
4.  **Сложность поддержки:** Необходимость править несколько файлов для одного изменения.

Внедрение современных практик (Multi-stage builds, `uv`, Compose Include) решит эти проблемы, ускорит CI/CD и повысит стабильность.

## Цели

1.  **Унификация Dockerfile:** Один файл для всех сред (DEV, TEST, PROD).
2.  **Оптимизация сборки:** Использование `uv` для молниеносной установки зависимостей и кэширования.
3.  **DRY (Don't Repeat Yourself) в Compose:** Выделение общей базы и использование переопределений.

## Технические детали

### 1. Multi-stage Dockerfile с `uv`

Использовать единый `Dockerfile` с целевыми стадиями (`target`).

**Пример структуры:**
*   **Base:** `python:3.13-slim`. Установка `uv`.
*   **Builder:** Копирование `uv.lock`, установка зависимостей в `/app/.venv`. Компиляция байт-кода.
*   **Dev (Target):** Копирование venv. Код не копируется (монтируется через volume). Запуск через `uv run`.
*   **Prod (Target):** Копирование venv. Копирование исходного кода. Создание non-root пользователя. Запуск через `python`.

**Преимущества:**
*   Идентичное окружение (версии библиотек) в DEV и PROD.
*   Минимальный размер PROD образа (нет компиляторов, uv, кэшей).

### 2. Иерархия Docker Compose

Переход от дублирования к наследованию/включению.

*   `compose.base.yml`: Определение сервисов, сетей, volumes, `depends_on`.
*   `compose.dev.yml`:
    *   `include: [compose.base.yml]`
    *   `build: { target: dev }`
    *   `volumes: [ .:/app ]` (Hot reload)
    *   `command: [ "uv", "run", "uvicorn", "--reload" ]`
*   `compose.prod.yml`:
    *   `include: [compose.base.yml]`
    *   `image: ghcr.io/...`
    *   `restart: always`

### 3. Именование контейнеров

Строгое разделение сред через суффиксы имен контейнеров, но использование единых сетевых алиасов для взаимодействия сервисов.

## Источники (Best Practices 2026)

При подготовке плана использовались следующие материалы:

1.  **"Docker for Full Stack Developers in 2026"** (Nucamp)
    *   *Ключевая идея:* Четкое разделение Dev (bind mounts, hot reload) и Prod (static assets, optimized builds).
2.  **"Optimal Dockerfile for Python with uv"** (Depot.dev)
    *   *Ключевая идея:* Использование `uv` для кэширования зависимостей и multi-stage сборок для уменьшения размера.
    *   [Ссылка на документацию](https://depot.dev/docs/container-builds/optimal-dockerfiles/python-uv-dockerfile)
3.  **"How to Use Docker Compose Extends/Include"** (OneUptime)
    *   *Ключевая идея:* Использование `include` для модульности и `extends` для переиспользования конфигурации сервисов.
4.  **"Docker Best Practices 2026"** (Latest from Tech Guy)
    *   *Ключевая идея:* Безопасность (non-root users), multi-stage builds и управление секретами.

## План работ

1.  [ ] Создать универсальный `Dockerfile` для `rag-api` и протестировать сборку DEV и PROD.
2.  [ ] Мигрировать остальные сервисы (`user`, `agent`, `test_gen`) на новый формат Dockerfile.
3.  [ ] Создать `docker-compose.base.yml` и выделить общую конфигурацию.
4.  [ ] Настроить `docker-compose.dev.yml` и `docker-compose.prod.yml` через `include`.
5.  [ ] Обновить CI/CD пайплайны для сборки с `target: prod`.