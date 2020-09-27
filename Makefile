services = jackett qbittorrent radarr sonarr

.PHONY: docker-compose.%.yml

all: $(services)

jackett: docker-compose.jackett.yml
	@echo setup jackett here

docker-compose.%.yml:
	@docker-compose -f compose/$@ up -d
