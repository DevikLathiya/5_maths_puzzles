import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:math_puzzles/Win%20Page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Config.dart';

class Dashbord extends StatefulWidget {
  int cur_level;
  Dashbord(this.cur_level);

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  int a=0 , b=2;

  SharedPreferences ? pref ;
  share_pref() async {
    pref = await SharedPreferences.getInstance();
  }

  level_skip() async {
    for (int i = 30; i >= 0; i--) {
      await Future.delayed(Duration(seconds: 1));
      a = i;
      print(a);
      setState(() {});
    }
    b = 0;
  }
  Stream get() async* {
    for (int i = 30; i >= 0; i--) {
      await Future.delayed(Duration(seconds: 1));
      a = i;
      yield a;
      print(a);
      setState(() {});
    }
    b = 0;
  }
  @override
  void initState() {
    super.initState();
    print(widget.cur_level);
    cur_level=widget.cur_level;
    print(cur_level);
    share_pref();
    //level_skip();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(height: double.infinity,width: double.infinity,alignment: Alignment.center,padding: EdgeInsets.only(top: 5),
          decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("image/bg1.jpg"))),
          child: Column(
            children: [
              Expanded (flex: 0,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(onTap: () {
                      showDialog(
                        context: context, builder: (context) {
                              return AlertDialog(
                                title: Text("Skip"),
                                content: Text(
                                    "Are You Sure You Want To Skip This Level? You Can Play Skiped Levels Later By Clicking On PUZZLES Manu From Main Screen $a"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel")),
                                  TextButton(
                                      onPressed: () {
                                        print(b);
                                        if (b==0 ||b==2) {
                                          Navigator.pop(context);
                                          pref!.setString("Lstatus$cur_level", "skip");
                                          cur_level++;
                                          pref!.setInt("levelno", cur_level);
                                          ans_text = "";
                                          b=1;
                                          level_skip();
                                          setState(() {});
                                        }
                                      },
                                      child: (b==1) ?Text("Ok",style: TextStyle(color: Colors.cyan.withOpacity(0.30)),) : Text("Ok"))
                                ],
                              );
                          },
                        );
                      },
                      child: Container(height: 50,width: 60,
                        child: Image(image: AssetImage("image/skip.png")),),),

                    Container(width: 200,height: 70,child: Text("Puzzle ${cur_level+1}",style: TextStyle(fontFamily: myfont,fontSize: 25,fontWeight: FontWeight.bold),),alignment: Alignment.center,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("image/level_board.png"))),),

                    InkWell(onTap: () {
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: Text("Hint"),
                          content: Text("hello"),
                          actions: [
                            TextButton(onPressed:  () { Navigator.pop(context); }, child: Text("Ok"))
                          ],
                        );
                      },);
                    },
                      child: Container(height: 50,width: 60,
                        child: Image(image: AssetImage("image/hint.png")),),),
                  ],
                ),
              ),
              Expanded(flex: 5,child: Container(child: Image( image: AssetImage("image/${level_img[cur_level]}")),)),

              Expanded(flex: 1,
                child: Container(padding: EdgeInsets.all(5),decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(height: 50,width: 200,alignment: Alignment.center,
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                              child: Text("$ans_text",style: TextStyle(letterSpacing: 2,fontFamily: myfont,fontSize: 20,fontWeight: FontWeight.bold),)
                          ),

                          Expanded(
                            child: IconButton(onPressed: () {
                              setState(() {
                                ans_text=ans_text.substring(0,ans_text.length-1);
                              });
                            }, icon: Icon(Icons.backspace_sharp,color: Colors.white,)),
                          ),

                          Expanded(flex: 2,
                            child: TextButton(onPressed: () {
                              setState(() {
                                if (ans_text==ans[cur_level])
                                {
                                  pref!.setString("Lstatus$cur_level", "win");
                                  cur_level++;

                                  int pos=pref!.getInt("levelno") ?? 0;

                                  if (pos<=cur_level) {
                                    pref!.setInt("levelno", cur_level);
                                  }
                                  print(cur_level);
                                  ans_text="";
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return WinPage();
                                  },));
                                }
                                else
                                  {
                                    Fluttertoast.showToast(
                                        msg: "Wrong Answer",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.white,
                                        textColor: Colors.black,
                                        fontSize: 16.0
                                    );
                                  }
                              });
                            }, child: Text("SUBMIT",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 20),)),
                          )
                        ],
                      ),
                      Expanded(flex: 2,
                        child: ListView.builder(padding: EdgeInsets.symmetric(horizontal: 4,vertical: 10),
                          itemCount: 10,scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  ans_text+=num[index].toString();
                                });
                              },
                              child: Container(margin: EdgeInsets.symmetric(horizontal: 3),height: 50,width: 30,
                                alignment: Alignment.center,
                                child: Text("${num[index]}",style: TextStyle(fontFamily: myfont,fontWeight: FontWeight.bold),),
                              decoration: BoxDecoration(color: Colors.white60,border: Border.all(color: Colors.white)),),
                            );
                          },),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
