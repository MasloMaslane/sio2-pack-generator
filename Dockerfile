FROM ubuntu:latest

WORKDIR /app
COPY . .
RUN apt update
RUN apt install curl make gcc g++ build-essential -y
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt install nodejs -y
RUN curl -sSf https://sh.rustup.rs | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN npm install --global yarn
RUN npm install
RUN rustup default nightly-2018-08-01
RUN cargo update
RUN cargo build
RUN rustup

CMD ["yarn", "start"]
