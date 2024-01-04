class planet {
  
  float radius; // radius of sphere - size of planet
  //angle variable need to exist for rotate function to be used. angle needs to be specified in radians i.e. [0, 2pi] 
  float distance;     // distance factor
  float speed;  // increment used to increase / decrease angle - orbital velocity
  float angle;
  PVector v; // 3d positional vector
  float offset; //offcenter added value - to accomodate for the distance the 3d sphere object covers
  
  planet[] planets;
  
  planet(float r, float d, float s, float o){
    v = new PVector(100, 0, 0);                                          // increase to 1000 for more realism
    //v = PVector.random3D(); // randomly directed vector
    radius = r;
    angle = random(TWO_PI);
    distance = d;
    speed = s;
    //v.mult(distance);    // unit vector can be regarded as length = 1, multiplying by distance simulates the actual distance between objects
    v.set(v.x * distance + o, v.y * distance, v.z * distance);
  }
  
  planet(float r, float d, float s, float o,float x, float y, float z){
    v = new PVector(x, y, z);
    //v = PVector.random3D(); // randomly directed vector
    radius = r;
    angle = random(TWO_PI);
    distance = d;
    speed = s;
    //v.mult(distance);    // unit vector can be regarded as length = 1, multiplying by distance simulates the actual distance between objects
    v.set(v.x * d + o, v.y, v.z);
  }
  
  void orbit(){
    angle = angle + speed;
      
    if (planets != null){
      for (int i = 0; i < planets.length; i++){
        planets[i].orbit();
      }
    }
    
  }
  
  void genMoons(int number ){//int level) {
    planets = new planet[number];
    for (int i = 0; i < planets.length; i++){
      float r = radius/2; //radius/(level*2); // every recursion of moons' sizes reduced from original i.e. 1/2, 1/4, 1/6 ... 
      float d = random(radius + r, (radius + r)*3);      // distance is at least such distance that the 2 objects dont overlap
      float s = random(-0.01, 0.01);    // forward and backward rotation
      float o = 0;
      planets[i] = new planet(r, d, s, o);
      // for below specified level of recursion, each "moon" will generate its own "num" number of moons.
      //if (level < 2){
      //  int num = 2; //int(random(0,4));
      //  planets[i].genMoons(num, level+1);
      //}
      
    }
  
  }

  void genMoon(){
    planets = new planet[1];
      float r = 1.7;
      float d = 0.0025;
      float s = -0.078;    // 0.006 earth orbital speed * 13
      float o = 6.4 + 1.7;
      planets[0] = new planet(r, d, s, o, 1, -2, 0);
    
  }
  
  public float getRadius(){ return radius; }
  public float getDistance(){ return distance; }
  public float getSpeed(){ return speed; }
  void getPos(){ println("v.x = " + v.x + ", v.y = " + v.y + " , v.z = " + v.z) ; }
  
  void setRadius(int index, float r){
    planets[index].radius = r;
  }
  void setAngle(int index, float a){
    planets[index].angle = a;
  }
  void setDistance(int index, float d){
    planets[index].distance = d;
  }
  void setSpeed(int index, float s){
    planets[index].speed = s;
  }
  void setPos(int index, float x, float y, float z){
    planets[index].v.x = x;
    planets[index].v.y = y;
    planets[index].v.z = z;
  }
  void setAllZ(float z){
    for(int i = 0; i < planets.length; i++){
      planets[i].v.z = z;
    }
  }
  void setAllY(float y){
    for(int i = 0; i < planets.length; i++){
      planets[i].v.y = y;
    }
  }
  void setAllX(float x){
    for(int i = 0; i < planets.length; i++){
      planets[i].v.x = x;
    }
  }

  
  void show() {
    
    pushMatrix();
      noStroke();
      fill(255);
    
      PVector v2 = new PVector(0,0,1);  // (1, 0, 1)
      PVector p = v.cross(v2);
      
      rotate(angle, p.x, p.y, p.z);
      stroke(255);
      ///noFill();
      ///circle(0, 0, distance * 100 * 2 + radius + 100);
      line(0, 0, 0, v.x, v.y, v.z);
      
      //line(0, 0, 0, p.x, p.y, p.z);
      //translate(distance, 0);
      ///fill(255);
      
      translate(v.x,v.y,v.z);
      noStroke();
      sphere(radius);
        //ellipse(0, 0, radius*2, radius*2);
    
      fill(255);
    
      if (planets != null) {
        for (int i = 0; i < planets.length; i++){
        planets[i].show();
        }
      }
    popMatrix();
  }
  
  void path(float a){
    
   pushMatrix();
   
     //PVector v2 = new PVector(0,0,1);
     //PVector p = v.cross(v2);
     
     stroke(255);
     noFill();
     rotate(a, v.x, v.y, v.z);
     //rotate(PI/2, v.x, v.y, v.z);
     //rotateY(PI/2);
     ellipse(0,0, v.x*2, v.x*2);
    
  popMatrix();  
  }
  
  void path2(float a, float r){
    
   pushMatrix();
   
     //PVector v2 = new PVector(0,0,1);
     //PVector p = v.cross(v2);
     
     stroke(255);
     noFill();
     rotate(a, v.x, v.y, v.z);
     //rotate(PI/2, v.x, v.y, v.z);
     //rotateY(PI/2);
     ellipse(0,0, r*2, r*2);
    
  popMatrix();  
  }
}
