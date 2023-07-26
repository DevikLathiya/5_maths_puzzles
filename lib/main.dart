import 'package:flutter/material.dart';
import 'package:math_puzzles/Win%20Page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Dashbord.dart';
import 'Level Page.dart';
import 'Config.dart';

void main (){
  runApp(MaterialApp(home: Home(),debugShowCheckedModeBanner: false,));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool tmp_color=false;
  bool tmp_color1=false;
  bool tmp_color2=false;

  SharedPreferences ? pref ;
  share_pref() async {
    pref = await SharedPreferences.getInstance();
    cur_level = pref!.getInt("levelno") ?? 0 ;

    for(int i=0;i<cur_level;i++)
    {
      String str = pref!.getString("Lstatus$i") ?? "no";
      lock[i]=str;
    }
    print(lock);
    setState(() {
    });
  }

  @override
  void initState() {
    lock=List.filled(level_img.length, "");
    super.initState();
    share_pref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(alignment: Alignment.center,height: double.infinity,width: double.infinity,
          decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("image/background.jpg"))),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(height: double.infinity,width: double.infinity,alignment: Alignment.center,
                child:Text("Math Puzzle",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                ),
              ),
              Expanded(flex: 4,child: Container(height: double.infinity,width: double.infinity,
              decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("image/blackboard_main_menu.png"))),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  GestureDetector(
                    onTapDown: (details) => tapdown(1), onTapCancel: () => tapcancel(1),
                    onTapUp: (details) => tapup(1),
                    child: InkWell(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Dashbord(cur_level);
                      },));},
                      child: Container(margin: EdgeInsets.all(5),padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(border: (tmp_color==true) ? Border.all(color: Colors.white,width: 2):null,
                        borderRadius: BorderRadius.circular(15),
                            boxShadow: tmp_color==true ? [BoxShadow(color: Colors.blue.shade400)] : null),
                         child: Text("CONTINUE",style: TextStyle(fontSize: 30,color: Colors.white,fontFamily: myfont))
                      ),
                    )),

                  GestureDetector(
                      onTapDown: (details) => tapdown(2), onTapCancel: () => tapcancel(2), onTapUp: (details) => tapup(2) ,
                      child: InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return LevelPage();
                        },));},
                        child: Container(margin: EdgeInsets.all(5),padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(border: (tmp_color1==true) ? Border.all(color: Colors.white,width: 2):null,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: tmp_color1==true ? [BoxShadow(color: Colors.blue.shade400)] : null),
                            child: Text("PUZZLE",style: TextStyle(fontSize: 30,color: Colors.white,fontFamily: myfont))
                        ),
                      )),

                  GestureDetector(
                      onTapDown: (details) => tapdown(3), onTapCancel: () => tapcancel(3), onTapUp: (details) => tapup(3) ,
                      child: InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return WinPage();
                        },));},
                        child: Container(margin: EdgeInsets.all(5),padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(border: (tmp_color2==true) ? Border.all(color: Colors.white,width: 2):null,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: tmp_color2==true ? [BoxShadow(color: Colors.blue.shade400)] : null),
                            child: Text("BUY PRO",style: TextStyle(fontSize: 30,color: Colors.white,fontFamily: myfont))),
                              )),
                        ],
                      ),
                    )),
                Expanded(child: Container(height: double.infinity,width: double.infinity,alignment: Alignment.center,
                child:Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ImageIcon(AssetImage("image/shareus.png"))
                  ],
                )))
            ],
          ),
        ),
      )
    );
  }
  tapdown(int no)
  {
    if(no==1)
      {
        setState(() {
          tmp_color=true;
        });
      }

    if(no==2)
    {
      setState(() {
        tmp_color1=true;
      });
    }
    if(no==3)
    {

      setState(() {
        tmp_color2=true;
      });
    }
  }
  tapcancel(int no)
  {
    setState(() {
      tmp_color=false;
      tmp_color1=false;
      tmp_color2=false;
    });
  }
  tapup(int no)
  {
    setState(() {
      tmp_color=false;
    });
  }
}

