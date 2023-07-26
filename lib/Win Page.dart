import 'package:flutter/material.dart';
import 'package:math_puzzles/Dashbord.dart';
import 'Config.dart';
import 'main.dart';

class WinPage extends StatefulWidget {
  const WinPage({Key? key}) : super(key: key);

  @override
  State<WinPage> createState() => _WinPageState();
}

class _WinPageState extends State<WinPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.red.shade50,
      body: Center(
        child: Column(
          children: [
            Container(width: double.infinity,height: 60,alignment: Alignment.center,
                margin: EdgeInsets.only(top: 40,left: 20,right: 20),
                decoration: BoxDecoration(color: Colors.cyan.shade200,borderRadius: BorderRadius.circular(20)),
                child: Text("Puzzle $cur_level Completed",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))),

             CircleAvatar(radius: 200,backgroundColor: Colors.teal.shade300,
                 child: Image(fit: BoxFit.fill,image: AssetImage("image/trophy.png"))),

            InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Dashbord(cur_level);
            },));
            }, child: Container(height: 50,width: 200,alignment: Alignment.center,
                child: Text("CONTINUE",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                decoration: BoxDecoration(color: Colors.cyan.shade200,borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.yellow,offset: Offset(2, 5))]),
              ),),

            InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Home();
              },));
            }, child: Container(height: 50,width: 200,alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              child: Text("MAIN MENU",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
              decoration: BoxDecoration(color: Colors.cyan.shade200,borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(color: Colors.yellow,offset: Offset(2, 5))]),
              ),),

            InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Home();
              },));
            }, child: Container(height: 50,width: 200,alignment: Alignment.center,
              child: Text("BUY PRO",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
              decoration: BoxDecoration(color: Colors.cyan.shade200,borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(color: Colors.yellow,offset: Offset(2, 5))]),
              ),)
          ],
        ),
      ),
    );
  }
}
