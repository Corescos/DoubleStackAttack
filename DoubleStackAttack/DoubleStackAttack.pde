//Final Game (Hello World)
//list of glitches at the bottom of this screen
//My High-score is 1142. Can you beat that?
//for music, this game uses the Brawl Stars Seige battle theme that plays while the game is being played
import processing.sound.*;
SoundFile bgm;

int stateNum;
PImage bgi;

ArrayList<Square> squareList;
ArrayList<Circle> circleList;
Square aSquare;

Animation roboBounce;
Animation roboTalk;
Animation roboAngry;
PImage[] roboImageOne=new PImage[2];
PImage[] roboImageTwo=new PImage[2];
PImage[] roboImageThree=new PImage[2];
//experimental boolean lose condition
boolean canPlay=true;
//the lose condition works!
boolean canAdd=true;
//int startTime;
float score;


void setup(){
size(1250,1750);  
//startTime=millis();
bgm=new SoundFile(this, "DSAmusic.wav");
bgi=loadImage("background1.png");


squareList=new ArrayList<Square>();
circleList=new ArrayList<Circle>();

for(int i=0;i<roboImageOne.length;i++){
 roboImageOne[i]=loadImage("robo_"+i+".png"); 
}
roboTalk=new Animation(roboImageOne,0.15,2);

for(int i=0;i<roboImageTwo.length;i++){
 roboImageTwo[i]=loadImage("robobounce_"+i+".png"); 
}
roboBounce=new Animation(roboImageTwo,0.04,0.5);


for(int i=0;i<roboImageThree.length;i++){
  roboImageThree[i]=loadImage("roboAngry_"+i+".png");
}
roboAngry=new Animation(roboImageThree,0.15,2);

bgi.resize(2500,3500);
}


void draw(){
 
  switch(stateNum){
    
    case 0:
    background(150);
      roboTalk.display(width/2,height/2+300);
    roboTalk.isAnimating=true;
    textSize(55);
    
    text("Welcome to Double Stack Attack!",200,height/2-500);
    text("I'm Stu, the stacking droid!",200,height/2-400);
    text("Click to begin stacking.",200,height/2-300);
    text("Play alone, or bring a friend!", 200,height/2-200);
   
    canAdd=true;
    canPlay=true;
    
    score=0;
    
    
    break;
    
    case 1:
 if(bgm.isPlaying()==false){
bgm.play();
}
 //   for(Circle x: circleList){
 //     x.remove=true;
 //   }
 //for(int i=circleList.size()-1;i>=0;i--){
 //  if(circleList.get(i).remove==true){
 //    circleList.remove(i);
 //  }
 //}
 
 
 
image(bgi,0,0);
//background(150);
 stroke(0);
 strokeWeight(20);
  line(250,300,250,1500);
  line(1000,300,1000,1500);
  line(250,1500,1000,1500);
stroke(0);
strokeWeight(5);
 textSize(37);
 fill(0);
  text("Squares control with J and L; Circles with A and D",100,height-150);
  fill(255);
//  roboTalk.display(125,height/2);
//  roboTalk.isAnimating=true;
//  roboBounce.display(125,height/2);
//  roboBounce.isAnimating=true;
 
 for(int i=squareList.size()-1;i>=0;i--){
  if(squareList.get(i).canMove==false&&squareList.get(i).sY<300){
    canPlay=false;
    stateNum=2;
  }
 }
 for(int i=circleList.size()-1;i>=0;i--){
  if(circleList.get(i).canMove==false&&circleList.get(i).cY<300){
    canPlay=false;
    stateNum=2;
  }
 }


 for(int i=squareList.size()-1;i>=0;i--){
  if(squareList.get(i).canMove==true&&i==squareList.size()-1){
    roboBounce.display(125,height/2+300);
    roboBounce.isAnimating=true;
  }
 }
  
  
 //  for(int i=circleList.size()-1;i>=0;i--){
 // if(circleList.get(i).canMove==true&&i==circleList.size()-1){
 //   roboBounce.display(125,height/2);
 //   roboBounce.isAnimating=true;
 // }
 //}
  //this isn't even in use right now...
   for(int i=squareList.size()-1;i>=0;i--){
  if(squareList.get(i).canMove==false&&i==squareList.size()-1){
    roboTalk.display(125,height/2+100);
    roboTalk.isAnimating=true;
    textSize(55);
    text("You Lose!", 10,height/2-100);
  }
   }
   
   
  //    for(int i=circleList.size()-1;i>=0;i--){
  //if(circleList.get(i).canMove==false&&i==circleList.size()-1){
  //  roboTalk.display(125,height/2);
  //  roboTalk.isAnimating=true;
  //  textSize(55);
  //  text("You Lose!", 10,height/2-100);
  //}
  // }
  
  
  for(Square aSquare : squareList){
  aSquare.render();
aSquare.move();
//aSquare.wallDetect();
aSquare.groundDetect();

for(Square otherSquare : squareList){
 if(aSquare!=otherSquare){
  aSquare.collision(otherSquare); 
 }
}
for(Circle aCircle : circleList){
  aSquare.shapeCollision(aCircle);
}
}
  


for(Circle aCircle : circleList){
 aCircle.render();
 aCircle.move();
 aCircle.groundDetect();
 for(Circle otherCircle : circleList){
  if(aCircle!=otherCircle){
    aCircle.collision(otherCircle);
  }
 }
for(Square aSquare : squareList){

  aCircle.shapeCollision(aSquare);
}





}


//this is gonna be optional data; just seeing if this idea works in practice
 for(int i=squareList.size()-1;i>=0;i--){
    if(squareList.get(i).canMove==false&&i==squareList.size()-1&&canPlay==true){
    squareList.add(new Square());
    
   }
 }
 for(int i=circleList.size()-1;i>=0;i--){
    if(circleList.get(i).canMove==false&&i==circleList.size()-1&&canPlay==true){
    circleList.add(new Circle());    
   }
 }
// startTime=millis()/100;
fill(0);
score=score+.2;
textSize(60);
text(int(score),width-110,height-100);
text("Score:",width-300,height-100);
fill(255);
break;

case 2:

background(50);
   roboAngry.display(width/2,height/2+300);
    roboAngry.isAnimating=true;
    textSize(55);
    text("You Lose...",250,height/2-300);
    text("I can stack better than that!",250,height/2-200);
    text("Click to go back to the start menu", 250,height/2-100);
if(canAdd==false){
    for(Circle x: circleList){
      x.remove=true;
    }
 for(int i=circleList.size()-1;i>=0;i--){
   if(circleList.get(i).remove==true){
     circleList.remove(i);
   }
 }
}
if(canAdd==false){
    for(Square x: squareList){
      x.remove=true;
    }
 for(int i=squareList.size()-1;i>=0;i--){
   if(squareList.get(i).remove==true){
     squareList.remove(i);
   }
 }
}

text("Your Stacking Score:",width/2-300,300);
text(int(score),width/2+200,300);


break;

  }



  


}

void mousePressed(){
if(stateNum==0){
 stateNum=1; 
}
  if(stateNum==2){
   stateNum=0; 
  }
  
  
  if(canPlay==true&&canAdd==true){
  squareList.add(new Square());
circleList.add(new Circle());
canAdd=false;
}
}

void keyPressed(){
 for(int i=squareList.size()-1;i>=0;i--){
  if(key=='j'){
   squareList.get(i).left=true;
 }
if(key=='l'){
 squareList.get(i).right=true; 
}
 }
for(int i=circleList.size()-1;i>=0;i--){
 if(key=='a'){
   circleList.get(i).left=true;
 }
if(key=='d'){
 circleList.get(i).right=true; 
}

}
//if(key=='r'){
//  circleList.add(new Circle());
//}
}
void keyReleased(){
  for(int i=squareList.size()-1;i>=0;i--){
    if(key=='j'){
     squareList.get(i).left=false; 
    }
    if(key=='l'){
    squareList.get(i).right=false;
    }
  }
for(int i=circleList.size()-1;i>=0;i--){
    if(key=='a'){
     circleList.get(i).left=false; 
    }
    if(key=='d'){
    circleList.get(i).right=false;
    }
}

}


//list of glitches and things to fix for the future
//error where I cannot get only one animation to play at a time when 2 different class objects are onscreen (it dupes to 2)
//however, a different version of my game fixes this issue
//circle interacting with other circles and also interacting with squares (i couldn't figure out the distance equation)
//I am discovering new things and ideas as I go along, so things might and are subject to change
//optional failsafe to prevent in-air collisions does not work for some reason
//basically, as it is now, if a circle and square collide with each other in midair, they both stop instantly.
