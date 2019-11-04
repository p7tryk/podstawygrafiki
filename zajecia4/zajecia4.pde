final int groundYPos = 420;

int groundXPos = 0;
int direction = 0;
float yPos = groundYPos;
float yVelocity = 0;
float xVelocity = 0;

void setup() {
  size(800, 600, P3D);
  previous=mouseX;
}

void draw() {
// grawitacja i kolizja z podłożem
  yVelocity += .5f;
  yPos += yVelocity;
  if (yPos > groundYPos)
  {
    yPos = groundYPos;
    yVelocity = 0.f;
  }
// animacja podłoża
  groundXPos += direction * 3;
  groundXPos = (groundXPos + 40) % 40;
// rendering
  background(0);
  stroke(200);
// podłoże
  line(0, groundYPos, 639, groundYPos);
  for (int i = groundXPos; i < 640; i+=40)
    line(i, groundYPos, i + 10, groundYPos + 20);
// bałwan
  noStroke();
  fill(220);
  ellipse(320, int(yPos) - 25, 50, 50);
  ellipse(320, int(yPos) - 65, 30, 30);
  fill(#EB8921);
  triangle(
    320-15*direction, int(yPos) - 68,
    320-30*direction, int(yPos) - 65,
  320-15*direction, int(yPos) - 62)
  ;
  if (direction == 0)
    ellipse(320, int(yPos) - 65, 6, 6);
}
int previous = 0;
void mousePressed()
{

  if(mouseButton == RIGHT)
    yVelocity=-12.f;
   else
   {
     previous=mouseX;
     direction = 0; 
   }
}
void mouseDragged()
{
  direction = (previous-mouseX)/50;
  if(direction>10)
    direction=10;
  if(direction<-10)
    direction=-10;
}
/*
void mouseReleased()
{
   previous=mouseX;
   direction = 0;
}*/


void keyPressed() {
// wcisniete lewo/prawo
  if (key != CODED && keyCode == 'A' || key == CODED && keyCode == LEFT)
    direction = 1;
  else if (key != CODED && keyCode == 'D' || key == CODED && keyCode == RIGHT)
    direction = -1;
}

void keyTyped()
{
// wcisniety skok
  if (key == ' ' && yPos == groundYPos)
    yVelocity = -12.f;
}

void keyReleased() {
// puszczone lewo prawo
  if (key != CODED && keyCode == 'A' || key == CODED && keyCode == LEFT
    || key != CODED && keyCode == 'D' || key == CODED && keyCode == RIGHT)
    direction = 0;
}
