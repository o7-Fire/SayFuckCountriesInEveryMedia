FROM crystallang/crystal
COPY bot.cr bot.cr
COPY shard.yml shard.yml 
ARG TOKEN
ENV TOKEN=$TOKEN
CMD ["crystal", "bot.cr"]
