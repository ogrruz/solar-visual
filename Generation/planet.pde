class planet {
  
  float radius; // radius of sphere - size of planet
  //angle variable need to exist for rotate function to be used. angle needs to be specified in radians i.e. [0, 2pi] 
  float angle;
  float distance;     // distance factor
  float rotationSpeed;  // increment used to increase / decrease angle
  PVector v; // 3d positional vector
  
  planet[] planets;
  
  planet(float r, float d, float s){
    v = PVector.random3D(); // randomly directed vector
    radius = r;
    angle = random(TWO_PI);
    distance = d;
    rotationSpeed = s;
    // unit vector can be regarded as length = 1, multiplying by distance simulates the actual distance between objects
    v.mult(distance);    
    
  }
  
  void orbit(){
    angle = angle + rotationSpeed;
      
    if (planets != null){
      for (int i = 0; i < planets.length; i++){
        planets[i].orbit();
      }
    }
    
  }
  
  void genMoons(int number, int level) {
    planets = new planet[number];
    for (int i = 0; i < planets.length; i++){
      float r = radius/(level*2); // every recursion of moons' sizes reduced from original i.e. 1/2, 1/4, 1/6 ... 
      float d = random(radius + r, (radius + r)*2);
      float o = random(-0.01, 0.01);    // forward and backward rotation
      planets[i] = new planet(r, d, o);
      // for below specified level of recursion, each "moon" will generate its own "num" number of moons.
      if (level < 1){
        int num = 1; 
        planets[i].genMoons(num, level+1);
      }
      
    }
  }
  
  void show() {
    
    pushMatrix();
    noStroke();
    fill(255);
    
    PVector v2 = new PVector(1,0,1);
    PVector p = v.cross(v2);
    
    rotate(angle, p.x, p.y, p.z);
    stroke(255);
    line(0, 0, 0, v.x, v.y, v.z);
    //line(0, 0, 0, p.x, p.y, p.z);
    translate(v.x,v.y,v.z);
    noStroke();
    sphere(radius);
    
    fill(255);
    
    if (planets != null) {
      for (int i = 0; i < planets.length; i++){
      planets[i].show();
      }
    }
    popMatrix();
  }
  
}
