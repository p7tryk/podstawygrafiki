void setup() {
  size(1600, 900, P3D);
  noStroke();
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

float time = 0.f;

void draw()
{
  rotateY(PI/8);
  ambientLight(10,10,10);
  pointLight(255,255,255,width *.5f, height *.5f,50);
  lightSpecular(200,200,0);
  background(0);
  translate(width *.5f, height *.5f);
  pushMatrix();
  rotate(time);
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
  rotateX(PI*10);
  rotate(time*3);
  translate(50.f, 0.f, time*PI);
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
    scale(8.f, 8.f,8.f);
    fill(255,222,179);
    drawSphere(10);
  popMatrix();
  popMatrix();

  
  //ziemia
  pushMatrix();
  rotate(time);
  translate(200.f, 0.f);
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
  pushMatrix();
    scale(6.f, 6.f);
    fill(255,0,0);
    drawSphere(10);
  popMatrix();
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
  rotate(time*3);
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
  translate(430.f, 0.f);
  //pierscienie
  pushMatrix();
    rotateY(PI*time);
    scale(40.f, 40.f);
    fill(255,255,0);
    drawCircle(10);
  popMatrix();
  pushMatrix();
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
  rotate(time*3);
  translate(25.f, 0.f);
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
  rotate(time*0.3f);
  translate(490.f, 0.f,300.f);
  pushMatrix();
    scale(15.f, 15.f);
    fill(0,0,255);
    drawSphere(10);
  popMatrix();
  pushMatrix();
  //uran ksiezyc
  rotate(time*3);
  translate(25.f, 0.f);
  pushMatrix();
    scale(3.f, 3.f);
    fill(240,240,240);
    drawSphere(10);
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
  time += .01f;
}
