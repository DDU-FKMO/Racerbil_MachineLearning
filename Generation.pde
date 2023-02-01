class Generation {
  ArrayList<Car> cars;
  
  Generation(int populationSize) {
    for(int i = 0; i < populationSize; i++) {
       //Create new car
       cars.add(new Car());
    }
  }
  
  Generation(Generation lastGeneration, int top) {
    ArrayList<Car> oldCars = lastGeneration.cars.sort(new CarComparator());
    for(int i = 0; i < lastGeneration.cars.size(); i++) {
        Car car1 = oldCars.get(random(top));
        Car car2 = oldCars.get(random(top));
        //Combine cars
        
        //Create new car
        cars.add(new Car());
    }
  }
  
}

class CarComparator implements Comparator {
  int compare(Object o1, Object o2) {
  int v1 = ((Car) o1).value;
  int v2 = ((Car) o2).value;
  return v1.compareTo(v2);
}
