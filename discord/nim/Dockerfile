FROM nimlang/nim
COPY . .
RUN nimble install dimscord
ARG TOKEN
ENV TOKEN=$TOKEN
CMD ["nim", "c", "-r", "bot.nim"]