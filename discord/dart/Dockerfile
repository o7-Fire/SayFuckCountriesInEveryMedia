FROM dart:latest
COPY pubspec.lock pubspec.lock
COPY pubspec.yaml pubspec.yaml
COPY bin/bot.dart bin/bot.dart
COPY countries.txt countries.txt
RUN dart pub get
ARG TOKEN
ENV TOKEN=$TOKEN
CMD ["dart", "run"]
