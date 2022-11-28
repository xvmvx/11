添加 


caddy:
    image: caddy:2
    hostname: caddy
    container_name: caddy
    ports:
      - 80:80
      - 443:443
    environment:
      TZ: Asia/Shanghai
    volumes:
      - ./caddy/Caddyfile:/etc/caddy/Caddyfile:ro
      - ./caddy/config:/config
      - ./caddy/data:/data
    networks:
      - matrix-net


运行后验证

 https://matrix.example.com/_matrix/federation/v1/version 看能否有返回.

然后到 https://federationtester.matrix.org/ 
