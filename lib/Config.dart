
List <int> levels = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25];
List <int> num = [0,1,2,3,4,5,6,7,8,9];

String myfont="myfont";
int cur_level=0;
String ans_text="";
List lock = [];

List level_img = ["p1.png", "p2.png", "p3.png", "p4.png", "p5.png", "p6.png", "p7.png", "p8.png", "p9.png", "p10.png", "p11.png", "p12.png", "p13.png", "p14.png", "p15.png", "p16.png", "p17.png", "p18.png", "p19.png", "p20.png", "p21.png", "p22.png", "p23.png", "p24.png", "p25.png", "p26.png", "p27.png", "p28.png", "p29.png", "p30.png", "p31.png", "p32.png", "p33.png", "p34.png", "p35.png", "p36.png", "p37.png", "p38.png", "p39.png", "p40.png", "p41.png", "p42.png", "p43.png", "p44.png", "p45.png", "p46.png", "p47.png", "p48.png", "p49.png", "p50.png", "p51.png", "p52.png", "p53.png", "p54.png", "p55.png", "p56.png", "p57.png", "p58.png", "p59.png", "p60.png", "p61.png", "p62.png", "p63.png", "p64.png", "p65.png", "p66.png", "p67.png", "p68.png", "p69.png", "p70.png", "p71.png", "p72.png", "p73.png", "p74.png", "p75.png",];

List share_img =["share1.png","share2.png","share3.png","share4.png","share5.png","share6.png","share7.png","share8.png","share9.png","share10.png","share11.png","share12.png","share13.png","share14.png","share15.png","share16.png","share17.png","share18.png","share19.png","share20.png","share21.png","share22.png","share23.png","share24.png","share25.png","share26.png","share27.png","share28.png","share29.png","share30.png","share31.png","share32.png","share33.png","share34.png","share35.png","share36.png","share37.png","share38.png","share39.png","share40.png","share41.png","share42.png","share43.png","share44.png","share45.png","share46.png","share47.png","share48.png","share49.png","share50.png","share51.png","share52.png","share53.png","share54.png","share55.png","share56.png","share57.png","share58.png","share59.png","share60.png","share61.png","share62.png","share63.png","share64.png","share65.png","share66.png","share67.png","share68.png","share69.png","share70.png","share71.png","share72.png","share73.png","share74.png","share75.png",];

List  ans=["10","10","10","10","10","10","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0"];

