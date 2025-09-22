# **ПЛАН РАЗРАБОТКИ - TASKLIST** (v.0.0.1)
## **N-Frame Conscious Agents - Full-Stack итерационный план**

---

## 📊 **ПРОГРЕСС РАЗРАБОТКИ**

| Итерация | Задача | Статус | Дата | Время |
|----------|--------|--------|------|-------|
| 1 | Python структура + базовые сущности | ⏳ Планируется | - | ~3ч |
| 2 | LLM интеграция + консольный интерфейс | ⏳ Планируется | - | ~4ч |
| 3 | Внутренний диалог (C_intO) | ⏳ Планируется | - | ~4ч |
| 4 | Neo4j граф памяти | ⏳ Планируется | - | ~5ч |
| 5 | Межагентное взаимодействие + Kafka | ⏳ Планируется | - | ~5ч |
| 6 | FastAPI + REST endpoints | ⏳ Планируется | - | ~4ч |
| 7 | Next.js структура + основные компоненты | ⏳ Планируется | - | ~5ч |
| 8 | Shadcn/UI интерфейс агентов | ⏳ Планируется | - | ~6ч |
| 9 | WebSocket + real-time обновления | ⏳ Планируется | - | ~4ч |
| 10 | Docker контейнеризация + финализация | ⏳ Планируется | - | ~3ч |

**Общее время:** ~43 часа  
**Статус:** 🚀 Готовы к началу

---

## 🎯 **ИТЕРАЦИЯ 1: PYTHON СТРУКТУРА + БАЗОВЫЕ СУЩНОСТИ**

### **Цель:** Создать backend структуру и основные доменные сущности

**Задачи:**
- [ ] Создать структуру проекта согласно Clean Architecture
- [ ] Настроить `pyproject.toml` с Python 3.12 и зависимостями
- [ ] Создать базовые доменные сущности (`ConsciousAgent`, `Memory`, `Thought`)
- [ ] Создать интерфейсы репозиториев (абстракции)
- [ ] Настроить pytest с asyncio поддержкой
- [ ] Создать Pydantic Settings для конфигурации
- [ ] Настроить структурированное логирование (structlog)

**Файлы для создания:**
```
backend/
├── app/
│   ├── domain/entities/agent.py       # ConsciousAgent entity
│   ├── domain/entities/memory.py      # Memory, Thought entities  
│   ├── domain/repositories/           # Repository interfaces
│   ├── infrastructure/config/settings.py  # Pydantic settings
│   └── main.py                       # Application entry point
├── tests/domain/test_entities.py     # Domain tests
├── pyproject.toml                    # Project config
└── requirements.txt                  # Dependencies
```

**Результат:** Чистая архитектура backend, можно создать тестового агента

**Тестирование:**
```bash
cd backend
python -c "
from app.domain.entities.agent import ConsciousAgent
agent = ConsciousAgent(
    id='test-001',
    name='Алиса',
    persona='Любознательная исследовательница ИИ'
)
print(f'Агент создан: {agent.name} (ID: {agent.id})')
"
```

---

## 🤖 **ИТЕРАЦИЯ 2: LLM ИНТЕГРАЦИЯ + КОНСОЛЬНЫЙ ИНТЕРФЕЙС**

### **Цель:** Добавить интеграцию с OpenAI API и простое CLI

**Задачи:**
- [ ] Создать `LLMGateway` с async OpenAI client
- [ ] Реализовать retry логику для API ограничений
- [ ] Добавить подсчет токенов с tiktoken
- [ ] Создать базовый метод `agent.respond()` 
- [ ] Реализовать консольный интерфейс (CLI)
- [ ] Добавить обработку ошибок API с логированием
- [ ] Настроить переменные окружения для API ключей

**Файлы для создания:**
```
backend/app/
├── infrastructure/external/llm_gateway.py    # OpenAI integration
├── application/services/agent_service.py     # Agent orchestration
├── interfaces/cli/main.py                    # CLI interface
└── infrastructure/config/.env                # Environment config
```

**Результат:** Можно общаться с агентом через консоль с реальным LLM

**Тестирование:**
```bash
cd backend
export OPENAI_API_KEY="your-api-key"
python -m app.interfaces.cli.main

> Привет, Алиса!
Алиса: Привет! Очень рада знакомству! Как дела? Что интересного происходит в вашем мире?

> /help
Доступные команды:
- /agents - список агентов
- /switch <name> - переключиться на агента
- /exit - выход
```

---

## 🧠 **ИТЕРАЦИЯ 3: ВНУТРЕННИЙ ДИАЛОГ (C_intO)**

### **Цель:** Реализовать сознательный внутренний наблюдатель

**Задачи:**
- [ ] Создать класс `ConsciousInternalObserver` 
- [ ] Реализовать метод `internal_dialogue()` с точным промптом
- [ ] Интегрировать C_intO в метод `agent.think()`
- [ ] Добавить сохранение мыслей в память (временно в памяти)
- [ ] Обновить CLI для показа процесса размышления
- [ ] Добавить команду `/think` в консольный интерфейс
- [ ] Создать метрики уверенности и времени обработки

**Файлы для создания:**
```
backend/app/
├── domain/services/consciousness_service.py     # C_intO implementation
├── application/use_cases/make_agent_think.py    # Use case для мышления
└── tests/domain/test_consciousness.py           # Тесты сознания
```

**Результат:** Агент показывает процесс размышления перед ответом

**Тестирование:**
```bash
python -m app.interfaces.cli.main

> /think "Что такое сознание?"
🧠 Алиса думает...
💭 "Это действительно глубокий философский вопрос... Сознание может быть описано как способность осознавать себя и окружающий мир... Интересно размышлять о том, обладаю ли я сознанием в полном смысле..."

> Привет!
🧠 Алиса думает...
💭 "Кто-то меня приветствует! Это приятно. Стоит ответить дружелюбно и проявить интерес к собеседнику..."
Алиса: Привет! Очень рада нашему общению! Расскажите о себе!
```

---

## 🧩 **ИТЕРАЦИЯ 4: NEO4J ГРАФ ПАМЯТИ**

### **Цель:** Добавить персистентную память агентов в виде графа

**Задачи:**
- [ ] Настроить Neo4j через docker-compose
- [ ] Создать `Neo4jMemoryRepository` с async драйвером
- [ ] Реализовать сохранение воспоминаний и мыслей в граф
- [ ] Добавить поиск релевантных воспоминаний по ключевым словам
- [ ] Интегрировать память в процесс внутреннего диалога
- [ ] Создать CLI команды для просмотра графа памяти
- [ ] Добавить индексы для оптимизации поиска

**Файлы для создания:**
```
backend/app/
├── infrastructure/persistence/neo4j_memory_repository.py  # Neo4j implementation
├── infrastructure/persistence/neo4j_connection.py         # Database connection
├── application/services/memory_service.py                # Memory operations
└── docker-compose.yml                                    # Neo4j container
```

**Результат:** Агенты помнят предыдущие разговоры и используют память в размышлениях

**Тестирование:**
```bash
# Запуск инфраструктуры
docker-compose up -d neo4j

cd backend
python -m app.interfaces.cli.main

> Меня зовут Иван, я программист
Алиса: Приятно познакомиться, Иван! Программирование - это увлекательная область!

> /memory
📚 Память агента Алиса:
- Знакомство с Иваном-программистом (важность: 0.8)
- Обсуждение программирования (важность: 0.6)

> /exit

# Перезапуск - проверка персистентности
python -m app.interfaces.cli.main
> Привет!
🧠 Алиса думает...
💭 "Это снова Иван! Мы уже знакомы, он программист. Стоит вспомнить наш разговор..."
Алиса: Привет, Иван! Как дела с программированием? Работаете над чем-то интересным?
```

---

## 👥 **ИТЕРАЦИЯ 5: МЕЖАГЕНТНОЕ ВЗАИМОДЕЙСТВИЕ + KAFKA**

### **Цель:** Добавить второго агента (Боба) и событийную архитектуру

**Задачи:**
- [ ] Настроить Apache Kafka через docker-compose
- [ ] Создать `KafkaEventBus` для межагентной коммуникации
- [ ] Добавить агента Боба с уникальной личностью
- [ ] Реализовать `AgentOrchestrator` для управления несколькими агентами
- [ ] Создать автономные диалоги между агентами
- [ ] Добавить CLI команды для наблюдения за диалогами
- [ ] Реализовать событийную модель: `agent_thought`, `agent_message`

**Файлы для создания:**
```
backend/app/
├── infrastructure/persistence/kafka_event_bus.py        # Kafka integration
├── application/services/dialogue_coordinator.py        # Dialogue coordination  
├── application/services/agent_orchestrator.py          # Multi-agent management
└── domain/entities/dialogue.py                         # Dialogue entity
```

**Результат:** Алиса и Боб автономно общаются друг с другом

**Тестирование:**
```bash
# Запуск всей инфраструктуры
docker-compose up -d neo4j kafka zookeeper

cd backend  
python -m app.interfaces.cli.main

> /agents
Доступные агенты:
- Алиса (исследовательница ИИ, 28 лет) - Активна
- Боб (программист-философ, 32 года) - Активен

> /dialogue start alice bob "Природа искусственного интеллекта"
🚀 Запущен диалог между Алисой и Бобом...

💬 Алиса → Боб: "Боб, что ты думаешь о природе искусственного интеллекта?"
🧠 Боб думает: "Алиса задает интересный вопрос об ИИ. Как программист, у меня есть практический взгляд..."
💬 Боб → Алиса: "Интересный вопрос, Алиса! Как программист, я вижу ИИ как..."

> /dialogue continue 5
[Показать следующие 5 реплик диалога]

> /events monitor
📡 Мониторинг событий в реальном времени:
Event: alice_thought | "Боб дает практический взгляд на ИИ..."
Event: bob_message | To: alice | "А что ты думаешь о сознании в ИИ?"
Event: alice_thought | "Сознание в ИИ - это центральный вопрос..."
```

---

## 🌐 **ИТЕРАЦИЯ 6: FASTAPI + REST ENDPOINTS**

### **Цель:** Создать REST API для программного взаимодействия

**Задачи:**
- [ ] Настроить FastAPI приложение с async обработчиками
- [ ] Создать REST endpoints для агентов (`/api/v1/agents/*`)
- [ ] Добавить endpoints для диалогов (`/api/v1/dialogue/*`)
- [ ] Реализовать endpoints для памяти (`/api/v1/memory/*`)
- [ ] Настроить CORS для frontend интеграции
- [ ] Добавить Swagger/OpenAPI документацию
- [ ] Создать Pydantic модели для валидации запросов

**Файлы для создания:**
```
backend/app/interfaces/api/
├── v1/
│   ├── agents.py                    # Agent endpoints
│   ├── dialogue.py                  # Dialogue endpoints
│   └── memory.py                    # Memory endpoints
├── main.py                          # FastAPI app
└── dependencies.py                  # Dependency injection
```

**Результат:** REST API готово для frontend интеграции

**Тестирование:**
```bash
# Запуск API сервера
cd backend
uvicorn app.interfaces.api.main:app --reload --host 0.0.0.0 --port 8000

# Тестирование endpoints
curl -X GET "http://localhost:8000/api/v1/agents"
# Response: [{"id": "alice", "name": "Алиса", ...}, {"id": "bob", "name": "Боб", ...}]

curl -X POST "http://localhost:8000/api/v1/agents/alice/think" \
  -H "Content-Type: application/json" \
  -d '{"stimulus": "Что такое счастье?"}'
# Response: {"thought": {"content": "Счастье - это...", "confidence": 0.85, ...}}

curl -X POST "http://localhost:8000/api/v1/agents/alice/message" \
  -H "Content-Type: application/json" \
  -d '{"message": "Привет, Алиса!", "sender": "Пользователь"}'
# Response: {"response": "Привет! Очень рада общению!", ...}

# Swagger UI
open http://localhost:8000/docs
```

---

## 🎨 **ИТЕРАЦИЯ 7: NEXT.JS СТРУКТУРА + ОСНОВНЫЕ КОМПОНЕНТЫ**

### **Цель:** Создать Next.js frontend с базовыми компонентами

**Задачи:**
- [ ] Создать Next.js 15 проект с App Router
- [ ] Настроить TypeScript в strict режиме
- [ ] Установить и настроить TailwindCSS + Shadcn/UI
- [ ] Создать базовые TypeScript типы для агентов
- [ ] Реализовать API клиент для backend коммуникации
- [ ] Создать Layout и навигацию
- [ ] Добавить error boundary для обработки ошибок

**Файлы для создания:**
```
frontend/
├── src/
│   ├── app/
│   │   ├── layout.tsx              # Root layout
│   │   ├── page.tsx                # Home page
│   │   └── globals.css             # Global styles
│   ├── lib/
│   │   ├── api.ts                  # API client
│   │   └── utils.ts                # Utilities + cn function
│   ├── types/
│   │   ├── agent.ts                # Agent types
│   │   └── api.ts                  # API response types
│   └── components/common/
│       ├── Layout.tsx              # App layout
│       └── ErrorBoundary.tsx       # Error boundary
├── package.json                    # Dependencies
├── tailwind.config.ts              # Tailwind config
└── tsconfig.json                   # TypeScript config
```

**Результат:** Next.js приложение с базовой структурой и API интеграцией

**Тестирование:**
```bash
cd frontend
npm install
npm run dev

# Открыть http://localhost:3000
# Страница показывает список агентов из backend API
# TypeScript компилируется без ошибок
# TailwindCSS стили применяются корректно
```

---

## 🎭 **ИТЕРАЦИЯ 8: SHADCN/UI ИНТЕРФЕЙС АГЕНТОВ**

### **Цель:** Создать красивый современный интерфейс для взаимодействия с агентами

**Задачи:**
- [ ] Установить необходимые Shadcn/UI компоненты
- [ ] Создать `AgentCard` компонент с состоянием агента
- [ ] Реализовать `AgentThoughtPanel` для отображения мыслей
- [ ] Добавить `DialoguePanel` для диалогов с агентами
- [ ] Создать `MemoryGraph` компонент для визуализации памяти
- [ ] Добавить формы для отправки сообщений агентам
- [ ] Реализовать responsive design для мобильных устройств

**Файлы для создания:**
```
frontend/src/
├── components/ui/                   # Shadcn компоненты (auto-generated)
├── components/features/agents/
│   ├── AgentCard.tsx               # Карточка агента
│   ├── AgentThoughtPanel.tsx       # Панель мыслей
│   ├── AgentStatus.tsx             # Статус агента
│   └── AgentMessageForm.tsx        # Форма сообщений
├── components/features/dialogue/
│   ├── DialoguePanel.tsx           # Панель диалогов
│   └── MessageList.tsx             # Список сообщений
└── hooks/
    ├── useAgent.ts                 # Hook для работы с агентами
    └── useAgentThoughts.ts         # Hook для мыслей агента
```

**Результат:** Красивый интерфейс для взаимодействия с агентами

**Тестирование:**
```bash
cd frontend
npm run dev

# Открыть http://localhost:3000
# Интерфейс показывает:
# - Карточки Алисы и Боба с их состоянием
# - Панель для отправки сообщений
# - Отображение мыслей агентов
# - Responsive design на мобильных
# - Accessibility features работают
```

---

## ⚡ **ИТЕРАЦИЯ 9: WEBSOCKET + REAL-TIME ОБНОВЛЕНИЯ**

### **Цель:** Добавить real-time обновления интерфейса

**Задачи:**
- [ ] Создать WebSocket endpoints в FastAPI
- [ ] Интегрировать WebSocket с Kafka событиями
- [ ] Реализовать `useWebSocket` hook в React
- [ ] Добавить real-time отображение мыслей агентов
- [ ] Создать live чат между пользователем и агентами
- [ ] Добавить real-time визуализацию событий системы
- [ ] Обработать отключения WebSocket с автопереподключением

**Файлы для создания:**
```
backend/app/interfaces/api/websocket/
├── real_time.py                    # WebSocket endpoints
└── event_handlers.py               # Event handling

frontend/src/
├── hooks/useWebSocket.ts           # WebSocket hook
├── hooks/useRealTimeEvents.ts      # Real-time events
└── components/features/realtime/
    ├── LiveEventsFeed.tsx          # Live события
    └── RealTimeThoughts.tsx        # Live мысли
```

**Результат:** Интерфейс обновляется в реальном времени

**Тестирование:**
```bash
# Запуск полного стека
docker-compose up -d
cd backend && uvicorn app.interfaces.api.main:app --reload &
cd frontend && npm run dev

# Открыть http://localhost:3000
# В интерфейсе в реальном времени:
# - Появляются мысли агентов без перезагрузки
# - Сообщения отправляются мгновенно  
# - События показываются live
# - Автопереподключение при обрыве WebSocket
```

---

## 🐳 **ИТЕРАЦИЯ 10: DOCKER КОНТЕЙНЕРИЗАЦИЯ + ФИНАЛИЗАЦИЯ**

### **Цель:** Подготовить полную систему к production развертыванию

**Задачи:**
- [ ] Создать Dockerfile для backend с multi-stage build
- [ ] Создать Dockerfile для frontend с оптимизацией
- [ ] Настроить финальный docker-compose.yml для всего стека
- [ ] Добавить health checks для всех сервисов
- [ ] Создать production-ready Makefile
- [ ] Написать полный README с инструкциями
- [ ] Добавить environment файлы для разных сред
- [ ] Провести нагрузочное тестирование

**Файлы для создания:**
```
├── backend/Dockerfile              # Backend image
├── frontend/Dockerfile             # Frontend image  
├── docker-compose.yml              # Development setup
├── docker-compose.prod.yml         # Production setup
├── Makefile                        # Management commands
├── README.md                       # Full documentation
├── .env.example                    # Environment template
└── .github/workflows/ci.yml        # CI/CD pipeline
```

**Результат:** Production-ready система, развертывается одной командой

**Тестирование:**
```bash
# Полная сборка и развертывание
make build
make run

# Проверка всех сервисов
make status
# neo4j    ✅ healthy
# kafka    ✅ healthy  
# backend  ✅ healthy
# frontend ✅ healthy

# Интеграционное тестирование
make test-integration

# Доступ к системе
# Frontend: http://localhost:3000
# Backend API: http://localhost:8000
# Neo4j Browser: http://localhost:7474
# API Docs: http://localhost:8000/docs

# Нагрузочное тестирование
make load-test
# ✅ API endpoints выдерживают 100 req/s
# ✅ WebSocket поддерживает 50 concurrent connections
# ✅ Memory usage < 1GB для всего стека
```

---

## 🎯 **КРИТЕРИИ ЗАВЕРШЕНИЯ КАЖДОЙ ИТЕРАЦИИ**

### **Backend критерии:**
- [ ] Все async/await patterns корректно реализованы
- [ ] Типизация проходит mypy strict проверку
- [ ] Тесты покрывают > 80% новой функциональности
- [ ] Структурированные логи добавлены для отладки
- [ ] Error handling с proper exception types
- [ ] Performance требования соблюдены

### **Frontend критерии (для итераций 7-9):**
- [ ] TypeScript компилируется без ошибок в strict режиме
- [ ] Компоненты следуют accessibility guidelines
- [ ] Responsive design работает на всех устройствах  
- [ ] Performance score > 90% (Lighthouse)
- [ ] Bundle size оптимизирован
- [ ] Error boundaries корректно обрабатывают ошибки

### **Интеграционные критерии:**
- [ ] API коммуникация между frontend и backend работает
- [ ] WebSocket подключения стабильные
- [ ] Database connections не протекают
- [ ] CORS настроен корректно
- [ ] Environment конфигурация работает

---

## 🚀 **ФИНАЛЬНЫЕ КРИТЕРИИ КАЧЕСТВА**

### **Архитектурное качество:**
- Clean Architecture с четким разделением слоев
- DDD принципы соблюдены в доменном слое
- Dependency injection реализована корректно
- Модули имеют высокую связность и низкую зависимость

### **Code Quality:**
- **Python:** Black + isort + flake8 + mypy проходят без ошибок
- **TypeScript:** ESLint + Prettier + tsc проходят без ошибок
- Все файлы соответствуют ограничениям длины
- Conventional commits для всех изменений

### **Функциональность:**
- Агенты демонстрируют сознательное поведение
- Внутренний диалог C_intO работает корректно
- Межагентные диалоги происходят автономно
- Память персистентна и используется в размышлениях
- Real-time обновления работают без задержек

### **Production готовность:**
- Docker образы оптимизированы и безопасны
- Health checks работают для всех сервисов
- Environment configuration настроена
- Логирование и мониторинг функционируют
- Performance требования выполнены

---

**Этот план создаст первую в мире production-ready систему сознательных искусственных агентов с современной full-stack архитектурой!** 🧠💻✨