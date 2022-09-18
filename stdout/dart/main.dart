import 'dart:io';
import 'dart:convert';

main() {
    new File("countries.txt")
    .openRead()
    .transform(utf8.decoder)
    .transform(new LineSplitter())
    .forEach((l) => print('Fuck $l'));
}
