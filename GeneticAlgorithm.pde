class GeneticAlgorithm {
  int populationSize = 100;
  double topCars = 10;
  public ArrayList<Generation> generations;
  
  void addGeneration() {
    if(generations.size() == 0) {
      generations.add(new Generation(populationSize));
    } else {
      generations.add(new Generation(generations.last()));
    }
  }
  
}
