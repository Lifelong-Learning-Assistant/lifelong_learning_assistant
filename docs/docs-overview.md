---
title: "Структура документации"
date: "2025-11-02"
status: "review"
version: "1.0"
owner: "@dev-team"
tags: ["documentation", "structure"]
---

# Структура документации

**Цель:** лёгкая, минималистичная, но уже «рабочая» документация, которая не перегружает проект на раннем этапе и при этом сразу покрывает нужные области:

- обзор системы и карта проекта и компонентов
- быстрый старт
- подробные deep-dive'ы для критичных частей системы

## Почему такая структура — кратко

* **Ясный вход** (карта + обзор): новый разработчик/архитектор быстро получает картину системы и ключевые зависимости.
* **Минимум бюрократии**: только нужные разделы — не перегружаем проект на старте.
* **Карточки → Deep dive**: карточки дают быстрый контекст; при необходимости — переход на глубокое описание компонента.
* **Docs-as-code**: markdown-репо легко версионировать и потом плавно перевести в `Docusaurus` статичный сайт документации.
* **Ops-ready**: с самого начала закладываем `ADR`, `changelog` и `runbook`-пояснения — это экономит время при принятии архитектурных решений.


# Cтруктура папки `docs/`

```
docs/
├─ docs-overview.md                  # (эта страница) структура и rationale
├─ 01-overview.md                   # Карта проекта + краткий обзор компонентов
├─ 03-architecture.md               # Архитектура & design (концепты, sequence diagrams)
├─ deployment_scripts.md            # Описание скриптов развертывания (start/stop)
├─ naming_conventions.md            # Соглашения об именовании
├─ pluntuml-diagram-renderer.md     # Инструкция по рендерингу диаграмм
├─ FAQ/                             # Часто задаваемые вопросы
│   ├─ faq-overview.md              # Индекс FAQ
│   └─ 01-retrievir-indices.md      # Работа с индексами
├─ 06-ideas/                        # Идеи и предложения
│   ├─ idea1.md
│   └─ idea2.md
├─ diagrams-src                     # Храним исходники для PluntUML-диаграмм
│   ├─ 01-overview/
│   │   ├─ system-diagram.puml      # Исходник диаграммы
│   │   └─ system-diagram.svg       # Результат рендеринга диаграммы PNG/SVG
│   └─ other-docs-part/
├─ components/                      # Описание каждой компоненты системы
│   ├─ index.md                     
│   ├─ cards/
│   │   ├─ orchestrator.md          # краткая карточка проекта
│   │   └─ retriever.md
│   └─ deep/
│       ├─ orchestrator-deep.md     # подробное описание компоненты
│       └─ retriever-deep.md
├─ dev-tools/                       # Документация по инструментам полезным для разработки
│   └─ pluntuml-diagram-renderer.md # Рендеринг PluntUML-диаграмм из исходников
├─ testing-ci.md                    # Testing & CI (как запускать, что покрывать)
└─ templates/                       # Шаблоны markdown-файлов для документации
    ├─ component-card-template.md
    └─ deep-doc-template.md
```

# Описание ключевых разделов

## 01-overview.md — Карта + краткий обзор

* Описание системы и `mermaid`-диаграмма (файл `diagrams-src/system.mmd`), текст описывающий потоки данных: пользователь → UI → API → Orchestrator → Retriever/LLM → storages.
* Цель: дать «высокоуровневое» понимание системы.

## 02-getting-started.md — Быстрый старт

* Как запустить проект локально (docker-compose / dev scripts).
* Как запустить тесты, как создать dev-данные.
* Контакты: владельцы/команды (owner fields в карточках).

## faq/ — Часто задаваемые вопросы

* Каждый вопрос и ответ в отдельном markdown файле для удобной навигации.
* Структурированная документация с техническими деталями и рекомендациями.
* Файлы в формате: `XX-краткое-описание.md` с полными ответами и примерами.

## 03-architecture.md — Архитектура & design

* Ключевые концепты (Orchestrator, Retriever, Embedding pipeline, MQ, Workers).
* диаграммы последовательностей для типовых сценариев:
  * Generate quiz (UI → API → Orchestrator → Retriever → LLM → MQ → Workers → DB)
  * Web snapshot processing (Tavily → FS → MQ → Workers → VDB/ES)
* Схемы data-flow и краткие упоминания о масштабировании и отказоустойчивости.

## 04-adr/ — Architecture Decision Records

* Каждое серьёзное решение (выбор FAISS vs managed, RabbitMQ vs Redis Streams, локальная LLM vs облачная) — отдельный ADR в виде markdown (формат: контекст → опции → решение → последствия).

## 05-changelog.md

* Короткие записи по релизам/важным изменениям архитектуры. 
* Формат: дата — краткое описание — ссылки на PR/ADR.

## 06-ideas/ - Идеи и предложения по проекту

* Записываем все наши идеи!
* Потом будет обсуждать их
* Добавлять в задачи и реализовывать!

## components/ — Component Cards + Deep Dive

* **cards/** — компактные карточки компонентов (описание + интерфейсы + owner + метрики + зависимости).
* **deep/** — подробные страницы (API, sequence, schema сообщений для MQ, runbook, observability, scaling).
* **index.md** — оглавление компонентных карточек.

## testing-ci.md (не сейчас)

* Что должен покрывать CI (unit, integration for retriever, end-to-end for quiz generation).
* Минимум: линтинг markdown/mermaid + тесты, которые запускаются в PR.
* Примеры команд и чеклист перед merge.

## diagrams-src/

* Хранить исходники mermaid, ссылки на export (svg/png) — Docusaurus позже вставит их в docs.

## templates/

* Шаблоны для карточки и deep-doc, чтобы все описывалось в едином стиле.

# Шаблоны

Папка с `templates` содержит шаблоны для заметок в формате `mermaid`.
- `template-for-any-thing.md` - пример файла-шаблона.


# Правила и конвенции (коротко)

* **Язык:** русский (нам проще и можно локализовать позже на другие языки).
* **Формат:** markdown, `mermaid`/`pluntuml` для диаграмм, OpenAPI для endpoint'ов (в `apis/` когда появятся).
* **Naming:** файлы `kebab-case.md`, заголовки H1. Компонентная карточка — в `components/cards/`, deep — в `components/deep/`.
* **Owner:** каждый компонент будет иметь `Owner` (GitHub handle / команда).
* **PR workflow:** docs PR — review by owner. CI линтит markdown + проверяет mermaid-ошибки.
* **ADR:** номерованная нотация `0001-*.md`, каждая ADR содержит дату, контекст и последствия.

# Что добавить (опционально, если потребуется)

* **Runbooks/ops/** — отдельная папка с конкретными playbook'ами по restore/rollback.
* **Security.md** — политика секретов, хранения PII, шифрования.
* **API Reference (OpenAPI)** — когда появятся реальные API, положить в `apis/` + auto-generated docs.
* **Glossary** — если проект растёт и появляются специфичные термины.

---

*Документ создан: 2025-11-02*  
*Последнее обновление: 2025-11-02*  
*Версия: 1.0*  
*Статус: На ревью*