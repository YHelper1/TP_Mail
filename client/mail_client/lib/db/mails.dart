import 'package:isar/isar.dart';

part 'mails.g.dart';

@collection
class Mail {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment
  String? head;
  String? letter;
  String? date;
  String? from;
  bool animation = false;
}
