class Circle{
  int cX;
  int cY;
  int cD;
  boolean remove=false;
  boolean canMove=true;
  boolean right=false;
  boolean left=false;
 boolean canInteract=false;
  int xSpeed;
  int ySpeed;
  float topBound;
float botBound;
float leftBound;
float rightBound;
  Circle(){
    cX=500;
    cY=150;
    cD=100;
    xSpeed=10;
    ySpeed=5;
    

  }
  
  void render(){
    circle(cX,cY,cD);
topBound=cY-cD/2.5; 
botBound=cY+cD/2.5;
leftBound=cX-cD/2.5;
rightBound=cX+cD/2.5;

}
  
  void move(){
    cY=cY+ySpeed;
    
    if(canMove==true){
if(left==true&cX>300){
  cX=cX-xSpeed;
 }
  if(right==true&&cX<950){
    cX=cX+xSpeed;
 }
}
  }
  
  void groundDetect(){
  
  if(cY>=1450){
   ySpeed=0;
 
   canMove=false;
   canInteract=true;
  }
}
  
  
void collision(Circle otherCircle){
   if(leftBound<otherCircle.rightBound){
 if(rightBound>otherCircle.leftBound){
   if(topBound<otherCircle.botBound){
    if(botBound>otherCircle.topBound){
     canMove=false;
   canInteract=true;
     ySpeed=0;
    }
   }
 }
    } 
}

void shapeCollision(Square aSquare){
if(aSquare.canInteract==true){
  if(leftBound<aSquare.rightBound){
    if(rightBound>aSquare.leftBound){
     if(topBound<aSquare.botBound){
       if(botBound>aSquare.topBound){
         canMove=false;
         ySpeed=0;
         canInteract=true;
       }
     }
    }
    
}
}
}







}
