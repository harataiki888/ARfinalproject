
Button button1;
Button button2;
Button button3;
Button button4;
Button button5;
Button button6;
Button button7;
String[] name;
PImage img1;
PImage img2;
PImage img3;
PImage[] img_array;
String scene = "start";
Integer result_int=0;
String result = "?%";
Integer i;
Integer k;
Integer time;
Integer starttime;
Integer gamestarttime;
Integer gametime;
Integer[] timelimit;
void setup(){
  size(500, 500);
  textSize(9);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  button1=new Button(width/2, height/3,200, 70, color(255, 100, 70), "Learning");
  button2=new Button(width/2, height/1.83,200, 70, color(255, 100, 70), "Freestyle");
  button3=new Button(width/2, height/1.3,200, 70, color(255, 100, 70), "Challenge");
  button4=new Button(width/1.25, height/1.2,100, 60, color(255, 100, 70), "Next");
  button5=new Button(width/5, height/1.2,100, 60, color(255, 100, 70), "Back");
  button6=new Button(width/2, height/1.1,120, 50, color(200, 100, 70), "to Start");
  button7=new Button(width/2, height/1.3,190, 50, color(200, 100, 70), "show Result");
  
  
  img1 = loadImage("seiza_leo.gif");
  img2 = loadImage("seiza_scorpius.gif");
  img3 = loadImage("seiza_taurus.gif");
  name =new String[]{"Leo", "Scorpius","Taurus"};
  img_array=new PImage[]{img1,img2,img3};
  k=2;//max number -1 of zodiac, 88?
  timelimit= new Integer[]{2000,5000,10000};
  
  starttime =millis();  

}

void draw(){
  common();
  time = millis()-starttime;
  if(scene == "start") start_scene();
  else if(scene == "learning") learning_scene();
  else if(scene == "freestyle") freestyle_scene();  
  else if(scene == "challenge") { 
  challenge_scene();}
    else if(scene == "gameover") gameover_scene();  
}

void common(){
  background(255); 
}

void start_scene(){
  fill( 255, 255, 255 );
  background( 0, 0, 0 );
  textSize(40);
  text("Zodiac Simulator", width/2, height/10);
  button1.run();
  button2.run();
  button3.run();
  i=0;
  
  if (button1.isPush()) {
      scene="learning";
    }
  if (button2.isPush()) {
      scene="freestyle";
    }
  if (button3.isPush()) {
      scene="challenge";
        gamestarttime= time ;
    }
    
    drawStar(width/8, height/1.2);
    drawStar(width/5, height/3);
    drawStar(width/7, height/2);
    drawStar(width/6, height/1.4);

    drawStar(width/9, height/8);
    drawStar(width/1.2, height/3);
    drawStar(width/1.3, height/2.4);
    drawStar(width/1.2, height/1.5);
    drawStar(width/1.3, height/1.1);
}

void learning_scene(){
  fill(255,0,0);
  background( 0, 0, 0 );
  button4.run();
  button5.run();
  button6.run();
  if (i>=0 && i<=k){
    fill( 255, 255, 255 );
    textSize(40);
    text(name[i], width/2, height/15);
    image(img_array[i], width/4, height/7, width/2, height/2);
  }else{
    fill( 255, 255, 255 );
    textSize(40);
    text("no more zodiac", width/2, height/3);
    if (i<0){i=0;}
    else if (i>k){i=k;}
  }
  
  if (button6.isPush()) {
      scene="start";
    }
}

void freestyle_scene(){
  fill(255,0,0);
  background( 0, 0, 0 );
  button4.run();
  button5.run();
  button6.run();
  button7.run();
  fill( 255, 255, 255 );
  textSize(40);
  text(result, width/8, height/15);
  
  if (i>=0 && i<=k){
    fill( 255, 255, 255 );
    textSize(40);
    text(name[i], width/2, height/15);
    image(img_array[i], width/4, height/7, width/2, height/2);
  }else{
    fill( 255, 255, 255 );
    textSize(40);
    text("no more zodiac", width/2, height/3);
    if (i<0){i=0;}
    else if (i>k){i=k;}
  }
  
  if (button6.isPush()) {
      scene="start";
    }
    
  if (button7.isPush()) {
    result_int=5;  
    result=str(result_int)+"%";
    }
}

void challenge_scene(){
  fill(255,0,0);
  background( 0, 0, 0 );
  button6.run();
  gametime=millis() -gamestarttime;
  fill( 255, 255, 255 );
  textSize(30);
  text(gametime, width/1.2, height/15);
  
  if (i>=0 && i<=k){
    fill( 255, 255, 255 );
    textSize(40);
    text(name[i], width/2, height/15);
    image(img_array[i], width/4, height/7, width/2, height/2);
    textSize(30);
    text("limit:"+"\n"+timelimit[i], width/8, height/10);
  }else{
    i=k;
    scene="gameover";
  }
  
  if(gametime>timelimit[i]){
    gamestarttime=gamestarttime+gametime;
    i++;}
    
  if (button6.isPush()) {
      scene="start";
    }
}

void gameover_scene(){
  fill(255,0,0);
  background( 0, 0, 0 );
  button6.run();
  fill( 255, 255, 255 );
  textSize(30);
  text("Your Score is"+"\n"+"??", width/2, height/2);  
  if (button6.isPush()) {
      scene="start";
    }
    
    drawStar(width/8, height/1.2);
    drawStar(width/5, height/3);
    drawStar(width/7, height/2);
    drawStar(width/6, height/1.4);

    drawStar(width/9, height/8);
    drawStar(width/1.2, height/3);
    drawStar(width/1.3, height/2.4);
    drawStar(width/1.2, height/1.5);
    drawStar(width/1.3, height/1.1);
}

void mouseClicked(){
  if( button4.checkState()==1){
      i++;
      result = "?%";}
  if( button5.checkState()==1){
      i--;
      result = "?%";}
}

void drawStar(float x, float y) {
  fill(255, 255, 0);
  beginShape();
    vertex(x      , y - 20);
    vertex(x - 12 , y + 15);
    vertex(x + 18 , y -  8);
    vertex(x - 18 , y -  8);
    vertex(x + 12 , y + 15);
  endShape(CLOSE);
}


  //===================================================================
class Button {
  float x, y;
  float sizeX, sizeY;
  int state;

  color baseCol;
  float nb;
  float sb;
  float pb;

  String str;

  Button(float x, float y, float sizeX, float sizeY, color baseCol, String str) {
    this.x=x;
    this.y=y;
    this.sizeX=sizeX;
    this.sizeY=sizeY;
    this.baseCol=baseCol;
    this.str=str;

    nb=1; //normalBrightness
    sb=0.8; //selectBrightness
    pb=0.6; //pushBrightness
  }

  void run() {
    rogic();
    display();
  }

  void display() {
    noStroke();
    changeColor();
    rect(x, y, sizeX, sizeY);

    fill(0, 0, 100);
    textSize(30);
    text(str, x, y);
  }

  void rogic() {
    state=checkState();
  }

  //===================================================================
  boolean isPush() {
    if (checkState()==2) return true;
    return false;
  }
  
  void mouseClicked(){
      }

  int checkState() {
    if (!checkInMouse()) return 0;
    if (!mousePressed) return 1;
    return 2;
  }

  boolean checkInMouse() {
    if (mouseX>x-sizeX/2&&mouseX<x+sizeX/2) {
      if (mouseY>y-sizeY/2&&mouseY<y+sizeY/2) {
        return true;
      }
    }
    return false;
  }

  void changeColor() {
    switch(state) {
    case 0:
      fill(hue(baseCol), saturation(baseCol), brightness(baseCol)*nb);
      break;

    case 1:
      fill(hue(baseCol), saturation(baseCol), brightness(baseCol)*sb);
      break;

    case 2:
      fill(hue(baseCol), saturation(baseCol), brightness(baseCol)*pb);
      break;

    default:
      fill(0, 0, 0);
      break;
    }
  }
}
