import peasy.*;

planet sun;
planet mercury;
planet venus;
planet earth;
planet mars;
planet jupiter;
planet saturn;
planet uranus;
planet neptune;
planet pluto;

PeasyCam camera;

void setup() {
  
  size(1000, 1000, P3D);
  
  //makes sure objects do not dissaper when zooming out - near and far clipping planes
  perspective(PI/3.0,(float)width/height,1,100000);
  camera = new PeasyCam(this, 0, 0, 0, 500);
  camera.setSuppressRollRotationMode();
  
  //Sun
  sun = new planet(100, 0, 0, 0);
  //Mecury
  mercury = new planet (2.4, 0.39, -0.01, sun.getRadius() + 2.4);
  //Venus
  venus = new planet (6.1, 0.72, -0.007, sun.getRadius() + 6.1);
  //Earth
  earth = new planet (6.4, 1, -0.006, sun.getRadius() + 6.4);
  //Mars
  mars = new planet (3.4, 1.52, -0.005, sun.getRadius() + 3.4);
  //Jupiter
  jupiter = new planet (71.5, 5.2, -0.003, sun.getRadius() + 71.5);
  //Saturn
  saturn = new planet (60.3, 9.54, -0.002, sun.getRadius() + 60.3);
  //Uranus 
  uranus = new planet (25.6, 19.2, -0.001, sun.getRadius() + 25.6);
  //Neptune
  neptune = new planet (24.8, 30.06, -0.001, sun.getRadius() + 24.8);
  //Pluto
  pluto = new planet(1.2, 37.8, -0.001, 1.2 + sun.getRadius(), 100, 1150, 0);
  
  
  earth.genMoon();
  
  uranus.getPos();
  //sun.planets[0].genMoons(2);
  //sun.setAllZ(0);
  //sun.setRadius(1, 50);
  //sun.setPos(1, 400, 200, 50);
  //sun.setPos(0, 300, 200, 50);
  //sun.setAngle(1, PI);
  //sun.setAngle(0, PI);
}

void draw() {
  background(0);
  lights();
  
  sun.show();
  sun.orbit();
  
  mercury.show();
  mercury.orbit();
  
  venus.show();
  venus.orbit();
  
  earth.show();
  earth.orbit();
  
  mars.show();
  mars.orbit();
  
  jupiter.show();
  jupiter.orbit();
  
  saturn.show();
  saturn.orbit();
  
  uranus.show();
  uranus.orbit();
  
  neptune.show();
  neptune.orbit();
  
  pluto.show();
  pluto.orbit();
  

}
