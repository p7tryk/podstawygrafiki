float time; //<>//
int direction = 0;

void init()
{ //<>//
  time = 0;
}
void drawSquare(int size)
{
  beginShape(QUADS);
  vertex(-10*size, -10*size);
  vertex( 10*size, -10*size);
  vertex( 10*size,  10*size);
  vertex(-10*size,  10*size);
  endShape();
}

void setup()
{
  size(1000, 1000, P3D);
  init();
  noStroke();
}



void draw()
{
  lights();
  background(0);
  translate(width/2,height/2);
  
  int dim = 20;
  for (int i = -height/2; i < height/2; i += dim*1.4) 
   {
    for (int j = -height/2; j < height/2; j += dim*1.4) 
    {  
     pushMatrix();
     translate(i, j, -j);
     box(dim, dim, dim);
     popMatrix();
    }
   }
  camera();
  //rotateZ(direction*time);
  time += 0.1f;
}
void keyPressed()
{
  if (key != CODED && keyCode == 'A' || key == CODED && keyCode == LEFT)
    direction += PI/24;
  else if (key != CODED && keyCode == 'D' || key == CODED && keyCode == RIGHT)
    direction -= PI/24;
}

void keyReleased()
{
  if (key != CODED && keyCode == 'A' || key == CODED && keyCode == LEFT)
    ;
  if (key != CODED && keyCode == 'D' || key == CODED && keyCode == RIGHT)
    ;
}
