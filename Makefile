# Makefile for VibesHub Core

.PHONY: install test build upload clean prepare

install:
	pip install -e . --break-system-packages
	pip install pytest twine wheel --break-system-packages

clean:
	rm -rf build dist *.egg-info

build:
	python3 setup.py sdist bdist_wheel

test:
	pytest tests/

upload:
	twine upload dist/*

prepare:
	pip install -e . --break-system-packages
	pip install pytest twine wheel --break-system-packages
	rm -rf build dist *.egg-info
	python3 setup.py sdist bdist_wheel
	pytest tests/
