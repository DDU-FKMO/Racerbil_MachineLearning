int generationCycle = 30;
int lastReset = 0;

GeneticAlgorithm algorithm;
Generation currentGeneration;

void setup() {
  size(750, 750);
  algorithm = new GeneticAlgorithm();
  algorithm.addGeneration();
  lastReset = millis();
  currentGeneration = algorithm.generations.get(algorithm.generations.size() - 1);
}

void draw() {
  //New generation
  if(millis() >= lastReset + generationCycle * 1000) {
    algorithm.addGeneration();
    lastReset = millis();
    currentGeneration = algorithm.generations.get(algorithm.generations.size() - 1);
  }
  
  //Update current generation
  for(Car car :  currentGeneration.cars) {
    car.update();
  }
}
