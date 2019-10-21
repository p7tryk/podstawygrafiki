void setup() 
{
size(500, 500, OPENGL);
noStroke();
fill(255);
}

void directional()
{
  ambientLight(40,40,40);
}


void draw() 
{
 //lights();
  directional();
 background(0);
 rotateY(PI/24);
 translate(width/2, height/2, -20);
 int dim = 18;
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
}
