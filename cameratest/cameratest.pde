void setup()
{
 size(500, 500, P3D); 
}
float time = 0.0f;

void draw()
{
noFill();
background(204);
camera(70.0, 35.0, 120.0, 50.0, 50.0, 0.0, 
       0.0, 1.0, 0.0);
translate(50, 50, 0);
rotateX(-PI/6*time);
rotateY(PI/3);
box(45);
time+=0.1f;
}
