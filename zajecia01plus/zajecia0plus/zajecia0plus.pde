void setup()
{
  size(700, 700,P3D);
  frameRate(30);
 
}

int first = 100;
int second = 400;

void draw()
{
 int small = 100;
 int big = 200;
 int position1 = 0;
 int position2 = 0;
 background(0);
 
 position1 = first;
 position2 = second;
 move();

 
 beginShape(QUADS);
   fill(255,255,255);
   vertex(position1, position1);
   fill(0,0,255);
   vertex(position1+small, position1);
   fill(0,255,0);
   vertex(position1+small, position1+big);
   fill(255,0,0);
   vertex(position1, position1+big);
endShape();
beginShape(QUADS);
   fill(255,255,0);
   vertex(position2, position1);
   vertex(position2+big, position1);
   vertex(position2+big, position1+big);
   vertex(position2, position1+big);
endShape();
beginShape(QUADS);
   fill(255,0,255); 
   vertex(position1, position2);
   vertex(position1+small, position2);
   vertex(position1+small, position2+big);
   vertex(position1, position2+big);
endShape();
beginShape(TRIANGLE);
   fill(255,0,0);
   vertex(position2,position2+big);
   fill(0,255,0);
   vertex(position2+big, position2+big);
   fill(0,0,255);
   vertex(position2+big/2, position2);
endShape();
  
  
}

void move()
{
  if(first>400&&second>400)
  {
    first--;
    second++;
  }
  else if(first<400)
    first++;
  else(second>400)
    second--;

  
}
