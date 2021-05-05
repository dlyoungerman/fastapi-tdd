.PHONY: down test up update-db test test-unit test-cov test-cov-html lint black-check black isort-check isort

down:
	docker-compose down

up:
	docker-compose up --build -d && docker-compose exec web pipenv run python app/db.py

update-db:
	docker-compose exec web pipenv run python app/db.py

test:
	docker-compose exec web pipenv run python -m pytest -v

test-unit:
	docker-compose exec web pipenv run python -m pytest -v -k "unit" -n auto

test-cov:
	docker-compose exec web pipenv run python -m pytest --cov="."

test-cov-html:
	docker-compose exec web pipenv run python -m pytest --cov="." --cov-report html

lint:
	docker-compose exec web pipenv run flake8 /usr/src/app/app

black-check:
	docker-compose exec web pipenv run black --check /usr/src/app/app
	docker-compose exec web pipenv run black --diff /usr/src/app/app

black:
	docker-compose exec web pipenv run black /usr/src/app/app

isort-check:
	docker-compose exec web pipenv run isort --check-only /usr/src/app/app
	docker-compose exec web pipenv run isort --diff /usr/src/app/app

isort:
	docker-compose exec web pipenv run isort /usr/src/app/app
