void setup()
{
  size(700, 700,P3D);
  frameRate(30);
 
}
void drawTriangle(float x, float y, float size, int level, int maxlevel)
{
  level++;
  if(level>maxlevel)
    return;
 beginContour();
   
   
   vertex(x-size/2,y+size/3);
   vertex(x,y-2*size/3);
   vertex(x+size/2,y+size/3);
endContour();
drawTriangle(x,y+2*size/3,size/2,level,maxlevel);
//fill(255,0,0);
drawTriangle(x-size/2,y-size/3,size/2,level,maxlevel);
drawTriangle(x+size/2,y-size/3,size/2,level,maxlevel);
  

}
float size_full = 500;
int recursion=3;
void draw()
{
 noStroke();
 background(0,255,0);
 fill(255,255,255);
 beginShape(TRIANGLE);
   vertex(width/2,height/2-2*size_full/3);
   vertex(width/2+size_full/2,height/2+size_full/3);
   vertex(width/2-size_full/2,height/2+size_full/3);

fill(0,0,0);
 drawTriangle(width/2,height/2,-(size_full/2),0,recursion);
 endShape(); //<>//
}

void keyPressed() {
  if (key != CODED && keyCode == 'A' || key == CODED && keyCode == LEFT)
    recursion += 1;
  else if (key != CODED && keyCode == 'D' || key == CODED && keyCode == RIGHT)
    recursion -= 1;
}
