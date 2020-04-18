# =============================================================================================================
.PHONY: *

# -------------------------------------------------------------------------------------------------------------
# переменные
export NAME?=$(shell echo $(shell basename $(shell pwd)) | awk '{print tolower($0)}')

# -------------------------------------------------------------------------------------------------------------
# цели
$(NAME): down image container
	# @docker-compose run --rm $(NAME) /bin/bash -с /srv/client

# деинсталлировать
down:
	@docker-compose down

# собрать образ
image:
	# @docker-compose build --force-rm --no-cache $(NAME)
	@docker-compose build $(NAME)
	@docker-compose push

# запустить сонтейнер
container:
	@docker-compose up -d

# консоль
shell:
	@docker-compose run --rm $(NAME) /bin/bash
	# @docker-compose exec $(NAME) /bin/bash

# информация
info:
	@docker-compose ps

# журнал
logs:
	@docker-compose logs
