int generationCycle = 25;
int lastReset = 0;

GeneticAlgorithm algorithm;
Generation currentGeneration;
PImage trackImage;

void setup() {
  size(1000, 1000);
  algorithm = new GeneticAlgorithm();
  algorithm.addGeneration();
  lastReset = millis();
  currentGeneration = algorithm.generations.get(algorithm.generations.size() - 1);
  trackImage = loadImage("track04.png");
}

void draw() {
  clear();
  background(255);
  image(trackImage,0,0,width,height);
  //New generation
  if(millis() >= lastReset + generationCycle * 1000) {
    algorithm.addGeneration();
    lastReset = millis();
    trackImage = loadImage("track0"+ int(random(1,6)) + ".png");
    currentGeneration = algorithm.generations.get(algorithm.generations.size() - 1);
  }
  
  //Update current generation
  for(Car car :  currentGeneration.cars) {
    car.update();
  }
}
