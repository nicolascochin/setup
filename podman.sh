podman pod create --name XXX -p 5432:5432 -p 6379:6379
# PG
podman container run -d \
    --pod XXX \
    --name XXX_db \
    -e POSTGRES_HOST_AUTH_METHOD=trust \
    postgres:12.4

#Redis 
podman container run -d \
    --pod XXX \
    --name XXX_redis \
    redis:5.0.9
