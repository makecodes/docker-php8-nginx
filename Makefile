all: help

help:
	@echo "――――――――――――――――――――――――――――――――――――――――――――――――――――――"
	@echo "ℹ️ Comandos disponíveis para $(ENV) ℹ️"
	@echo "―――――――――――――――――――――――――――――――――――――――――――――――――――――"
	@echo "⭐️ Comandos de deployment:"
	@echo "   build:        Construir a imagem do container"
	@echo "   publish:      Publicar a imagem no Docker Hub"
	@echo ""
	@echo "―――――――――――――――――――――――――――――――――――――――――――――――――――――"

build:
	@docker build \
		-t redbeard/nginx-php8:latest \
		-t redbeard/nginx-php8:php8.2 \
		-f Dockerfile .

publish:
	@docker push --all-tags redbeard/nginx-php8
