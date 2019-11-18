final int groundYPos = 780;
int norm = 0;
int groundXPos = 0;
int direction = 0;
float yPos = groundYPos;
float yVelocity = 0;
float xVelocity = 0;

float wallposition = 100;

void setup() {
  size(640, 800, P3D);
  previous=mouseX;
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
  320-15*norm, int(yPos) - 62)
  ;
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
  if(mouseButton==RIGHT)
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
