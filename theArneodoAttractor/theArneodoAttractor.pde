import peasy.*;
PeasyCam cam;

float x = 1;
float y = 1;
float z = 1;

float a = -5.5;
float b = 3.5;
float c = -1;


float dx, dy, dz;
float dt = 0.01;

ArrayList<PVector> points = new ArrayList<PVector>();

void setup() {
  size(400, 400, P3D);
  colorMode(HSB);
  cam = new PeasyCam(this, 1000);
  cam.setMinimumDistance(-1000);
  cam.setMaximumDistance(3000);
  frameRate(30);
  
  
}

void draw() {
  background(0);
  scale(100);
  dx=(y)*dt;
  dy=(z)*dt;
  dz=(-(a*x)-(b*y)-z+(c*x*x*x))*dt;

  x = x + dx;
  y = y + dy;
  z = z + dz;
  points.add(new PVector(x, y, z));


  float myColor=0;
  beginShape();
  for (PVector v : points) {

    stroke(myColor, 255, 255);
    strokeWeight(3);
    point(v.x, v.y, v.z);
    //    PVector offset = PVector.random3D();
    //    offset.mult(0.001);
    //    v.add(offset);
    myColor += 0.1;
    if (myColor > 255) {
      myColor = 0;
    }
  }
  endShape();
}


