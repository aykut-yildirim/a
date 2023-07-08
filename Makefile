VENV := .venv
PYTHON3 := ${VENV}/bin/python3
PIP3 := ${VENV}/bin/pip3

.PHONY: env venv run clean

make_env:
	python3 -m pip install --upgrade pip
	python3 -m venv ${VENV}

install_requirements:
	PIP3 install --upgrade pip
	PIP3 install -r requirements.txt
	${PYTHON3} mynet_scraper/main.py

run:
	${PYTHON3} main.py
venv2:
	rm -rf __pycache__
	rm -rf $(VENV)
make_requirements:
	PIP3 freeze > requirements.txt
venv:
	source ${VENV}/bin/activate

clear:
	PIP3 uninstall beautifulsoup4
	PIP3 uninstall blinker
	PIP3 uninstall bs4
	PIP3 uninstall certifi
	PIP3 uninstall charset-normalizer
	PIP3 uninstall click
	PIP3 uninstall dataclasses 
	PIP3 uninstall Flask
	PIP3 uninstall idna
	PIP3 uninstall itsdangerous
	PIP3 uninstall Jinja2
	PIP3 uninstall MarkupSafe
	PIP3 uninstall python-dateutil
	PIP3 uninstall requests
	PIP3 uninstall setuptools
	PIP3 uninstall six
	PIP3 uninstall soupsieve
	PIP3 uninstall tqdm
	PIP3 uninstall urllib3
	PIP3 uninstall Werkzeug
	PIP3 uninstall wheel
	PIP3 uninstall aniso8601
	PIP3 uninstall Flask-RESTful
	PIP3 uninstall pytz
