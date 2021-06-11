name=sokolko/export-cryptopro-cert

build:
	sudo docker build -t $(name) --no-cache .


push:
	sudo docker login
	sudo docker push $(name)
