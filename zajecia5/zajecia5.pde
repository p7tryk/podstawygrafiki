PShape s;

void setup() 
{
  size(1200, 800, P3D);
  noStroke();
  s = loadShape("capsule.obj");
}
void drawCapsule()
{
  shape(s,0,0);
  rotateY(time*PI);
}

void drawSphere(int steps)
{
   sphereDetail(steps);
   sphere(1);
  
}
void drawCircle(int steps)
{
  steps = 20; //temp
  beginShape();
  for (int i = 0; i < steps; ++i)
    vertex(cos(TWO_PI * (float)i / float(steps)), sin(TWO_PI * (float)i / float(steps)));
  endShape();
}
void drawBox(int x, int y, int z)
{
  box(x,y,z);
}

void drawShip()
{
  translate(cameraX+width/2,cameraY+height/2,cameraZ+50);
  fill(255,255,255);
  box(1000);
}


//previous mouse for scrolling
int previousX=0;
int previousY=0;
//global animation time and speed
float time = 0.f;
float timeStep = 0;

//camera positions and velocity
float cameraX,cameraY,cameraZ = 0;
float camVelX,camVelY, camVelZ = 0;
//camera rotation and rotation velocity
float camRotX, camRotY, camRotZ = 0;
float camRotVelX, camRotVelY, camRotVelZ =0;

//settings
float mouseSpeed = 20;



void draw()
{
 ambientLight(20,20,20);
//for clarity with camera
float EYEX = width/2.0;
float EYEY = height/2.0;
float EYEZ = ((height/2.0) / tan(PI*30.0 / 180.0));
   
 //CAMERA
   
  cameraX+=camVelX;
  cameraY+=camVelY;
  cameraZ+=camVelZ;
  println(cameraX + " " + cameraY + " " + cameraZ);
  
  camRotX+=camRotVelX;
  camRotY+=camRotVelY;
  camRotZ+=camRotVelZ;

  camera(EYEX+cameraX+camRotX, EYEY+cameraY+camRotY, EYEZ+cameraZ+camRotZ, EYEX+cameraX, EYEY+cameraY, 0+cameraZ, 0, 1, 0);
  
  //ENDCAMERA
  pushMatrix();
  drawShip();
  popMatrix();
  
  
  //SOLAR SYSTEM
  rotateY(PI/8);
 
  pointLight(255,255,255,width *.5f, height *.5f,0);
  lightSpecular(200,200,0);
  background(0);
  translate(width *.5f, height *.5f);
  pushMatrix();
  rotate(time);
  rotateX(time*2);
  //slonce
  translate(0.f, 0.f);
  pushMatrix();
    scale(40.f, 40.f,40.f);
    fill(255,255,0);
    emissive(255,255,0);
    drawBox(1,1,1);
  popMatrix();
  popMatrix();
  emissive(0,0,0);
    
  //merkury
  pushMatrix();
  rotateY(PI*time*0.7);
  translate(0.f, 0.f, 70.);
  pushMatrix();
    scale(7.f,7.f,7.f);
    fill(200,200,200);
    drawSphere(10);
  popMatrix();
  popMatrix();


   //wenus
  pushMatrix();
  rotate(time*2);
  translate(100.f, 0.f);
  pushMatrix();
    specular(220,10,200);
    shininess(30.0);
    scale(8.f, 8.f,8.f);
    fill(255,222,179);
    drawCapsule();
  popMatrix();
  popMatrix();

  
  //ziemia
  pushMatrix();
  rotateX(time);
  translate(20.f, 200.f);
  pushMatrix();
    scale(10.f, 10.f,10.f);
    fill(0,255,0);
    drawSphere(10);
  popMatrix();
  //ksiezyc
  rotate(time*3);
  translate(20.f, 0.f);
  pushMatrix();
    scale(3.f, 3.f,3.f);
    fill(240,240,240);
    drawSphere(10);
  popMatrix();
  popMatrix();
  //endziemia
  

  //mars
  pushMatrix();
  rotate(time*0.7f);
  translate(300.f, 0.f);
  float lx = modelX(0,0,0);
  float ly = modelY(0,0,0);
  float lz = modelZ(0,0,0);
  pushMatrix();
    scale(6.f, 6.f);
    fill(255,0,0);
    drawSphere(10);
  popMatrix();
  pointLight(255,40,40,lx,ly,lz);
  popMatrix();
  
  
  //jowisz
  pushMatrix(); //system
  rotate(time*0.5f);
  translate(350.f, 0.f);
  pushMatrix();
    scale(20.f, 20.f,20f);
    fill(255,222,179);
    drawSphere(10);
  popMatrix();
  pushMatrix();
  //ksiezyc
  rotateX(-time*3);
  translate(25.f, 0.f);
  pushMatrix();
    scale(3.f, 3.f, 3.f);
    fill(240,240,240);
    drawSphere(10);
  popMatrix();
  popMatrix();
  //ksiezyc2
  rotate(time*2);
  translate(30.f, 0.f);
  pushMatrix();
    scale(3.f, 3.f, 3.f);
    fill(240,240,240);
    drawSphere(10);
  popMatrix();
  
  
  popMatrix();
  //endjowisz
  
  
  //saturn
  pushMatrix(); //system
  rotate(time*-0.4f);
  translate(430.f, 430.f);
  //pierscienie
  pushMatrix();
    rotateY(PI*time);
    scale(40.f, 40.f);
    fill(255,255,0);
    drawCircle(10);
  popMatrix();
  pushMatrix();
  rotateY(PI*time);
    scale(30.f, 30.f);
    fill(0,0,0);
    drawCircle(10);
  popMatrix();
  pushMatrix();
    scale(15.f, 15.f,15.f);
    fill(255,222,179);
    drawSphere(10);
  popMatrix();
  //endpierscienie
  pushMatrix();
  //saturnksiezyc
  rotateY(time*3);
  translate(25.f, 0.f, 50.f);
  pushMatrix();
    scale(3.f, 3.f);
    fill(240,240,240);
    drawSphere(10);
  popMatrix();
  popMatrix();
  //saturnksiezyc2
  rotate(time*2);
  translate(30.f, 0.f);
  pushMatrix();
    scale(3.f, 3.f);
    fill(240,240,240);
    drawSphere(10);
  popMatrix();
  popMatrix();
  //endsaturn
  
  
  //uran
  pushMatrix(); //system
  lightSpecular(200,200,200);
  shininess(20);
  rotate(time*0.3f);
  translate(490.f, 0.f,0.f);
  pushMatrix();
    scale(15.f, 15.f);
    fill(0,0,255);
    drawSphere(10);
  popMatrix();
  pushMatrix();
  //uran ksiezyc
  rotateY(time*3);
  translate(10.f, 0.f, 25.f);
  pushMatrix();
    scale(3.f, 3.f);
    fill(240,240,240);
    drawSphere(10);
    spotLight(255,255,255,0,0,15,-1,0,0,120,10);
  popMatrix();
  popMatrix();
  //ksiezyc2
  rotate(time*2);
  translate(30.f, 0.f);
  pushMatrix();
    scale(3.f, 3.f);
    fill(240,240,240);
    drawSphere(10);
  popMatrix();
  popMatrix();
  //enduran
  
  rotateY(PI*time);  
  time += timeStep;
  //END SOLAR SYSTEM
  


  

}



void keyPressed()
{
  if (key != CODED && keyCode == 'A' || key == CODED && keyCode == LEFT)
    camRotVelX= -6;
  else if (key != CODED && keyCode == 'D' || key == CODED && keyCode == RIGHT)
    camRotVelX = 6;
    
  if (key != CODED && keyCode == 'W' || key == CODED && keyCode == UP)
    camVelY=-6;
  else if (key != CODED && keyCode == 'S' || key == CODED && keyCode == DOWN)
    camVelY =6;
    
}

void keyReleased()
{
  if (key != CODED && keyCode == 'A' || key == CODED && keyCode == LEFT)
    camRotVelX=0;
  if (key != CODED && keyCode == 'D' || key == CODED && keyCode == RIGHT)
    camRotVelX=0;
  if (key != CODED && keyCode == 'W' || key == CODED && keyCode == UP)
    camVelY=0;
  if (key != CODED && keyCode == 'S' || key == CODED && keyCode == DOWN)
    camVelY=0;
}

void mousePressed()
{

  if(mouseButton == RIGHT)
  {
  }
   else
   {
     previousX=mouseX;
     previousY=mouseY;
   }
}

void mouseDragged()
{
  if(mouseButton==RIGHT)
    return;
  cameraX+= (mouseX-previousX) /mouseSpeed;
  cameraY+= (mouseY-previousY) /mouseSpeed;
}
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  cameraZ += e*50;
}
