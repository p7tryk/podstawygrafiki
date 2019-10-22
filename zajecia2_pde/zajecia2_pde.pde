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

float test = 1.1f;
int time = 1;

void draw() 
{
  time = floor(test);
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
   pointLight(200,200,200, width/4,height/3, 0);
   break;
 case 4:
   spotLight(255,255,255,width/2,height/2, 50, 0,0,-1 , 120, 0.1);
   break;
 case 5:
   pointLight(0,255,0, width/4,height/3, 0);
   spotLight(255,0,0,width/2,height/2, 50, 0,0,-1 , 120, 0.1);
   directionalLight(0,0,255,-1,0.1,-0.1);
   ambientLight(40,40,40);
 break;
 default:
   break;
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
  if(test<5.5f)
    test += 0.01;
  else
    test = 1;
}
