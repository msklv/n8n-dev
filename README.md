# n8n — Local Testing Setup

Стек: **n8n** + **PostgreSQL 16** + **Redis 7** (для queue mode).

## Быстрый старт

```bash
# 1. Отредактируйте .env (пароли, encryption key)
cp .env .env.backup   # опционально
nano .env

# 2. Создайте директорию для файлов
mkdir -p local-files

# 3. Запуск
docker compose up -d

# 4. Откройте в браузере
open http://localhost:5678
```

## Полезные команды

| Команда                        | Описание                          |
|-------------------------------|-----------------------------------|
| `docker compose up -d`        | Запустить стек                    |
| `docker compose down`         | Остановить                        |
| `docker compose logs -f n8n`  | Логи n8n                          |
| `docker compose ps`           | Статус контейнеров                |
| `docker compose down -v`      | Полное удаление (с данными)       |

Или через Makefile: `make up`, `make logs`, `make clean`.

## Структура

```
n8n-local/
├── docker-compose.yml   # основной compose-файл
├── .env                 # переменные окружения
├── init-data.sh         # инициализация PostgreSQL
├── local-files/         # shared-директория для файлов
├── Makefile             # shortcuts
└── README.md
```

## Заметки

- `N8N_SECURE_COOKIE=false` — необходимо для локальной работы по HTTP.
- `N8N_ENCRYPTION_KEY` — фиксируйте после первого запуска, иначе потеряете сохранённые credentials.
- Redis используется для queue-режима выполнения воркфлоу.
- Данные хранятся в Docker volumes (`db_storage`, `n8n_storage`, `redis_storage`).
- Директория `local-files/` монтируется в контейнер по пути `/files`.
