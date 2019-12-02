int xPos, goLeft, goRight;

final int enemyNum = 10;
int[] enemyTab;

int time = 0;

void init()
{
  xPos = width / 2;
  enemyTab = new int[enemyNum];
  for (int i = 0; i < enemyNum; ++i)
    enemyTab[i] = -1;
  goLeft = goRight = 0;
  time = 0;
}

void setup()
{
  size(640, 480, P3D);
  init();
}

void draw()
{
  background(0);
  fill(255);
  stroke(0);
  strokeWeight(1);
  xPos += (goRight - goLeft) * 3;
  if (xPos < 0)
    xPos = 0;
  if (xPos > width)
    xPos = width;
  for (int i = 0; i < enemyNum; ++i)
    if (enemyTab[i] != -1)
    {
      if ((enemyTab[i]+=2) > height + 10)
        enemyTab[i] = -1;
      if (enemyTab[i] > height - 20 && abs(width/(enemyNum + 1)*(i+1) - xPos) < 30)
      {
        delay(1000);
        init();
      }
    }
    else
    {
      if (random(1000) > 995)
        enemyTab[i] = 0;
    }
  ++time;
  pushMatrix();
  translate(xPos, height - 10);
  triangle(-26, 0, 0, -30, 26, 0);
  popMatrix();
  for (int i = 0; i < enemyNum; ++i)
    if (enemyTab[i] != -1)
    {
      pushMatrix();
      translate(width/(enemyNum + 1)*(i+1), enemyTab[i]);
      rotateZ(float(time)/10.f);
      rect(-10, -10, 20, 20);
      popMatrix();
    }
  if (mousePressed)
  {
    stroke(0, 255, 0);
    strokeWeight(4);
    line(xPos, height - 40, mouseX, mouseY);
  }
}

void keyPressed()
{
// UZUPEŁNIĆ o warunek dla klawisza 'A' i strzałki w lewo
  if(key != CODED && keyCode == 'A' || key == CODED && keyCode == LEFT)
    goLeft = 1;
// UZUPEŁNIĆ o warunek dla klawisza 'D' i strzałki w prawo
  if (key != CODED && keyCode == 'D' || key == CODED && keyCode == RIGHT)
    goRight = 1;
}

void keyReleased()
{
// UZUPEŁNIĆ o warunek dla klawisza 'A' i strzałki w lewo
  if (key != CODED && keyCode == 'D' || key == CODED && keyCode == RIGHT)
    goLeft = 0;
// UZUPEŁNIĆ o warunek dla klawisza 'D' i strzałki w prawo
  if (key != CODED && keyCode == 'D' || key == CODED && keyCode == RIGHT)
    goRight = 0;
}

void mousePressed()
{
 for (int i = 0; i < enemyNum; ++i)
    if (enemyTab[i] != -1)
    {
      if ( abs(enemyTab[i] - mouseY) < 30 && abs(width/(enemyNum + 1)*(i+1) - mouseX) < 30)
      {
        enemyTab[i] = -1;
      }
    }
}
