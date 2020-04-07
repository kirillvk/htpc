# htpc

Updating Via Docker Compose

    Update all images: docker-compose pull
        or update a single image: docker-compose pull radarr
    Let compose update all containers as necessary: docker-compose up -d
        or update a single container: docker-compose up -d radarr
    You can also remove the old dangling images: docker image prune
