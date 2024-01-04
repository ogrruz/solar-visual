import peasy.*;
import controlP5.*;

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

PImage sunTexture;
PImage mercuryTexture;
PImage venusTexture;
PImage earthTexture;
PImage marsTexture;
PImage jupiterTexture;
PImage saturnTexture;
PImage uranusTexture;
PImage neptuneTexture;
PImage plutoTexture;
PImage moonTexture;
PImage background;

PeasyCam camera;
ControlP5 gui;

void setup() {
  
  size(1000, 1000, P3D);
  
  //GUI 
  gui = new ControlP5(this);
  //gui.addButton("Show/Hide Names").setValue(0).setPosition(-500,-500).setSize(100,50);
  //Button b1 = gui.addButton("Show/Hide Names").setPosition(-100,-500).setSize(200,19).setValue(0);
  
  //Textures
  sunTexture = loadImage("sun.jpg");
  mercuryTexture = loadImage("mercury.jpg");
  venusTexture = loadImage("venus.jpg");
  earthTexture = loadImage("earth.jpg");
  marsTexture = loadImage("mars.jpg");
  jupiterTexture = loadImage("jupiter.jpg");
  saturnTexture = loadImage("saturn.jpg");
  uranusTexture = loadImage("uranus.jpg");
  neptuneTexture = loadImage("neptune.jpg");
  plutoTexture = loadImage("pluto.jpg");
  moonTexture = loadImage("moon.jpg");
  
  background = loadImage("space2.jpg");
  background.resize(1000,1000);
  
  // Peasycam settings
  //makes sure objects do not dissapear when zooming out - near and far clipping planes
  perspective(PI/3.0,(float)width/height,1,100000);
  camera = new PeasyCam(this, 0, 0, 0, 500);
  camera.setSuppressRollRotationMode();
  
  //Planets Contrucition
  
  //Sun
  sun = new planet("Sun", 100, 0, 0, 0, sunTexture);
  //Mecury
  mercury = new planet (" Mercury", 2.4, 0.39, -0.01, sun.getRadius() + 2.4, mercuryTexture);
  //Venus
  venus = new planet ("Venus", 6.1, 0.72, -0.007, sun.getRadius() + 6.1, venusTexture);
  //Earth
  earth = new planet ("Earth", 6.4, 1, -0.006, sun.getRadius() + 6.4, earthTexture);
  //Mars
  mars = new planet ("Mars", 3.4, 1.52, -0.005, sun.getRadius() + 3.4, marsTexture);
  //Jupiter
  jupiter = new planet ("Jupiter", 71.5, 5.2, -0.003, sun.getRadius() + 71.5, jupiterTexture);
  //Saturn
  saturn = new planet ("Saturn", 60.3, 9.54, -0.002, sun.getRadius() + 60.3, saturnTexture);
  //Uranus 
  uranus = new planet ("Uranus", 25.6, 19.2, -0.001, sun.getRadius() + 25.6, uranusTexture);
  //Neptune
  neptune = new planet ("Neptune", 24.8, 30.06, -0.001, sun.getRadius() + 24.8, neptuneTexture);
  //Pluto
  pluto = new planet("Pluto", 1.2, 37.8, -0.001, 1.2 + sun.getRadius(), 100, 1150, 0, plutoTexture);
  
  
  earth.genMoon(1, moonTexture);
  
  //camera.lookAt(pluto.getX(), pluto.getY(),pluto.getZ());
}

void lighting() {
 
  pointLight(255, 255, 255, 0, 0, 0);
  lightFalloff(0, 0, 0.00001);
  ambientLight(55, 55, 55);
  
}

void draw() {
  //background(background);
  background(0);
  
  sun.show();
  sun.orbit();
  
  lighting();
  
  
  
  mercury.path();
  mercury.show();
  mercury.orbit();
  
  venus.path();
  venus.show();
  venus.orbit();
  
  earth.path();
  earth.show();
  earth.orbit();
  
  mars.path();
  mars.show();
  mars.orbit();
  
  jupiter.path();
  jupiter.show();
  jupiter.orbit();
  
  saturn.path();
  saturn.show();
  saturn.orbit();
  
  uranus.path();
  uranus.show();
  uranus.orbit();
  
  neptune.path();
  neptune.show();
  neptune.orbit();
  
  pluto.path2();
  pluto.show();
  pluto.orbit();
  pluto.showDistance();
  
  //camera.lookAt(2045.6001, 0, 0);
  
  //camera.lookAt(pluto.getX(), pluto.getY(),pluto.getZ(), 500);
  pluto.getPos();


}
