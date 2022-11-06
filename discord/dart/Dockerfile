FROM dart:latest
COPY . .
RUN dart pub get
ARG TOKEN
ENV TOKEN=$TOKEN
CMD ["dart", "run"]
