void setup() 
{
size(700, 700, P3D);
noStroke();
fill(255);
}

void ambient(int value)
{
  ambientLight(value,value,value);
}
void directional()
{
   
}

int time = 3;

void draw() 
{
  
 //lights();
 switch(time)
 {
 case 1:
   ambient(40);
   break;
 case 2:
   ambient(10);
   directionalLight(200,200,200,-1,0.1f,0.1f);
   break;
 case 3:
   directionalLight(200,200,200,1,0,0);
   pointLight(100,100,100, width/2,height/2, -50);
 }
 
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
