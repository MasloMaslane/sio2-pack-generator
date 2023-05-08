FROM ubuntu:latest

WORKDIR /app
COPY . .
RUN apt update
RUN apt install curl build-essential -y
RUN curl -sSf https://sh.rustup.rs | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustup default nightly
RUN cargo build

CMD ["cargo", "run"]
EXPOSE 8000
