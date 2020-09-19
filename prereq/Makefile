
prereq:
	# Install the docker prequisites
	@apt-get install -y curl 

install-docker: prereq
	@curl -fsSL https://get.docker.com -o get-docker.sh
	@sh get-docker.sh

	@groupadd docker
	@usermod -aG docker $(USER)
	@newgrp docker

install-docker-compose: prereq
	# download the specified docker compose binaries to the /usr/local/bin directory and set execute permissions
	@curl -L "https://github.com/docker/compose/releases/download/$(DOCKER_COMPOSE_VER)/docker-compose-$(shell uname -s)-$(shell uname -m)" \
		-o /usr/local/bin/docker-compose
	@chmod +x /usr/local/bin/docker-compose
	@docker-compose --version

install: install-docker install-docker-compose
	@echo Docker and Docker Compose installed

uninstall-docker:
	@apt-get purge docker-ce docker-ce-cli containerd.io
	@rm -rf /var/lib/docker

uninstall-docker-compose:
	@rm /usr/local/bin/docker-compose

uninstall: uninstall-docker uninstall-docker-compose
	@echo Uninstalled.
