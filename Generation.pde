class Generation {
  ArrayList<Car> cars = new ArrayList<Car>();
  
  Generation(int populationSize) {
    for(int i = 0; i < populationSize; i++) {
       //Create new car
       cars.add(new Car());
    }
  }
  
  Generation(Generation lastGeneration, int top) {
    if(lastGeneration.cars.get(0).value >= bestValue) {
        bestValue = lastGeneration.cars.get(0).value;
        bestGeneration = algorithm.generations.size();
    }
    for(Car car : lastGeneration.cars) {
     //print(car.value + ";");
    }
    //println();
    for(int i = 0; i < lastGeneration.cars.size(); i++) {
        Car car1 = lastGeneration.cars.get(int(random(top)));
        Car car2 = lastGeneration.cars.get(int(random(top)));
        //Combine cars
        char[] chars = (car1.DNA.substring(0,6) + car2.DNA.substring(6,11)).toCharArray();
        for(int c = 0; c < chars.length; c++) {
          if(random(1) <= 0.03) {
            int value = int(chars[c]) + int(random(-1,1));
            if(value < 0) value = 9;
            if(value > 9) value = 0;
            chars[c] = str(value).charAt(0);
          }
        }
        String newDNA = String.valueOf(chars);
        //Create new car
        cars.add(new Car(newDNA));
    }
  }
  
}

class CarComparator implements Comparator {
  int compare(Object o1, Object o2) {
    int v1 = ((Car) o1).value;
    int v2 = ((Car) o2).value;
    return v2 - v1;
  }
}
