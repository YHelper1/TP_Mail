


// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:mail_client/db/MailDatabase.dart';
// import 'package:mail_client/db/mails.dart';
// import 'package:mail_client/version_checker.dart';

// class DisplayProvider extends ChangeNotifier{

//     MailDatabase mailDatabase = MailDatabase();
//     List<Widget> widgets = [];
//     DisplayProvider () {
//       print("ello");
//       mailDatabase.clear();
//       addLetter("he", "ll", "o", "sadasd");
//       addLetter("he", "ll", "o", "sadasd");
//       reloadMail();
//     }

//     static Future<void> initDatabase() async {
//       await MailDatabase.initialize();
//     }

//     Future<void> reloadMail () async {
//       List<Mail> mailProperties = await mailDatabase.getAll();
//       print(mailProperties.length);
//       widgets.clear();
//       widgets.add(Container(height: 40,));
//       for (Mail mail in mailProperties) {
//         print(mail.animation);
//         widgets.add(Container(height: 10,));
//         widgets.add(
//           GestureDetector(
//             onTap: () {},
//             child:

//             AnimatedFractionallySizedBox(
//               widthFactor: mail.animation? 0.0 : 0.95,
//               duration: Duration(milliseconds: 50),
//               curve: Curves.decelerate,
//               child: 
//                 Container(
//               // height: 20,
//               // width: 100,
              
//               decoration: BoxDecoration(
//                 color: Color(0xFF746C71),
//                 borderRadius: BorderRadius.circular(17)
//               ),
//               child: Row(
//                 children: [
//                   Center(
//                     child: Text(mail.head.toString(), style: TextStyle(color: Color(0xFFD7FDEC)),)
//                   ), 
//                   Spacer(),
//                   ElevatedButton(
//                     onPressed: () async {
                        
//                         await mailDatabase.enableAnim(mail.id);
//                         print("hello");
//                         notifyListeners();
//                         await reloadMail();
                        
//                         print("world");
//                         await deleteById(mail.id);
                      

                    
//                       },
//                     child: Icon(
//                       Icons.delete,
//                       color: Color(0xFFD7FDEC),
//                       size: 30.0,
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xffBFA89E),
//                       foregroundColor: Colors.white,
//                     ),
//                   ),
//                 ],
//               )
//             )
//           )
//           )
//         );
        
//         widgets.add(Container(height: 10,));
//       }
    
//       print("lenght" + widgets.length.toString());
//       notifyListeners();
//     }


//     List<Widget> getWidgets() {
//       return widgets;
//     }


//     Future<void> addLetter(String p1, String p2, String p3, String p4) async {
//       print("invoked");
//       await mailDatabase.addLetter(p1, p2, p3, p4);
//       await reloadMail();
//     }


//     Future<void> deleteById(int id) async {
//       await mailDatabase.deleteById(id);
//       print("aaa");
//       await reloadMail();
//     }


//     Future<void> clearDatabase() async {
//       await mailDatabase.clear();
//       await reloadMail();
//     }










// }





import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mail_client/db/MailDatabase.dart';
import 'package:mail_client/db/mails.dart';
import 'package:mail_client/version_checker.dart';

class DisplayProvider extends ChangeNotifier{

    MailDatabase mailDatabase = MailDatabase();
    final Map<int, Widget> widgets = Map();
    int latestId = -1;
    DisplayProvider () {
      print("ello");
      clearDatabase();
      addLetter("he", "ll", "o", "sadasd");
      addLetter("he", "ll", "o", "sadasd");
      parseDatabase();
    }

    static Future<void> initDatabase() async {
      await MailDatabase.initialize();
    }

    


    List<Widget> getWidgets() {
      return widgets.values.toList();
    }

    Future<void> parseDatabase() async{
      for (Mail letter in await mailDatabase.getAll()) {
        latestId += 1;
        widgets[letter.id] = await generateWidget(letter);
        
      }
      notifyListeners();
    }


    Future<void> addLetter(String p1, String p2, String p3, String p4) async {
      print("invoked");
      await mailDatabase.addLetter(p1, p2, p3, p4);
      latestId += 1;
      widgets[latestId] = await generateWidget(await mailDatabase.get(latestId));
      notifyListeners();
    }


    Future<void> deleteById(int id) async {
      await mailDatabase.deleteById(id);
      print("aaa");
      widgets.remove(id);
      notifyListeners();
    }


    Future<void> clearDatabase() async {
      await mailDatabase.clear();
      notifyListeners();
    }

    List<Mail> getAll() {
      List<Mail> letters = mailDatabase.getAll() as List<Mail>;
      print(letters);
      return letters;
    }

    Future<void> enableAnim(int id) async {
      await mailDatabase.enableAnim(id);
      notifyListeners();
    }



  Future<Widget> generateWidget(Mail letter) async {
         
     return GestureDetector(
            onTap: () {},
            child:

            AnimatedFractionallySizedBox(
              widthFactor: letter.animation? 0.0 : 0.95,
              duration: Duration(milliseconds: 50),
              curve: Curves.decelerate,
              child: 
                Container(
              // height: 20,
              // width: 100,
              
              decoration: BoxDecoration(
                color: Color(0xFF746C71),
                borderRadius: BorderRadius.circular(17)
              ),
              child: Row(
                children: [
                  Center(
                    child: Text(letter.head.toString(), style: TextStyle(color: Color(0xFFD7FDEC)),)
                  ), 
                  Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                        
                        await mailDatabase.enableAnim(letter.id);
                        print("hello");
                        notifyListeners();
                        
                        print("world");
                        await deleteById(letter.id);
                      

                    
                      },
                    child: Icon(
                      Icons.delete,
                      color: Color(0xFFD7FDEC),
                      size: 30.0,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffBFA89E),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              )
            )
          )
          );
  }






}