int generationCycle = 20 * 30;
int lastReset = 0;

GeneticAlgorithm algorithm;
Generation currentGeneration;
PImage trackImage;
int bestValue = 0;
int bestGeneration = 0;

void setup() {
  size(1000, 1000);
  algorithm = new GeneticAlgorithm();
  algorithm.addGeneration();
  lastReset = frameCount;
  currentGeneration = algorithm.generations.get(algorithm.generations.size() - 1);
  trackImage = loadImage("track03.png");
  frameRate(30);
}

void mousePressed() {
  frameRate(500);
}
void mouseReleased() {
  frameRate(30);
}

void draw() {
  //New generation
  if(frameCount >= lastReset + generationCycle) {
    algorithm.addGeneration();
    lastReset = frameCount;
    trackImage = loadImage("track0"+ int(random(1,4)) + ".png");
    currentGeneration = algorithm.generations.get(algorithm.generations.size() - 1);
  }
  
  if(mousePressed) {
    background(trackImage);
    //Update cars
    for(Car car :  currentGeneration.cars) {
      car.update();
    }
  } else {
    background(trackImage);
         
    //Update current generation
    for(Car car :  currentGeneration.cars) {
      car.update();
    }
    for(Car car :  currentGeneration.cars) {
      car.displayCar();
    }
  }
  
  //Text:
  fill(150);
  textSize(25);
  text("Generation " + algorithm.generations.size(), width - 250, 50);
  text("Best value (ever): " + bestValue, width - 250, 75);
  text("Best generation: " + bestGeneration, width - 250, 100);
}
