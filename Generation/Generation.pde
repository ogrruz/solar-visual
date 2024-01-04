
planet sun;


void setup() {
  //Initialise window and 3D module
  size(600,600, P3D);
  sun = new planet(50, 0, 0);
  sun.genMoons(3, 1);
}

void draw() {
  background(0);
  //By default objects are drawn at (0,0,0)
  //Translate to the centre of the window.
  translate(width/2, height/2);
  lights();
  sun.show();
  sun.orbit();
}
