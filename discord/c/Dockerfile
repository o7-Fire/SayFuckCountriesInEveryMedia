FROM gcc:latest
COPY . .
RUN apt update && apt install -y libcurl4-openssl-dev
RUN git clone https://github.com/cogmasters/concord.git
WORKDIR /concord
RUN make
RUN make install
WORKDIR /
ARG TOKEN
ENV TOKEN=$TOKEN
RUN gcc bot.c -o FuckCountries -pthread -lpthread -ldiscord -lcurl
CMD ["./FuckCountries"]
