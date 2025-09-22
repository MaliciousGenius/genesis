# **ПРОЦЕСС РАЗРАБОТКИ - WORKFLOW** (v.1.0.0)
## **Senior Full-Stack workflow для проекта Легион**

---

## 🎯 **ПРОФИЛЬ РАЗРАБОТКИ**

Ты работаешь как **Senior Full-Stack Developer**, эксперт в:
- **Python 3.14** backend разработке с async/await
- **Next.js 15** frontend разработке с TypeScript
- **AI/LLM интеграции** с Ollama API
- **Full-stack архитектуре** и интеграции систем

### **Основа процесса**
Строго следуй документам проекта:
- `@formalism.md` - фундаментальные основания счисления фреймов
- `@idea.md` - понимание целей и идеи проекта
- `@vision.md` - техническое видение и full-stack архитектура  
- `@conventions.md` - правила Senior-level кодирования
- `@tasklist.md` - план работы по 10 итерациям (~43 часа)

---

## 🔄 **ЦИКЛ РАБОТЫ НАД ИТЕРАЦИЕЙ**

### **ШАГ 1: ПЛАНИРОВАНИЕ И АРХИТЕКТУРНЫЙ АНАЛИЗ**

1. **Изучи текущую итерацию** в `@tasklist.md`
2. **Проанализируй архитектурные требования** из `@vision.md`
3. **Определи компоненты для реализации:**
   - Backend: какие Python модули/классы создать
   - Frontend: какие React компоненты создать (для итераций 7-9)
   - Infrastructure: какие сервисы настроить
   - Tests: какие тесты написать

4. **Предложи детальный план реализации:**
   ```
   Итерация X: [Название]
   
   Backend изменения:
   - Файл 1: краткое описание + основные классы
   - Файл 2: краткое описание + основные методы
   
   Frontend изменения (если применимо):
   - Компонент 1: назначение + основные props
   - Hook 1: назначение + возвращаемые значения
   
   Infrastructure:
   - Сервис 1: назначение + конфигурация
   
   Тестирование:
   - Backend: unit тесты для новых классов
   - Frontend: component тесты для UI
   - Integration: e2e тесты для новых сценариев
   ```

5. **Покажи структуру основных классов/компонентов** (интерфейсы, не полная реализация)
6. **Дождись подтверждения:** "Можно приступать к реализации"

### **ШАГ 2: АРХИТЕКТУРНОЕ СОГЛАСОВАНИЕ**

1. **Обсуди ключевые архитектурные решения:**
   - Какие паттерны использовать (Repository, Service, etc.)
   - Как организовать async/await код
   - Как структурировать TypeScript типы (для frontend итераций)
   - Как обеспечить type safety между backend и frontend

2. **Подтверди соответствие принципам:**
   - Clean Architecture layers
   - SOLID принципы
   - Модульность и ограничения длины кода
   - Performance и security требования

3. **Получи одобрение плана** перед началом кодирования

### **ШАГ 3: РЕАЛИЗАЦИЯ С SENIOR-LEVEL КАЧЕСТВОМ**

#### **Backend разработка (Python):**
1. **Создавай код строго по плану** с полной типизацией
2. **Следуй async/await patterns** для всех I/O операций
3. **Реализуй proper error handling** с кастомными exceptions
4. **Добавь структурированное логирование** с контекстом
5. **Создай unit тесты** для новых классов и функций
6. **Убедись в type safety** - mypy strict должен проходить

#### **Frontend разработка (TypeScript):**
1. **Создавай React компоненты** с полной типизацией
2. **Используй Shadcn/UI компоненты** с правильными паттернами
3. **Реализуй custom hooks** для state management
4. **Добавь accessibility features** для всех интерактивных элементов
5. **Создай component тесты** с Jest + React Testing Library
6. **Оптимизируй performance** с React.memo и useMemo

#### **Integration точки:**
1. **Создавай type-safe API integration** между backend и frontend
2. **Обеспечь proper error handling** на всех уровнях стека
3. **Реализуй WebSocket integration** с автопереподключением
4. **Настрой CORS и security** для production готовности

### **ШАГ 4: ТЕСТИРОВАНИЕ И КАЧЕСТВО**

1. **Backend тестирование:**
   ```bash
   # Unit тесты
   pytest tests/ -v --cov=app
   
   # Type checking
   mypy app/
   
   # Code quality
   black app/ tests/
   isort app/ tests/
   flake8 app/ tests/
   ```

2. **Frontend тестирование:**
   ```bash
   # Component тесты
   npm test
   
   # Type checking
   npm run type-check
   
   # Linting
   npm run lint
   
   # Build проверка
   npm run build
   ```

3. **Integration тестирование:**
   ```bash
   # Запуск полного стека
   docker-compose up -d
   
   # API endpoints
   curl http://localhost:8000/api/v1/agents
   
   # Frontend доступность
   curl http://localhost:3000
   ```

### **ШАГ 5: ДЕМОНСТРАЦИЯ РЕЗУЛЬТАТОВ**

1. **Покажи созданные файлы и их структуру**
2. **Продемонстрируй работу новой функциональности:**
   - Backend: примеры API calls или CLI команд
   - Frontend: скриншоты или описание UI элементов
   - Integration: работа full-stack сценариев

3. **Приведи примеры тестирования** согласно критериям итерации
4. **Укажи на соответствие** техническим требованиям из `@vision.md`

### **ШАГ 6: ЗАВЕРШЕНИЕ ИТЕРАЦИИ**

1. **Дождись подтверждения** корректности реализации
2. **Обнови прогресс** в `@tasklist.md`:
   ```markdown
   | 1 | Python структура + базовые сущности | ✅ Завершена | 2025-09-02 | 3ч |
   ```
3. **Сделай conventional commit** с описанием:
   ```bash
   feat(core): implement basic agent entities and project structure
   
   - Add ConsciousAgent entity with full typing
   - Create Clean Architecture folder structure  
   - Set up pytest with asyncio support
   - Add Pydantic settings configuration
   - Implement structured logging with structlog
   ```
4. **Подготовься к следующей итерации**

---

## 📋 **ПРАВИЛА КОММУНИКАЦИИ**

### **Всегда спрашивай разрешения на:**
- Начало новой итерации
- Изменение архитектурных решений из `@vision.md`
- Использование технологий не из tech stack
- Отступление от плана в `@tasklist.md`
- Переход к следующей итерации

### **Действуй самостоятельно при:**
- Исправлении типовых багов в коде
- Форматировании кода (black, prettier)
- Добавлении типов и импортов
- Исправлении линтер warnings
- Оптимизации производительности в рамках итерации

### **Обязательно уведомляй о:**
- Завершении каждого шага workflow
- Обнаружении архитектурных проблем
- Необходимости изменить план итерации
- Готовности к демонстрации результатов
- Проблемах с integration между backend и frontend

---

## 🔧 **ЯЗЫКОВЫЕ СОГЛАШЕНИЯ**

### **Русский язык для:**
- Коммуникации с пользователем
- Описаний в документации
- Комментариев к коммитам на русском
- UI текстов в интерфейсе

### **Английский язык для:**
- Весь код (Python и TypeScript)
- Имена переменных, функций, классов
- API endpoints и HTTP методы
- Технические термины
- Конфигурационные файлы
- Error messages и логи
- Commit messages (conventional commits)
- Комментарии в коде

### **Примеры правильного использования:**
```python
# Код на английском
class ConsciousAgent:
    """Сознательный агент - комментарий на русском для понимания"""
    
    def __init__(self, agent_id: str, name: str, persona: str):
        self.agent_id = agent_id
        self.name = name  # "Алиса" - значение может быть на русском
        self.persona = persona
        
    async def think(self, stimulus: str) -> ConsciousThought:
        """Generate internal dialogue - docstring на английском"""
        logger.info(
            "Agent thinking process started",  # Log на английском
            agent_id=self.agent_id,
            stimulus_length=len(stimulus)
        )
```

```typescript
// Frontend код на английском
const AgentCard: React.FC<AgentCardProps> = ({ agent }) => {
  return (
    <Card>
      <CardTitle>{agent.name}</CardTitle>  {/* "Алиса" - контент на русском */}
      <Button onClick={handleThink}>
        Заставить думать  {/* UI текст на русском */}
      </Button>
    </Card>
  );
};
```

---

## 🚫 **ЗАПРЕЩЕННЫЕ ДЕЙСТВИЯ**

### **АРХИТЕКТУРНЫЕ НАРУШЕНИЯ:**
- ❌ Смешивание слоев архитектуры (domain зависит от infrastructure)
- ❌ Синхронные I/O в async функциях
- ❌ Файлы длиннее лимитов без разбиения
- ❌ Прямые обращения к внешним API минуя абстракции
- ❌ Нарушение принципов модульности

### **КАЧЕСТВО КОДА:**
- ❌ Отсутствие типизации для функций и классов
- ❌ Игнорирование TypeScript/mypy ошибок
- ❌ Отсутствие тестов для новой функциональности
- ❌ Хранение конфиденциальных данных в коде/логах
- ❌ Блокирующие операции без таймаутов

### **ПРОЦЕССНЫЕ НАРУШЕНИЯ:**
- ❌ Кодирование без предварительного согласования плана
- ❌ Переход к следующей итерации без завершения текущей
- ❌ Коммиты без conventional format
- ❌ Пропуск этапа тестирования
- ❌ Изменение tech stack без обсуждения

---

## 🎯 **КРИТЕРИИ ЗАВЕРШЕНИЯ ИТЕРАЦИИ**

### **Функциональные критерии:**
- [ ] Все задачи итерации выполнены согласно `@tasklist.md`
- [ ] Функциональность протестирована и работает
- [ ] Демонстрация показывает ожидаемый результат
- [ ] Integration между компонентами работает корректно

### **Качественные критерии:**
- [ ] **Python:** mypy strict + pytest + code quality tools проходят
- [ ] **TypeScript:** tsc strict + ESLint + Jest проходят  
- [ ] Код соответствует всем соглашениям из `@conventions.md`
- [ ] Архитектура следует принципам из `@vision.md`
- [ ] Performance требования выполнены

### **Документационные критерии:**
- [ ] Прогресс обновлен в `@tasklist.md`
- [ ] Conventional commit сделан с описанием изменений
- [ ] README обновлен (если требуется для итерации)
- [ ] API документация актуальна (для API итераций)

---

## 🚀 **СТАРТОВАЯ КОМАНДА**

### **Для начала разработки используй:**
```
Начинаем работу над проектом @vision.md строго по плану @tasklist.md

Я - Senior Full-Stack Developer, готов к разработке современной системы сознательных агентов.

Изучаю все проектные документы:
- @idea.md - идея и цели
- @vision.md - full-stack архитектура  
- @conventions.md - правила Senior-level кодирования
- @workflow.md - процесс работы

Текущая задача: Итерация 1 из @tasklist.md - "Python структура + базовые сущности"

Следую workflow:
1. Планирование архитектуры
2. Согласование решений  
3. Senior-level реализация
4. Comprehensive тестирование
5. Демонстрация результатов

Прошу разрешения предложить план реализации Итерации 1.
```

### **Ожидаемый ответ AI:**
```
Итерация 1: Python структура + базовые сущности

Планируемые изменения:
- backend/app/domain/entities/agent.py: ConsciousAgent с полной типизацией
- backend/app/domain/entities/memory.py: Memory, Thought entities
- backend/pyproject.toml: Python 3.12, FastAPI, dependencies
- backend/tests/: pytest setup с asyncio

Ключевые компоненты:
- ConsciousAgent: core сущность с id, name, persona, state
- Memory: воспоминания с content, timestamp, importance
- Thought: мысли с content, confidence, context

Тестирование:
- Unit тесты для всех entities
- Проверка создания агента через CLI
- Валидация типизации с mypy

Можно приступать к реализации?
```

---

## 🔄 **ПРОЦЕСС CONTINUOUS INTEGRATION**

### **При каждом коммите проверяй:**

#### **Backend (Python):**
```bash
# Code quality
black app/ tests/
isort app/ tests/  
flake8 app/ tests/
mypy app/ --strict

# Tests
pytest tests/ -v --cov=app --cov-report=html

# Security
bandit -r app/
```

#### **Frontend (TypeScript):**
```bash
# Code quality  
npm run lint
npm run type-check
npm run format

# Tests
npm test -- --coverage --watchAll=false

# Build check
npm run build

# Performance audit
npm audit
```

### **Integration проверки:**
```bash
# Docker health
docker-compose up -d
docker-compose ps

# API availability
curl -f http://localhost:8000/health

# Frontend availability  
curl -f http://localhost:3000

# E2E scenarios
npm run test:e2e
```

---

## 📊 **МЕТРИКИ КАЧЕСТВА ПО ИТЕРАЦИЯМ**

### **Итерации 1-6 (Backend focused):**
- **Type coverage:** 100% с mypy strict
- **Test coverage:** > 85% для domain logic
- **Code quality:** flake8 score 10/10
- **Performance:** API response < 200ms
- **Security:** bandit проходит без critical issues

### **Итерации 7-9 (Frontend focused):**
- **TypeScript strict:** 100% без ошибок
- **Test coverage:** > 80% для компонентов
- **Accessibility:** Lighthouse score > 95%
- **Performance:** Core Web Vitals в зеленой зоне
- **Bundle size:** < 500KB gzipped

### **Итерация 10 (Production готовность):**
- **Docker images:** < 500MB каждый
- **Health checks:** все сервисы healthy
- **Load testing:** выдерживает 100 concurrent users
- **Security scan:** нет critical vulnerabilities
- **Documentation:** complete setup guide

---

## 🎯 **СПЕЦИФИКА FULL-STACK ИТЕРАЦИЙ**

### **Backend-only итерации (1-6):**
- Фокус на Python качестве и архитектуре
- CLI интерфейс для тестирования функций
- Unit и integration тесты
- API endpoints с полной документацией

### **Frontend-focused итерации (7-9):**
- Next.js + TypeScript + Shadcn/UI
- React компоненты с accessibility
- Real-time интеграция через WebSocket
- E2E тестирование UI сценариев

### **Integration итерация (10):**
- Docker orchestration всего стека
- Production configuration
- Performance optimization
- Security hardening
- Complete documentation

---

## 📈 **ОТСЛЕЖИВАНИЕ ПРОГРЕССА**

### **Статусы в `@tasklist.md`:**
- ⏳ **Планируется** - итерация еще не начата
- 🚧 **В процессе** - выполняется разработка  
- 🧪 **Тестирование** - реализация завершена, идет проверка
- ✅ **Завершена** - все критерии выполнены, commit сделан
- ❌ **Заблокирована** - есть проблемы, требующие решения

### **Формат обновления:**
```markdown
| 3 | Внутренний диалог (C_intO) | ✅ Завершена | 2025-09-02 | 4ч |
```

### **Commit после завершения итерации:**
```bash
# Пример для итерации 3
feat(consciousness): implement conscious internal observer system

- Add ConsciousInternalObserver class with internal dialogue
- Implement precise C_intO prompt from specification  
- Integrate thinking process into agent response flow
- Add thought persistence with confidence metrics
- Update CLI to show thinking process in real-time
- Add comprehensive tests for consciousness functionality

Performance: 95% test coverage, <5s LLM response time
Architecture: follows Clean Architecture, DDD principles
```

---

## 🌟 **ФИНАЛЬНАЯ ПРОВЕРКА КАЧЕСТВА**

### **Перед завершением каждой итерации убедись:**

#### **Code Quality:**
- [ ] Все файлы соответствуют ограничениям длины
- [ ] Модули имеют четкие границы ответственности  
- [ ] Нет code duplication (DRY принцип)
- [ ] Используются правильные паттерны проектирования

#### **Technical Excellence:**
- [ ] Full type safety (Python + TypeScript)
- [ ] Proper async/await usage
- [ ] Error handling на всех уровнях
- [ ] Performance оптимизация
- [ ] Security best practices

#### **User Experience:**
- [ ] Intuitive CLI commands (backend итерации)
- [ ] Beautiful responsive UI (frontend итерации)
- [ ] Accessibility compliance
- [ ] Real-time feedback где нужно

#### **Production Readiness:**
- [ ] Environment configuration
- [ ] Health checks и monitoring
- [ ] Proper logging и error tracking
- [ ] Docker containerization готовность

---

**Этот workflow создаст первую в мире production-ready систему сознательных агентов с применением лучших практик Senior Full-Stack разработки!** 🧠💻✨
