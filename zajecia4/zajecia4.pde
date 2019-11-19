final int groundYPos = 780;
int norm = 0;
int groundXPos = 0;
int direction = -3;
float yPos = groundYPos;
float yVelocity = 0;
float xVelocity = 0;

float globalposition = 0;
float enemy = -1000.f;

int gameover = 0;


void setup() {
  size(640, 800, P3D);
  previous=mouseX;

}
void doGameover()
{
 gameover=1;
 direction=0;
 globalposition = 0;

}
void drawPipe(float globalpos, int pipeHeight)
{
  line(globalpos,groundYPos,globalpos,groundYPos-pipeHeight);
  line(globalpos-10,groundYPos,globalpos-10,groundYPos-pipeHeight);
  
  line(globalpos-10,groundYPos-pipeHeight,globalpos-15,groundYPos-pipeHeight-10);
  line(globalpos,groundYPos-pipeHeight,globalpos+5,groundYPos-pipeHeight-10);
  
  line(globalpos-15,groundYPos-pipeHeight-10,globalpos+5,groundYPos-pipeHeight-10);
  if(globalpos-320<35 && globalpos-320>-35&&yPos > groundYPos-pipeHeight-10)
  {
    println(pipeHeight);
    println("gameover " + (globalpos+enemy) + " " + (enemy+320));
    doGameover();
  }
}
void drawPipeDown(float globalpos, int pipeHeight)
{
  line(globalpos,0,globalpos,0+pipeHeight);
  line(globalpos-10,0,globalpos-10,0+pipeHeight);
  
  line(globalpos-10,0+pipeHeight,globalpos-15,0+pipeHeight+10);
  line(globalpos,0+pipeHeight,globalpos+5,0+pipeHeight+10);
  
  line(globalpos-15,0+pipeHeight+10,globalpos+5,0+pipeHeight+10);
  pipeHeight+=80; //zeby dobrze policzyc wysokosc dla kolizji
  if(globalpos-320<35 && globalpos-320>-35&&yPos < 0+pipeHeight+10)
  {
    println(pipeHeight);
    println("gameover " + (globalpos+enemy) + " " + (enemy+320) + " " + yPos);
    doGameover();
  }
}

void draw2Pipes(float pos, int up, int down)
{
  pos *=250;
  drawPipe(globalposition-enemy+pos, up);
  drawPipeDown(globalposition-enemy+pos, down);
}

void draw() {
 
  
// grawitacja i kolizja z podłożem
  yVelocity += .5f;
  yPos += yVelocity;
  if (yPos > groundYPos)
  {
    yPos = groundYPos;
    //yVelocity = 0.f;
    yVelocity = -(yVelocity/2);
  }
  if (yPos < 80)
  {
     yVelocity = -(yVelocity/2); 
  }
// animacja podłoża
  groundXPos += direction;
  groundXPos = (groundXPos + 40) % 40;
// rendering
  background(0);
  stroke(200);
// podłoże
  line(0, groundYPos, 639, groundYPos);
  for (int i = groundXPos; i < 640; i+=40)
    line(i, groundYPos, i + 10, groundYPos + 20);
    
  //global position for drawing walls
  globalposition += direction;
  drawPipe(globalposition-enemy, 150);
  drawPipeDown(globalposition-enemy, 150);
  
  drawPipe(globalposition-enemy+250, 70);
  drawPipeDown(globalposition-enemy+250, 300);
   
  drawPipe(globalposition-enemy-250, 300);
  drawPipeDown(globalposition-enemy-250, 100);
  
  draw2Pipes(2,300,100);
  draw2Pipes(3,200,300);
  draw2Pipes(4,50,400);
  draw2Pipes(5,300,100);
  draw2Pipes(6,150,350);
  draw2Pipes(7,300,200);
  draw2Pipes(8,100,300);
  draw2Pipes(9,50,400);
  

  println(globalposition);
  if(globalposition<-3450)
    globalposition=0;
  
// bałwan
  noStroke();
  fill(220);
  ellipse(320, int(yPos) - 25, 50, 50);
  ellipse(320, int(yPos) - 65, 30, 30);
  fill(#EB8921);
  if(direction > 1)
    norm = 1;
  else if(direction < -1)
    norm = -1;
  else
    norm = direction;
  if (direction == 0)
    ellipse(320, int(yPos) - 65, 6, 6);
    else
    {
  triangle(
    320-15*norm, int(yPos) - 68,
    320-30*norm, int(yPos) - 65,
  320-15*norm, int(yPos) - 62);
    }

    
    
     if(gameover!=0)
        {
        beginShape(QUADS);
        fill(0, 0, 255);
        vertex(0, 0);
        fill(255, 0, 0);
        vertex(80, 0);
        fill(0, 255, 0);
         vertex(80,80);
        fill(255,255,255);
        vertex(0,80);
        endShape();       
        }
        
}
int previous = 0;
void mousePressed()
{

  if(mouseButton == RIGHT)
  {
    if(yPos>95)
      yVelocity=-12.f;
  }
   else
   {
     previous=mouseX;
     //direction = 0; 
   }
}
void mouseDragged()
{
  if(mouseButton==RIGHT && mouseButton!=LEFT)
    return;
  direction = (previous-mouseX)/50;
  if(direction>10)
    direction=10;
  if(direction<-10)
    direction=-10;
}



void keyPressed() {
// wcisniete lewo/prawo
  if (key != CODED && keyCode == 'A' || key == CODED && keyCode == LEFT)
    direction = 1;
  else if (key != CODED && keyCode == 'D' || key == CODED && keyCode == RIGHT)
    direction = -1;
    if(key == ' ')
    {
      gameover = 0;
      direction = -3;
    }
}

void keyTyped()
{
}

void keyReleased() {
// puszczone lewo prawo
  if (key != CODED && keyCode == 'A' || key == CODED && keyCode == LEFT
    || key != CODED && keyCode == 'D' || key == CODED && keyCode == RIGHT)
    direction = 0;
}
