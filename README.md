##Run postgresql with docker
    cd postgresql

    docker-compose up -d

##Remove previous containers and clean data
    docker-compose down -v

If you want to remove all images

    docker-compose down -v --rmi all

