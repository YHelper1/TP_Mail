import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mail_client/filecontroller.dart';
import 'package:provider/provider.dart';
import 'package:mail_client/db/MailDatabase.dart';
import 'package:mail_client/displayprovider.dart';
import 'package:mail_client/db/mails.dart';

//color pallette https://coolors.co/283044-124854-d7fdec-bfa89e

void main() async {
  

  WidgetsFlutterBinding.ensureInitialized();
  await MailDatabase.initialize();
  runApp(MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => MailDatabase()),
          ],
          child: const MyApp(),
        )
    );
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MailDatabase>().clear();
    context.read<MailDatabase>().addLetter("Hello", "World", "12: 00 01.12.2025", "hello@example.ru");

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(191, 177, 193, 1)),
      ),
      home: const MyHomePage(title: 'PrivateMail'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Widget> widgetList = [];
  
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this (), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final MailDatabase mailDatabase = context.watch<MailDatabase>();
    
    List<Mail> curMail = mailDatabase.curMail;
    parseList(curMail);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color(0xff283044),
      appBar: AppBar(
        backgroundColor: Color(0xff283044),
        title: Text(widget.title, style: TextStyle(fontFamily: 'anatol', fontSize: 45.0, fontWeight: FontWeight.bold, color: Color(0xFFBFA89E)), textAlign: TextAlign.center,
),
      toolbarHeight: 100,),
      body:
      SingleChildScrollView(scrollDirection: Axis.vertical, child:
      Column(children:
      [ListView.separated(
              shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
              cacheExtent: 80.0,
              itemCount: curMail.length,
              itemBuilder: (context,index){
              final letter = curMail[index];
            
              return generateWidget(letter);

            },separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 10);}
            )],)

       ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff283044),
        child: Text(getLogin(), style: TextStyle(fontFamily: 'proxima-nova', fontSize: 30.0, fontWeight: FontWeight.bold, color: Color(0xFFBFA89E)), textAlign: TextAlign.center,
),
      ),
    );
  }

  String getLogin() {
    FileController fileContr = FileController();
    return fileContr.readFile()[0];
  }

  void parseList(List<Mail> mail) {

      widgetList.clear();
      widgetList.add(Container(height: 40,));
      for (Mail letter in mail) {
        widgetList.add(Container(height: 10,));
        widgetList.add(generateWidget(letter));
        widgetList.add(Container(height: 10,));
      }
    }

  Widget generateWidget(Mail letter) {
         
     return GestureDetector(
            onTap: () {},
            child:
             TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: letter.animation ? 0.0 : 0.95, end: letter.animation ? 0.0 : 0.95),
      duration: Duration(milliseconds: 70),
      builder: (context, widthFactor, child) {
            return
            FractionallySizedBox(
              widthFactor: widthFactor,
              child:  
              Material(type: MaterialType.transparency, child:
              
                Container(
              // height: 20,
              // width: 100,
              
              decoration: BoxDecoration(
                color: Color(0xFF746C71),
                borderRadius: BorderRadius.circular(17)
              ),
              child: Column(children: [generateMailInfo(letter),
              
                  Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 10.0), child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                    Flexible(child : Text(overflow: TextOverflow.ellipsis, letter.head.toString(), style: TextStyle(color: Color(0xFFD7FDEC), fontFamily: "clash-grotesk-semibold"),))
                  , 
                  
                  Flexible(child: ElevatedButton(
                    
                    onPressed: () {
                        setState(() {
                              context.read<MailDatabase>().enableAnim(letter.id);
                              print("aaaaa");
                              context.read<MailDatabase>().deleteById(letter.id);
                              
                        });
                      },
                    child: FittedBox(child: Icon(
                      Icons.delete,
                      color: Color(0xFFD7FDEC),
                      size: 30.0,
                    )
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffBFA89E),
                      foregroundColor: Colors.white,
                      shape: 
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17)
                        ),
  


                    ),
                  ),
              )],
              )
            )])
          )));}
     ));
  }


  Widget generateMailInfo(Mail m) {
    return Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 10.0), child: Row (mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: Text(overflow: TextOverflow.ellipsis, m.from.toString(), style: TextStyle(fontFamily: "dmsans", color: Color(0xFFD7FDEC), fontSize: 15),)),
        Flexible(child: Text(overflow: TextOverflow.ellipsis, m.date.toString(), style: TextStyle(fontFamily: "dmsans", color: Color(0xFFD7FDEC), fontSize: 15),)),
      ],
    ));
  }
}

