import java.util.Collections; 
import java.util.Comparator; 

class Generation {
  ArrayList<Car> cars = new ArrayList<Car>();
  
  Generation(int populationSize) {
    for(int i = 0; i < populationSize; i++) {
       //Create new car
       cars.add(new Car());
    }
  }
  
  Generation(Generation lastGeneration, int top) {
    ArrayList<Car> oldCars = lastGeneration.cars;
    oldCars.sort(new CarComparator());
    for(int i = 0; i < lastGeneration.cars.size(); i++) {
        Car car1 = oldCars.get(int(random(top)));
        Car car2 = oldCars.get(int(random(top)));
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
    return v1 - v2;
  }
}
