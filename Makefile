services = jackett qbittorrent radarr sonarr
DOCKER_COMPOSE_VER = 1.27.3

.PHONY: docker-compose.%.yml

all: $(services)

jackett: docker-compose.jackett.yml
	@echo setup jackett here

docker-compose.%.yml:
	@docker-compose -f compose/$@ up -d

docker-prereq:
	# Install the docker prequisites
	@apt-get install -y \
    	apt-transport-https \
    	ca-certificates \
    	curl \
    	gnupg-agent \
    	software-properties-common

add-docker-repo: docker-prereq
	# Download the repository key and add the repository
	@curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	@add-apt-repository \
   		"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   		focal \
   		stable"

install-docker: add-docker-repo
	# Update package lists and install docker-ce
	@apt-get update
	@apt-get install -y docker-ce docker-ce-cli containerd.io

install-docker-compose: install-docker
	# download the specified docker compose binaries to the /usr/local/bin directory and set execute permissions
	@curl -L "https://github.com/docker/compose/releases/download/$(DOCKER_COMPOSE_VER)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	@chmod +x /usr/local/bin/docker-compose
	@docker-compose --version

install: install-docker install-docker-compose
	@echo Docker and Docker Compose installed
