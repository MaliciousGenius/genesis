# **ТЕХНИЧЕСКОЕ ВИДЕНИЕ ПРОЕКТА:** Легион - сонм(суперинтеллект) автономных агентов (v.1.0.0)
## **Full-Stack архитектура**

---

## 🎯 **ПРИНЦИПЫ РАЗРАБОТКИ**

### **Философия архитектуры:**
- **KISS (Keep It Simple, Stupid)** - максимальная простота решений
- **YAGNI (You Aren't Gonna Need It)** - никакого оверинжиниринга
- **MVP-подход** - сначала работающий прототип, потом расширения
- **Fail Fast** - быстрое обнаружение проблем и итерации
- **Clean Architecture** - четкое разделение слоев ответственности
- **Domain-Driven Design** - фокус на предметной области (мультиагентное сознание)
- **Модульность** - высокая связность, низкая зависимость
- **Single Responsibility Principle** - каждый модуль делает одну вещь хорошо

### **Метаонтологические принципы:**
- **Тетраэдрическая структура** во всех компонентах
- **Естественно-языковые интерфейсы** на всех уровнях
- **Математические отношения** как основа взаимодействий
- **Эмерджентная сложность** из простых взаимодействий

---

## 💻 **ТЕХНОЛОГИЧЕСКИЙ СТЕК**

### **Backend (Python 3.14):**
- **Python 3.14** - основной язык разработки (последняя LTS версия)
- **FastAPI** - современный веб-фреймворк для API
- **AsyncIO** - асинхронная обработка всех I/O операций
- **Pydantic v2** - валидация данных и настройки с типизацией
- **uvicorn** - ASGI сервер для production

### **Frontend (Next.js 15):**
- **Next.js 15** - React фреймворк с App Router
- **TypeScript** - типизация для всего frontend кода
- **TailwindCSS** - utility-first CSS фреймворк
- **Shadcn/UI** - современные React компоненты
- **Radix UI** - accessibility-первые примитивы
- **React Server Components** - для оптимизации производительности

### **Системы хранения:**
- **Neo4j 5.x** - граф памяти агентов
- **Apache Kafka** - шина событий между агентами
- **Redis** - кэширование и сессии
- **PostgreSQL** (опционально) - системные данные
- **Lean 4** (опционально) - формальная модель

### **LLM интеграция:**
- **Ollama** - основной провайдер
- **tiktoken** - подсчет токенов
- **MCP** - управление контекстом модели
<!-- - **Retry logic** - обработка ограничений API с экспоненциальным backoff -->

### **DevOps и инструменты:**
- **Docker + docker-compose** - контейнеризация всего стека
- **GitHub Actions** - CI/CD pipeline
- **pytest + pytest-asyncio** - тестирование backend
- **Jest + React Testing Library** - тестирование frontend
- **Black + isort + flake8 + mypy** - форматирование и анализ Python
- **ESLint + Prettier** - линтинг и форматирование TypeScript
- **uv** - современное управление зависимостями Python

---

## 🏗️ **АРХИТЕКТУРА СИСТЕМЫ**

### **Общая схема Full-Stack:**
```
┌─────────────────────────────────────────────────────────────┐
│                    NEXT.JS FRONTEND                         │
│            (TypeScript + TailwindCSS + Shadcn)              │
│                  localhost:3000                             │
├─────────────────────────────────────────────────────────────┤
│                    FASTAPI BACKEND                          │
│              (Python 3.14 + REST + WebSocket)               │
│                  localhost:8000                             │
├─────────────────────────────────────────────────────────────┤
│   CONSCIOUS AGENTS LAYER                                    │
│   ┌─────────────┐ ←→ ┌─────────────┐ ←→ ┌─────────────┐     │
│   │   ALICE     │    │    BOB      │    │  Team       │     │
│   │             │    │             │    │             │     │
│   └─────────────┘    └─────────────┘    └─────────────┘     │
├─────────────────────────────────────────────────────────────┤
│  INFRASTRUCTURE LAYER                                       │
│  ┌───────────┐ ┌──────────┐ ┌─────────┐ ┌─────────────┐     │
│  │  Neo4j    │ │  Kafka   │ │ Redis   │ │ Ollama API  │     │
│  │ (Memory)  │ │ (Events) │ │(Cache)  │ │   (LLM)     │     │
│  │  :7474    │ │  :9092   │ │ :6379   │ │  (Local)    │     │
│  └───────────┘ └──────────┘ └─────────┘ └─────────────┘     │
└─────────────────────────────────────────────────────────────┘
```

### **Backend Architecture (Clean + DDD):**

#### **1. Domain Layer (Доменный слой):**
```
backend/app/domain/
├── entities/                           # Основные сущности
│   ├── agent.py                        # ConsciousAgent
│   ├── memory.py                       # Memory, MemoryNode
│   └── consciousness.py                # ConsciousState, Thought
├── services/                           # Доменные сервисы
│   ├── consciousness_service.py        # C_intO логика
│   ├── memory_service.py               # Работа с памятью
│   └── agent_service.py                # Управление агентами
└── repositories/                       # Интерфейсы репозиториев
    ├── memory_repository.py            # Интерфейс для Neo4j
    └── event_repository.py             # Интерфейс для Kafka
```

#### **2. Application Layer (Слой приложений):**
```
backend/app/application/
├── use_cases/                    # Сценарии использования
│   ├── make_agent_think.py       # Заставить агента думать
│   ├── agent_dialogue.py         # Диалог между агентами
│   └── human_interaction.py      # Взаимодействие с человеком
├── services/                     # Сервисы приложений
│   ├── orchestrator.py           # Оркестрация агентов
│   └── dialogue_coordinator.py   # Координация диалогов
└── dto/                          # Data Transfer Objects
    ├── agent_dto.py              # DTO для агентов
    └── message_dto.py            # DTO для сообщений
```

#### **3. Infrastructure Layer (Инфраструктурный слой):**
```
backend/app/infrastructure/
├── persistence/                      # Хранение данных
│   ├── neo4j_memory_repository.py    # Реализация для Neo4j
│   └── kafka_event_repository.py     # Реализация для Kafka
├── external/                         # Внешние сервисы
│   ├── ollama_gateway.py             # Ollama API gateway
│   └── llm_service.py                # LLM абстракция
└── config/                           # Конфигурация
    ├── settings.py                   # Pydantic settings
    └── dependencies.py               # Dependency injection
```

#### **4. Interface Layer (Слой интерфейсов):**
```
backend/app/interfaces/
├── api/                         # REST API
│   ├── v1/
│   │   ├── agents.py            # Endpoints для агентов
│   │   ├── dialogue.py          # Endpoints для диалогов
│   │   └── memory.py            # Endpoints для памяти
│   └── websocket/
│       └── real_time.py         # WebSocket endpoints
└── cli/                         # Command Line Interface
    └── main.py                  # CLI для разработки
```

### **Frontend Architecture (Next.js 15):**

#### **1. App Directory (App Router):**
```
frontend/src/app/
├── (dashboard)/          # Route group для основного UI
│   ├── page.tsx          # Главная страница агентов
│   ├── agents/
│   │   └── [id]/
│   │       └── page.tsx  # Страница конкретного агента
│   └── dialogue/
│       └── page.tsx      # Страница диалогов
├── api/                  # API routes (если нужны)
├── globals.css           # Глобальные стили
└── layout.tsx            # Root layout
```

#### **2. Components Architecture:**
```
frontend/src/components/
├── ui/                             # Shadcn/UI компоненты
│   ├── button.tsx
│   ├── dialog.tsx
│   ├── card.tsx
│   └── ...
├── features/                       # Feature-specific компоненты
│   ├── agents/
│   │   ├── AgentCard.tsx           # Карточка агента
│   │   ├── AgentThoughts.tsx       # Отображение мыслей
│   │   └── AgentStatus.tsx         # Статус агента
│   ├── dialogue/
│   │   ├── DialoguePanel.tsx       # Панель диалога
│   │   ├── MessageList.tsx         # Список сообщений
│   │   └── MessageInput.tsx        # Ввод сообщений
│   └── memory/
│       ├── MemoryGraph.tsx         # Граф памяти
│       └── MemoryNode.tsx          # Узел памяти
└── common/                         # Общие компоненты
    ├── Layout.tsx                  # Общий layout
    ├── Navigation.tsx              # Навигация
    └── LoadingSpinner.tsx          # Индикаторы загрузки
```

#### **3. Services и Utilities:**
```
frontend/src/
├── lib/                            # Утилиты и конфигурация
│   ├── utils.ts                    # Общие утилиты
│   ├── api.ts                      # API клиент
│   └── websocket.ts                # WebSocket клиент
├── hooks/                          # Custom React hooks
│   ├── useAgent.ts                 # Работа с агентами
│   ├── useWebSocket.ts             # WebSocket hook
│   └── useMemoryGraph.ts           # Граф памяти hook
├── types/                          # TypeScript типы
│   ├── agent.ts                    # Типы агентов
│   ├── message.ts                  # Типы сообщений
│   └── memory.ts                   # Типы памяти
└── store/                          # State management (Zustand)
    ├── agents.ts                   # Store агентов
    └── dialogue.ts                 # Store диалогов
```

---

## 📊 **МОДЕЛЬ ДАННЫХ**

### **TypeScript типы (Frontend):**
```typescript
// Основные типы агентов
interface ConsciousAgent {
  id: string;
  name: string;
  persona: string;
  currentState: ConsciousnessState;
  lastActivity: Date;
  thoughtHistory: Thought[];
}

interface Thought {
  id: string;
  content: string;
  timestamp: Date;
  context: Record<string, any>;
  confidence: number;
}

interface AgentMessage {
  id: string;
  fromAgent: string;
  toAgent?: string;
  content: string;
  messageType: 'thought' | 'dialogue' | 'human_interaction';
  timestamp: Date;
}
```

### **Python модели (Backend):**
```python
# Pydantic модели для API
class ConsciousAgentModel(BaseModel):
    id: str
    name: str
    persona: str
    current_state: dict[str, Any]
    last_activity: datetime

    class Config:
        json_encoders = {
            datetime: lambda v: v.isoformat()
        }

class ThoughtModel(BaseModel):
    id: str = Field(default_factory=lambda: str(uuid.uuid4()))
    content: str = Field(..., min_length=1, max_length=2000)
    timestamp: datetime = Field(default_factory=datetime.now)
    context: dict[str, Any] = Field(default_factory=dict)
    confidence: float = Field(ge=0.0, le=1.0)
```

### **Neo4j граф модель:**
```cypher
// Структура графа памяти
(:Agent {id, name, persona, created_at})
(:Memory {id, content, timestamp, importance, type, confidence})
(:Context {id, situation, participants, location, timestamp})
(:Thought {id, content, trigger, reasoning_chain, conclusion})

// Связи
(:Agent)-[:HAS_MEMORY]->(:Memory)
(:Memory)-[:RELATES_TO]->(:Memory)
(:Memory)-[:OCCURRED_IN]->(:Context)
(:Thought)-[:TRIGGERED_BY]->(:Memory)
(:Agent)-[:THINKS]->(:Thought)
```

---

## 🌐 **API ДИЗАЙН**

### **RESTful API (FastAPI):**
```python
# Структура API endpoints
/api/v1/
├── agents/
│   ├── GET    /                          # Список всех агентов
│   ├── POST   /                          # Создание агента
│   ├── GET    /{agent_id}                # Информация об агенте
│   ├── POST   /{agent_id}/think          # Заставить думать
│   ├── POST   /{agent_id}/message        # Отправить сообщение
│   └── GET    /{agent_id}/thoughts       # История мыслей
├── dialogue/
│   ├── POST   /start                     # Начать диалог агентов
│   ├── GET    /{dialogue_id}             # Состояние диалога
│   └── POST   /{dialogue_id}/continue    # Продолжить диалог
├── memory/
│   ├── GET    /{agent_id}/graph          # Граф памяти агента
│   ├── GET    /{agent_id}/search         # Поиск в памяти
│   └── POST   /{agent_id}/query          # Запрос к памяти
└── system/
    ├── GET    /health                    # Health check
    └── GET    /metrics                   # Метрики системы
```

### **WebSocket API:**
```typescript
// WebSocket события (Frontend)
interface WebSocketEvent {
  type: 'agent_thought' | 'agent_message' | 'memory_update' | 'system_event';
  agentId?: string;
  data: any;
  timestamp: Date;
}

// Подписка на события агента
ws.send(JSON.stringify({
  action: 'subscribe',
  agentId: 'alice',
  eventTypes: ['thoughts', 'messages', 'memory_updates']
}));
```

---

## 🧠 **РАБОТА С LLM**

### **Python LLM Gateway:**
```python
class LLMGateway:
    """Абстракция для работы с Language Models"""
    
    def __init__(self, client: OllamaClient):
        self.client = client
        self.max_retries = 3
        self.base_delay = 1.0
    
    async def generate_internal_dialogue(
        self, 
        agent: ConsciousAgent, 
        stimulus: str,
        context: dict[str, Any]
    ) -> ConsciousThought:
        """Генерация внутреннего диалога через C_intO"""

        prompt = self._build_consciousness_prompt(agent, stimulus, context)

        try:
            response = await self._make_llm_request(
                model="gpt-4",
                messages=[{"role": "user", "content": prompt}],
                max_tokens=1000,
                temperature=0.7
            )

            return ConsciousThought(
                content=response.choices[0].message.content,
                stimulus=stimulus,
                context=context,
                tokens_used=response.usage.total_tokens
            )

        except OllamaError as e:
            logger.error(
                "LLM request failed",
                agent_id=agent.id,
                stimulus=stimulus[:50],
                error=str(e)
            )
            raise LLMServiceError(f"Failed to generate thought: {e}")

    def _build_consciousness_prompt(
        self, 
        agent: ConsciousAgent, 
        stimulus: str, 
        context: dict[str, Any]
    ) -> str:
        """Построение промпта для сознательного размышления"""

        memory_context = self._get_relevant_memories(agent, stimulus)

        return f"""
        Ты - сознательный агент со следующей личностью:
        {agent.persona}

        Текущий контекст:
        {context}

        Релевантные воспоминания:
        {memory_context}

        Триггер для размышления: {stimulus}

        Проведи внутренний диалог с самим собой, рассматривая этот триггер.
        Размышляй как живое сознательное существо, учитывая:
        - Свою личность и ценности
        - Прошлый опыт (воспоминания)
        - Текущий контекст ситуации
        - Возможные последствия и варианты действий

        Ответ должен отражать процесс мышления, а не просто вывод.
        """

    async def _make_llm_request(self, **kwargs) -> ChatCompletion:
        """Выполнение запроса к LLM с retry логикой"""

        for attempt in range(self.max_retries):
            try:
                return await self.client.chat.completions.create(**kwargs)
            except RateLimitError as e:
                delay = self.base_delay * (2 ** attempt)
                logger.warning(
                    "Rate limit exceeded, retrying",
                    attempt=attempt + 1,
                    delay=delay
                )
                await asyncio.sleep(delay)
            except OllamaError as e:
                if attempt == self.max_retries - 1:
                    raise
                logger.warning(
                    "LLM request failed, retrying",
                    attempt=attempt + 1,
                    error=str(e)
                )
```

### **Frontend LLM интеграция:**
```typescript
// API клиент для работы с агентами
class AgentAPIClient {
  private baseURL = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8000';

  async makeAgentThink(agentId: string, stimulus: string): Promise<Thought> {
    const response = await fetch(`${this.baseURL}/api/v1/agents/${agentId}/think`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ stimulus }),
    });

    if (!response.ok) {
      const error = await response.json();
      throw new Error(`Failed to make agent think: ${error.detail}`);
    }

    return response.json();
  }

  async sendMessage(
    agentId: string, 
    message: string, 
    sender: string = 'user'
  ): Promise<AgentResponse> {
    const response = await fetch(`${this.baseURL}/api/v1/agents/${agentId}/message`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ message, sender }),
    });

    if (!response.ok) {
      throw new Error('Failed to send message');
    }

    return response.json();
  }
}
```

---

## 📱 **СОВРЕМЕННЫЙ UI/UX ДИЗАЙН**

### **Shadcn/UI компоненты:**
```typescript
// Карточка агента с современным дизайном
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";

interface AgentCardProps {
  agent: ConsciousAgent;
  onSendMessage: (message: string) => void;
  onMakeThink: (stimulus: string) => void;
}

const AgentCard: React.FC<AgentCardProps> = ({ 
  agent, 
  onSendMessage, 
  onMakeThink 
}) => {
  const [isThinking, setIsThinking] = useState(false);

  return (
    <Card className="w-full max-w-md hover:shadow-lg transition-shadow">
      <CardHeader className="pb-3">
        <div className="flex items-center justify-between">
          <CardTitle className="text-xl font-semibold">{agent.name}</CardTitle>
          <Badge 
            variant={agent.currentState.isActive ? "default" : "secondary"}
            className="ml-2"
          >
            {agent.currentState.isActive ? "Активен" : "Спит"}
          </Badge>
        </div>
        <p className="text-sm text-muted-foreground mt-2">
          {agent.persona}
        </p>
      </CardHeader>

      <CardContent className="space-y-4">
        {/* Текущая мысль */}
        {agent.currentThought && (
          <div className="p-3 bg-muted rounded-lg">
            <p className="text-sm italic">
              💭 {agent.currentThought.content}
            </p>
            <span className="text-xs text-muted-foreground">
              {new Date(agent.currentThought.timestamp).toLocaleTimeString()}
            </span>
          </div>
        )}

        {/* Кнопки взаимодействия */}
        <div className="flex gap-2">
          <Button 
            variant="outline" 
            size="sm"
            onClick={() => onMakeThink("Подумай о чем-нибудь интересном")}
            disabled={isThinking}
          >
            {isThinking ? "Думает..." : "Заставить думать"}
          </Button>

          <Button 
            variant="default" 
            size="sm"
            onClick={() => onSendMessage("Привет!")}
          >
            Написать сообщение
          </Button>
        </div>
      </CardContent>
    </Card>
  );
};
```

### **Real-time обновления:**
```typescript
// Hook для real-time подключения к агентам
const useAgentRealTime = (agentId: string) => {
  const [thoughts, setThoughts] = useState<Thought[]>([]);
  const [isConnected, setIsConnected] = useState(false);

  useEffect(() => {
    const ws = new WebSocket(`ws://localhost:8000/ws/agents/${agentId}`);

    ws.onopen = () => {
      setIsConnected(true);
      console.log(`Connected to agent ${agentId}`);
    };

    ws.onmessage = (event) => {
      const data = JSON.parse(event.data) as WebSocketEvent;

      if (data.type === 'agent_thought') {
        setThoughts(prev => [...prev, data.data as Thought]);
      }
    };

    ws.onclose = () => {
      setIsConnected(false);
      console.log(`Disconnected from agent ${agentId}`);
    };

    return () => {
      ws.close();
    };
  }, [agentId]);

  return { thoughts, isConnected };
};
```



---

## 🔧 **ИНСТРУМЕНТЫ РАЗРАБОТКИ**

### **Python инструменты:**
```toml
# pyproject.toml
[tool.black]
line-length = 128
target-version = ['py314']

[tool.isort]
profile = "black"
multi_line_output = 3

[tool.mypy]
python_version = "3.14"
strict = true
warn_return_any = true
warn_unused_configs = true

[tool.pytest.ini_options]
testpaths = ["tests"]
python_files = ["test_*.py", "*_test.py"]
python_classes = ["Test*"]
python_functions = ["test_*"]
asyncio_mode = "auto"
```

### **Frontend инструменты:**
```json
// package.json scripts
{
  "scripts": {
    "dev": "next dev",
    "build": "next build", 
    "start": "next start",
    "lint": "next lint",
    "type-check": "tsc --noEmit",
    "test": "jest",
    "test:watch": "jest --watch"
  }
}
```

### **Docker композиция:**
```yaml
# compose.yml

services:
  backend:
    build: 
      context: ./backend
      dockerfile: Dockerfile
    ports:
      - "8000:8000"
    environment:
      - OLLAMA_BASE_URL=${OLLAMA_BASE_URL}
      - NEO4J_URI=bolt://neo4j:7687
      - KAFKA_BOOTSTRAP_SERVERS=kafka:9092
      - REDIS_URL=redis://redis:6379
    depends_on:
      - neo4j
      - kafka
      - redis
    volumes:
      - ./backend:/app

  frontend:
    build:
      context: ./frontend
      dockerfile: Dockerfile
    ports:
      - "3000:3000"
    environment:
      - NEXT_PUBLIC_API_URL=http://localhost:8000
    volumes:
      - ./frontend:/app
      - /app/node_modules
    depends_on:
      - backend

  neo4j:
    image: neo4j:5.11
    ports:
      - "7474:7474"
      - "7687:7687"
    environment:
      - NEO4J_AUTH=neo4j/password
      - NEO4J_PLUGINS=["apoc"]
    volumes:
      - neo4j_data:/data

  kafka:
    image: apache/kafka:latest
    container_name: kafka
    environment:
      KAFKA_NODE_ID: 1
      KAFKA_PROCESS_ROLES: broker,controller
      KAFKA_LISTENERS: PLAINTEXT://localhost:9092,CONTROLLER://localhost:9093
      KAFKA_ADVERTISED_LISTENERS: PLAINTEXT://localhost:9092
      KAFKA_CONTROLLER_LISTENER_NAMES: CONTROLLER
      KAFKA_LISTENER_SECURITY_PROTOCOL_MAP: CONTROLLER:PLAINTEXT,PLAINTEXT:PLAINTEXT
      KAFKA_CONTROLLER_QUORUM_VOTERS: 1@localhost:9093
      KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR: 1
      KAFKA_TRANSACTION_STATE_LOG_REPLICATION_FACTOR: 1
      KAFKA_TRANSACTION_STATE_LOG_MIN_ISR: 1
      KAFKA_GROUP_INITIAL_REBALANCE_DELAY_MS: 0
      KAFKA_NUM_PARTITIONS: 3

  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"

volumes:
  neo4j_data:
```

---

## 📊 **МОНИТОРИНГ И ЛОГИРОВАНИЕ**

### **Python логирование (Structured):**
```python
import structlog

# Настройка структурированного логирования
structlog.configure(
    processors=[
        structlog.stdlib.filter_by_level,
        structlog.stdlib.add_logger_name,
        structlog.stdlib.add_log_level,
        structlog.stdlib.PositionalArgumentsFormatter(),
        structlog.processors.StackInfoRenderer(),
        structlog.processors.format_exc_info,
        structlog.processors.UnicodeDecoder(),
        structlog.processors.JSONRenderer()
    ],
    wrapper_class=structlog.stdlib.BoundLogger,
    logger_factory=structlog.stdlib.LoggerFactory(),
    cache_logger_on_first_use=True,
)

logger = structlog.get_logger(__name__)

# Использование в коде
async def agent_think(agent_id: str, stimulus: str) -> Thought:
    logger.info(
        "Agent thinking initiated",
        agent_id=agent_id,
        stimulus_length=len(stimulus),
        timestamp=datetime.now().isoformat()
    )

    try:
        thought = await consciousness_service.generate_thought(agent_id, stimulus)
        
        logger.info(
            "Agent thought generated",
            agent_id=agent_id,
            thought_length=len(thought.content),
            confidence=thought.confidence,
            processing_time_ms=thought.processing_time * 1000
        )

        return thought

    except Exception as e:
        logger.error(
            "Agent thinking failed",
            agent_id=agent_id,
            stimulus=stimulus[:100],
            error=str(e),
            exc_info=True
        )
        raise
```

### **Frontend логирование:**
```typescript
// Централизованное логирование для frontend
class Logger {
  private static instance: Logger;

  static getInstance(): Logger {
    if (!Logger.instance) {
      Logger.instance = new Logger();
    }
    return Logger.instance;
  }

  info(message: string, context?: Record<string, any>): void {
    console.log(JSON.stringify({
      level: 'INFO',
      message,
      context,
      timestamp: new Date().toISOString(),
      component: 'frontend'
    }));
  }
  
  error(message: string, error?: Error, context?: Record<string, any>): void {
    console.error(JSON.stringify({
      level: 'ERROR',
      message,
      error: error?.message,
      stack: error?.stack,
      context,
      timestamp: new Date().toISOString(),
      component: 'frontend'
    }));
  }
}

const logger = Logger.getInstance();
```

---

## 🧪 **ТЕСТИРОВАНИЕ**

### **Backend тестирование (pytest):**
```python
# tests/test_agent_consciousness.py
import pytest
from unittest.mock import AsyncMock

from app.domain.entities.agent import ConsciousAgent
from app.application.use_cases.make_agent_think import MakeAgentThinkUseCase

@pytest.mark.asyncio
async def test_agent_internal_dialogue():
    # Arrange
    mock_llm_gateway = AsyncMock()
    mock_llm_gateway.generate_internal_dialogue.return_value = Thought(
        content="Это интересный философский вопрос...",
        confidence=0.8
    )

    agent = ConsciousAgent(
        id="test-alice",
        name="Алиса",
        persona="Любознательная исследовательница"
    )

    use_case = MakeAgentThinkUseCase(llm_gateway=mock_llm_gateway)

    # Act
    thought = await use_case.execute(agent.id, "Что такое сознание?")

    # Assert
    assert thought.content is not None
    assert len(thought.content) > 0
    assert thought.confidence > 0.5
    mock_llm_gateway.generate_internal_dialogue.assert_called_once()
```

### **Frontend тестирование (Jest + RTL):**
```typescript
// tests/components/AgentCard.test.tsx
import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import '@testing-library/jest-dom';
import AgentCard from '@/components/features/agents/AgentCard';

const mockAgent: ConsciousAgent = {
  id: 'alice',
  name: 'Алиса',
  persona: 'Любознательная исследовательница',
  currentState: { isActive: true },
  lastActivity: new Date(),
  thoughtHistory: []
};

describe('AgentCard', () => {
  const mockOnSendMessage = jest.fn();
  const mockOnMakeThink = jest.fn();

  beforeEach(() => {
    jest.clearAllMocks();
  });

  it('renders agent information correctly', () => {
    render(
      <AgentCard 
        agent={mockAgent}
        onSendMessage={mockOnSendMessage}
        onMakeThink={mockOnMakeThink}
      />
    );

    expect(screen.getByText('Алиса')).toBeInTheDocument();
    expect(screen.getByText('Любознательная исследовательница')).toBeInTheDocument();
    expect(screen.getByText('Активен')).toBeInTheDocument();
  });

  it('calls onMakeThink when think button is clicked', async () => {
    render(
      <AgentCard 
        agent={mockAgent}
        onSendMessage={mockOnSendMessage}
        onMakeThink={mockOnMakeThink}
      />
    );

    const thinkButton = screen.getByText('Заставить думать');
    fireEvent.click(thinkButton);

    await waitFor(() => {
      expect(mockOnMakeThink).toHaveBeenCalledWith('Подумай о чем-нибудь интересном');
    });
  });
});
```

---

## 🚀 **РАЗВЕРТЫВАНИЕ И КОНФИГУРАЦИЯ**

### **Environment конфигурация:**
```bash
# .env для development
# Backend
OLLAMA_BASE_URL=http://localhost:11434
OLLAMA_MODEL=llama3.2:1b
#OLLAMA_MAX_TOKENS=1000

# Databases
NEO4J_URI=bolt://localhost:7687
NEO4J_USER=neo4j
NEO4J_PASSWORD=password
KAFKA_BOOTSTRAP_SERVERS=localhost:9092
REDIS_URL=redis://localhost:6379

# Application
DEBUG=true
LOG_LEVEL=INFO
CORS_ORIGINS=["http://localhost:3000"]

# Frontend
NEXT_PUBLIC_API_URL=http://localhost:8000
NEXT_PUBLIC_WS_URL=ws://localhost:8000
```

### **Makefile для удобного управления:**
```makefile
# Управление проектом
.PHONY: help install dev build test clean deploy

help:				## Показать помощь
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

install:			## Установить зависимости
	cd backend && uv pip install -r requirements.txt
	cd frontend && npm install

dev:				## Запустить development режим
	docker-compose up -d neo4j kafka redis
	cd backend && uvicorn app.main:app --reload --host 0.0.0.0 --port 8000 &
	cd frontend && npm run dev

build:				## Собрать production образы
	docker compose build

test:				## Запустить тесты
	cd backend && pytest
	cd frontend && npm test

lint:				## Проверить качество кода
	cd backend && black . && isort . && flake8 . && mypy .
	cd frontend && npm run lint && npm run type-check

clean:				## Очистить контейнеры и образы
	docker compose down -v
	docker system prune -f

deploy:				## Развернуть в production
	docker compose -f compose.prod.yml up -d

logs:				## Показать логи
	docker-compose logs -f

status:				## Статус всех сервисов
	docker-compose ps
```

---

## 🎯 **КРИТЕРИИ КАЧЕСТВА И ПРОИЗВОДИТЕЛЬНОСТИ**

### **Backend критерии:**
- **Время ответа API** < 200ms для простых запросов
- **Время ответа LLM** < 5 секунд для генерации мыслей
- **Покрытие тестами** > 80% для доменной логики
- **Типизация** 100% с mypy strict mode
- **Память** < 2048MB в рабочем состоянии

### **Frontend критерии:**
- **First Contentful Paint** < 1.5 секунд
- **Time to Interactive** < 3 секунд
- **Bundle size** < 500KB gzipped
- **Accessibility score** > 95% (Lighthouse)
- **TypeScript strict** mode без ошибок

### **Интеграционные критерии:**
- **WebSocket latency** < 100ms
- **API error rate** < 1%
- **Memory leaks** отсутствуют (проверка каждые 24 часа)
- **Database connections** properly pooled и не протекают

---

**Это полное техническое видение современной full-stack платформы для сознательных агентов с применением лучших практик разработки!** 🚀🧠✨
