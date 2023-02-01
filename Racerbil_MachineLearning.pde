int generationCycle = 30;
int lastReset = 0;

GeneticAlgorithm algorithm;
Generation currentGeneration;

void setup() {
  size(750, 750);
  algorithm = new GeneticAlgorithm();
  algorithm.addGeneration();
  lastReset = millis();
  currentGeneration = algorithm.generations.last();
}

void draw() {
  //New generation
  if(millis() >= lastReset + generationCycle * 1000) {
    algorithm.addGeneration();
    lastReset = millis();
    currentGeneration = algorithm.generations.last();
  }
  
  //Update current generation
  for(Car car :  currentGeneration.cars) {
    car.update();
  }
}
