FROM julia:latest
COPY . .
ARG TOKEN
ENV TOKEN=$TOKEN
CMD ["julia". 'bot.jl']