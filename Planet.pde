class Planet {
  float radius;
  float mass;
  //float angle; //angle not used anymore. We got elliptical orbits booyah
  float distance; //diff name perhaps? distance from sun
  PVector vel;
  PVector currVel;
  PVector pos;
  PVector acc;
  //Planet[] planets;
  float orbitSpeed;
  PVector v;
  float obliq;
  float rot;
  float rotation;
  PImage texture;
  float Grav = 0.0002;
  
  PShape globe;
  
  Planet(float r, float m, float d, float incl, float ecc, float obliq, float rot, PImage t) {   
    radius = r;
    mass = m;
    distance = d;
    //orbitSpeed = o;
    this.obliq = obliq;
    this.rotation = rot;
    texture = t;
    
    float vz;
    if (d != 0) vz = sqrt((Grav * 333044) / d);
    else vz = 0;
    vz = vz * (1 + (ecc/2)); 
    
    this.pos = new PVector(d, 0, 0);
    this.vel = new PVector(0, 0, vz);
    this.pos.x = d * cos(radians(incl));
    this.pos.y = (d * sin(radians(incl))) *-1;
    float hyp = vz / cos(radians(incl));
    this.vel.y = sin(radians(incl)) * hyp;
    this.vel.setMag(vz*-1);
    
    this.currVel = new PVector(this.vel.x, this.vel.y, this.vel.z);
    
    fill(255);
    noStroke();
    globe = createShape(SPHERE, r);
    globe.setTexture(t);
  }
  
  void orbit() {
    //angle = angle - orbitSpeed;
      stroke(0);
      set(5,5,5);
      //point(v.x, v.y, v.z);
  }
  
  void updateVel() {
    this.pos.add(this.currVel);
  }
  
  void gravPull(Planet planet1, ArrayList<Planet> lstPlanets) {
    for(Planet planet2 : lstPlanets) {
      if(planet1 == planet2) continue;
      PVector forceDir = PVector.sub(planet2.pos, planet1.pos);
      float dir = forceDir.magSq();
      forceDir.normalize();
      PVector f = forceDir.mult(Grav * planet2.mass / dir);
      currVel = planet1.vel.add(f);
    }
  }

  void show() {
    pushMatrix();
    noStroke();
    fill(255);
    //this.orbit();
    this.updateVel();
    lightSpecular(0,0,0);
    //pointLight(70,70,60, this.pos.x, this.pos.y, this.pos.z);
    //this.gravPull();
    //rotate(angle);
    translate(pos.x, pos.y, pos.z);
    if (rotation != 0) {
      if(rotation > 360) rot = 0;
      rot = rot + (0.1 / rotation);
      rotateX(radians(obliq));
      rotateY(radians(rot));
    }
    shape(globe);
    popMatrix();
  }
}
