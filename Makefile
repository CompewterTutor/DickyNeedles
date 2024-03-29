.PHONY: clean virtualenv test docker dist dist-upload

clean:
	find . -name '*.py[co]' -delete

venv:
	python3 -m venv py-39
	@echo "Created Virtual ENV in ./py-39"
	py-39/bin/pip install -r requirements-dev.txt
	py-39/bin/python setup.py develop
	@echo
	@echo "Virtual ENV complete. Now run source /env/bin/activate"
	@echo

oldvirtualenv:
	virtualenv --prompt '|> dickyneedles <| ' env
	env/bin/pip install -r requirements-dev.txt
	env/bin/python setup.py develop
	@echo
	@echo "VirtualENV Setup Complete. Now run: source env/bin/activate"
	@echo

test:
	python -m pytest \
		-v \
		--cov=ledcli \
		--cov-report=term \
		--cov-report=html:coverage-report \
		tests/

docker: clean
	docker build -t ledcli:latest .

dist: clean
	rm -rf dist/*
	python setup.py sdist
	python setup.py bdist_wheel

dist-upload:
	twine upload dist/*
