Firs run "./build.sh" so it will create the containers and Push them to Docker Hub.

To run the infrastructure using Docker COmpose, run the following commands:

docker-compose -f docker-compose/docker-compose.yaml up -d

cd hassam-docker
docker run --rm -w /app -v $(pwd):/app composer install
cp .env.example .env
docker exec laravel-php php artisan key:generate
