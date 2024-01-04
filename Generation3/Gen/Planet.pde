class planet {
  
  float radius; // radius of sphere - size of planet
  //angle variable need to exist for rotate function to be used. angle needs to be specified in radians i.e. [0, 2pi] 
  float distance;     // distance factor
  float speed;  // increment used to increase / decrease angle - orbital velocity
  float angle;
  PVector v; // 3d positional vector
  float offset; //offcenter added value - to accomodate for the distance the 3d sphere object covers
  
  String Pname;
  PShape globe;
  
  boolean showDistance = false;
  boolean showPath = true;
  boolean showName;
  
  planet[] planets;
  
  planet(String name, float r, float d, float s, float o, PImage texture){
    v = new PVector(100, 0, 0);        // increase to 1000 for more realism
    radius = r;
    angle = random(TWO_PI);
    distance = d;
    speed = s;
    Pname = name;
    v.set(v.x * distance + o, v.y * distance, v.z * distance);
    
    noStroke();
    noFill();
    globe = createShape(SPHERE, radius);
    globe.setTexture(texture);
  }
  
  
  planet(String name, float r, float d, float s, float o,float x, float y, float z, PImage texture){
    v = new PVector(x, y, z);
    //v = PVector.random3D(); // randomly directed vector
    radius = r;
    angle = random(TWO_PI);
    distance = d;
    speed = s;
    Pname = name;
    v.set(v.x * d + o, v.y, v.z);
    
    noStroke();
    noFill();
    globe = createShape(SPHERE, radius);
    globe.setTexture(texture);
  }
  
  void orbit(){
    angle = angle + speed;
      
    if (planets != null){
      for (int i = 0; i < planets.length; i++){
        planets[i].orbit();
      }
    }
    
  }
  
  void genMoon(int number, PImage texture){//int level) {
    planets = new planet[number];
    for (int i = 0; i < planets.length; i++){
      float r = 1.7;
      float d = 0.0025;
      float s = -0.078;    // -0.006 earth orbital speed * 13
      float o = 6.4 + 1.7;
      planets[i] = new planet(" ", r, d, s, o, 1, -2, 0, texture);
      // for below specified level of recursion, each "moon" will generate its own "num" number of moons.
      //if (level < 2){
      //  int num = 2; //int(random(0,4));
      //  planets[i].genMoons(num, level+1);
      //}
       
    }
  }
  
  
  public float getX(){return v.x;}
  public float getY(){return v.y;}
  public float getZ(){return v.z;}
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
      //rotate(angle, 1, 0, 0); //sphere's own rotation around itself
      stroke(255);
      
      if(showDistance == true){
      line(0, 0, 0, v.x, v.y, v.z);    // - line from centre to centre of planets
      }
      
      text(Pname, v.x - 30, v.y + radius + 20, v.z);
      
      //line(0, 0, 0, p.x, p.y, p.z);    //-  line showing the vector product line
      
      fill(255);
      translate(v.x,v.y,v.z);
      noStroke();
      shape(globe);
      
      fill(255);
    
      if (planets != null) {
        for (int i = 0; i < planets.length; i++){
        planets[i].show();
        }
      }
    popMatrix();
  }
  
  void path(){
    
   pushMatrix();
     
     stroke(255);
     noFill();
     rotate(PI/2, v.x, v.y, v.z);
     ellipse(0,0, v.x*2, v.x*2);
    
  popMatrix();  
  }
  
  void path2(){
    
   pushMatrix();
   
     stroke(255);
     noFill();
     //rotate(a, v.x, v.y, v.z);
     rotate(PI/2, v.x, v.y, v.z);
     ellipse(0,0, v.x * 2 + 350, v.x * 2 + 350);
    
  popMatrix();  
  }
   
  void hideName(){
    
    String savedName = Pname;
    String hidden = " ";
    
    if(showName == true){     
      showName = false;
      Pname = hidden;
    }
    else {
      showName = true;
      Pname = savedName;
    }
    
  }
  
  void showDistance(){
    
   if(showDistance == false){showDistance = true;} 
   else{showDistance = true;}
    
  }
  
}
