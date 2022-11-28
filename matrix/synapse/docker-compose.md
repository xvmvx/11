synapse:
    hostname: synapse
    container_name: synapse
    image: matrixdotorg/synapse:latest
    restart: unless-stopped
    depends_on:
      postgres:
        condition: service_healthy
    environment:
      TZ: Asia/Shanghai
    volumes:
      - ./synapse:/data
    healthcheck:
      test: ["CMD", "curl", "-fSs", "http://域名:8008/health"]
      interval: 15s
      timeout: 5s
      retries: 3
      start_period: 5s
    networks:
      - matrix-net
