FROM debian:12-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential make socat gdb binutils procps && \
    useradd --no-create-home challenge

COPY entrypoint.sh .
COPY Makefile .
COPY flag.txt .
COPY heappie .
COPY heappie.c .

RUN chmod 755 /app/entrypoint.sh && \
    make

CMD ["/app/entrypoint.sh"]
