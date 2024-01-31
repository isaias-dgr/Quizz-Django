PYTHON=python
PIP=pip
MANAGE=django-admin
COMPOSE=docker-compose

default: django-dev

run-db:
	@echo "\n 💾 Starting db server..."
	$(COMPOSE) up db adminer -d

django-dev: run-db 
	@echo "\n 🚀 Starting server..."
	$(COMPOSE) up app -d
	make install-full 
	make makemigrations
	make migrate

migrate:
	@echo "\n 👾 Running migrate..."
	$(COMPOSE) exec app $(PYTHON) manage.py migrate

down:
	@echo "\n 🔫 Down 🔫"
	$(COMPOSE) down

makemigrations:
	@echo "\n 👾 Running migrations..."
	$(COMPOSE) exec app $(PYTHON) manage.py makemigrations

install:
	@echo "\n Install $(APP) ..."
	$(COMPOSE) exec app $(PIP) install $(APP)
	$(COMPOSE) exec app $(PIP) freeze > requirements.txt

install-dev:
	@echo "\n Install $(APP) ..."
	$(COMPOSE) exec app $(PIP) install $(APP)
	
install-full:
	@echo "\n 🚧 Install $(APP) ..."
	$(COMPOSE) exec app $(PIP) install -r requirements.txt

create-project:
	@echo "\n Creating a new Django project..."
	$(MANAGE) startproject myproject

run:
	@echo "\n Starting the Django development server..."
	$(PYTHON) -m debugpy --listen 0.0.0.0:5678 --wait-for-client manage.py runserver 0.0.0.0:8000

test:
	@echo "\n Running tests..."
	$(PYTHON) manage.py test

.PHONY: init create-project run test
