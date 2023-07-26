import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:math_puzzles/Config.dart';
import 'package:math_puzzles/Dashbord.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({Key? key}) : super(key: key);

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(height: double.infinity,width: double.infinity,
         decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("image/background.jpg"))),
        child:Column(
          children: [
            Expanded(
              child: Container(height: double.infinity,width: double.infinity,
                alignment: Alignment.center,margin: EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 20),
                child:Text("Select Puzzle",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                decoration: BoxDecoration(color: Colors.cyan,borderRadius: BorderRadius.circular(15)),
              ),
            ),
              Expanded(
                flex: 5,
                child: GridView.builder(
                    itemCount: level_img.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if(index < cur_level+1)
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return Dashbord(index);
                            },));
                          }else
                          {
                            Fluttertoast.showToast(
                                msg: "Level is Locked",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.teal,
                                textColor: Colors.black,
                                fontSize: 16.0
                            );
                          }
                        },
                        child: Container(
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: (index < cur_level+1) ? Text("${levels[index]}") : null,
                            decoration: BoxDecoration(
                                border: (index < cur_level+1) ?Border.all(color: Colors.black) : null,
                                borderRadius: BorderRadius.circular(10),
                                image: (index < cur_level+1)
                                    ? (lock[index]=="win")
                                    ? DecorationImage(image: AssetImage("image/tick.png"))
                                    : null
                                    : DecorationImage(image: AssetImage("image/lock.png"))
                            )),
                      );
                    },
                  )),
          ],
        )
      ),
    );
  }
}
