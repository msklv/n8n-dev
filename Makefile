.PHONY: up down restart logs ps clean

up:
	mkdir -p local-files
	docker compose up -d

down:
	docker compose down

restart:
	docker compose restart n8n

logs:
	docker compose logs -f n8n

ps:
	docker compose ps

clean:
	docker compose down -v --remove-orphans
