import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:mail_client/db/mails.dart';
import 'package:path_provider/path_provider.dart';
class MailDatabase extends ChangeNotifier{
  static late Isar isar;
  List<Mail> curMail = [];
  static Future<void> initialize () async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [MailSchema],
      directory: dir.path,
    );

  }

  Future<void> deleteById(int id) async {
    await Future.delayed(Duration(milliseconds: 90));
    await isar.writeTxn(() async {
      await isar.mails.delete(id);
    });
    notifyListeners();
    updateCurMail();
  }

  Future<List<Mail>> getAll() async {
    return await isar.mails.where().findAll();
  }


  Future<void> enableAnim(int id) async{
    await isar.writeTxn(() async {
      final curMail = await isar.mails.get(id) as Mail;
      curMail.animation = true;
      await isar.mails.put(curMail);
      
    });
    notifyListeners();
    updateCurMail();
  }

  Future<void> updateCurMail() async {
    curMail.clear();
    curMail = await getAll();
    notifyListeners();
  }

  Future<void> addLetter(String p1, String p2, String p3, String p4) async {
    print("invoked1");
    await isar.writeTxn(() async {
      Mail m = generateTypeObj(p1, p2, p3, p4);
      await isar.mails.put(m);
    });
    notifyListeners();
    updateCurMail();
  }

  Future<void> clear() async {
    await isar.writeTxn(() async {
      await isar.mails.clear();
    });
    notifyListeners();
    updateCurMail();
  }

  Mail generateTypeObj(String head, String letter, String date, String from) {
    Mail m = Mail();
    m.head = head;
    m.letter = letter;
    m.date = date;
    m.from = from;

    return m;
  }


  Future<Mail> get(int id) async {
    return await isar.mails.get(id) as Mail;
  }
}