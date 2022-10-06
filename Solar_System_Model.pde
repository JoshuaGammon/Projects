import peasy.*;

ArrayList<Planet> lstPlanets;

//Planet Globals
Planet sun;
Planet mercury;
Planet venus;
Planet earth;
Planet mars;
Planet jupiter;
Planet saturn;
Planet uranus;
Planet neptune;

PeasyCam cam;

//Image Globals
PImage bg;
PImage sunImg;      //planetpixelemporium.com
PImage mercuryImg;
PImage venusImg;
PImage earthImg;
PImage marsImg;
PImage jupiterImg;
PImage saturnImg;
PImage uranusImg;
PImage neptuneImg;

void setup() {
  //fullScreen(P3D); //crashes. peasycam might need adjustments
  size(800, 800, P3D); //temporary size
  frameRate(200);
 
  //Loading Images
  bg = loadImage("star-background.jpeg");
  sunImg = loadImage("sun.jpg");  
  mercuryImg = loadImage("mercury.jpg");
  venusImg = loadImage("venus.jpg");
  earthImg = loadImage("earth.jpg");
  marsImg = loadImage("mars.jpg");
  jupiterImg = loadImage("jupiter.jpg");
  saturnImg = loadImage("saturn.jpg");
  uranusImg = loadImage("uranus.jpg");
  neptuneImg = loadImage("neptune.jpg");
  
  cam = new PeasyCam(this, 600);
  
  lstPlanets = new ArrayList<Planet>();
  
  //Guide: Planet(float r, float m, float d, float incl, float ecc, float obliq, float rot, PImage t) {
  lstPlanets.add(sun = new Planet(50, 333044, 0, 0, 0, 0, 0, sunImg)); //1091.811 //initiating the sun -- size will have to be adjusted
  lstPlanets.add(mercury = new Planet(3.825, 0.055, 72, 7.0, 0.206, 0.034, 4222.6, mercuryImg));
  lstPlanets.add(venus = new Planet(9.489, 0.8149, 134.4, 3.4, 0.007, 177.4, 2802.0, venusImg)); //rot need to be neg?
  lstPlanets.add(earth = new Planet(10, 1, 186, 0, 0.017, 23.4, 24, earthImg));
  lstPlanets.add(mars = new Planet(5.326, 0.1069, 283, 1.8, 0.094, 25.2, 24.6, marsImg));
  lstPlanets.add(jupiter = new Planet(112.094, 316.933, 967.4, 1.3, 0.049, 3.1, 9.9, jupiterImg));
  lstPlanets.add(saturn = new Planet(94.495, 95.137, 1779.6, 2.5, 0.052, 26.7, 10.7, saturnImg));
  lstPlanets.add(uranus = new Planet(40.074, 14.544, 3563, 0.8, 0.047, 97.8, 17.2, uranusImg)); //rot need to be neg?
  lstPlanets.add(neptune = new Planet(38.828, 17.173, 5611, 1.8, 0.01, 28.3, 16.1, neptuneImg));
  //hard coded values from https://nssdc.gsfc.nasa.gov/planetary/factsheet/planet_table_british.html
  //can we make these more interactive?
}

void draw() {
  background(bg);
  lights();
  //spotLight(255, 255, 255, 0, 0, 0, 0, 0, 0);    //not done correctly. spotlight is not glow
  pointLight(255, 255, 255, 0, 0, 0);
  for(Planet planet1 : lstPlanets) {
    planet1.gravPull(planet1, lstPlanets);
  }
  for(Planet planet : lstPlanets) {
    planet.show();
  }
}
