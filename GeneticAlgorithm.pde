class GeneticAlgorithm {
  int populationSize = 200;
  int topCars = 2;
  public ArrayList<Generation> generations = new ArrayList<Generation>();
  
  void addGeneration() {
    println("New generation");
    if(generations.size() == 0) {
      generations.add(new Generation(populationSize));
    } else {
      generations.add(new Generation(generations.get(algorithm.generations.size() - 1), topCars));
    }
  }
  
}
