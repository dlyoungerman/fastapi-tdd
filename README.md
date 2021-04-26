TDD with FastAPI Course: https://testdriven.io/courses/tdd-fastapi/docker-config/

Useful Docker + pipenv example: https://sourcery.ai/blog/python-docker/


https://stackoverflow.com/questions/46503947/how-to-get-pipenv-running-in-docker

```sh
# Since we're using pipenv inside our container we need to preface
# our python commands with `pipenv run`. Example:
docker-compose exec web pipenv run python -m pytest
```
