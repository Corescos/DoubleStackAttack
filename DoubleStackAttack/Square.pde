class Square{
int sX;
int sY;
int sW;
boolean remove=false;
boolean canMove=true;
boolean right=false;
boolean left=false;
boolean canInteract=false;
int topBound;
int botBound;
int leftBound;
int rightBound;

int xSpeed;
int ySpeed;

Square(){
 
  sX=675;
  sY=150;
  sW=100;
 xSpeed=10;
  ySpeed=5;
}
  
void render(){
 square(sX,sY,sW);
 topBound=sY;
 botBound=sY+sW;
 leftBound=sX;
 rightBound=sX+sW;
  
  
}

void move(){
  sY=sY+ySpeed;  

if(canMove==true){
if(left==true && leftBound>250){
  sX=sX-xSpeed;
 }
  if(right==true && rightBound<1000){
    sX=sX+xSpeed;
 }
}
}

//void wallDetect(){

// //if(leftBound<250){
// // sX=250;
// // // xSpeed=0; 
// // }
// if(rightBound>1000){
// sX=900;
//   // xSpeed=0; 
// }
//}

void groundDetect(){
  
  if(botBound>=1500){
   ySpeed=0;
 
   canMove=false;
   canInteract=true;
  }
}

  void collision(Square otherSquare){
    if(leftBound<otherSquare.rightBound){
 if(rightBound>otherSquare.leftBound){
   if(topBound<otherSquare.botBound){
    if(botBound>otherSquare.topBound){
     canMove=false;
   canInteract=true;
     ySpeed=0;
   
  }
   }
 }
    } 
    }
    
    void shapeCollision(Circle aCircle){
if(aCircle.canInteract==true){
  if(leftBound<aCircle.rightBound){
    if(rightBound>aCircle.leftBound){
     if(topBound<aCircle.botBound){
       if(botBound>aCircle.topBound){
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
