import java.util.Collections; 
import java.util.Comparator; 

class GeneticAlgorithm {
  int populationSize = 200;
  int topCars = 3;
  public ArrayList<Generation> generations = new ArrayList<Generation>();
  
  void addGeneration() {
    if(generations.size() == 0) {
      generations.add(new Generation(populationSize));
    } else {
      Generation latestGen = generations.get(generations.size() - 1);
      latestGen.cars.sort(new CarComparator());
      generations.add(new Generation(latestGen, topCars));
      //Save latest best car:
      Car bestCar = latestGen.cars.get(0);
      String bestValues = "V:"+bestCar.value+";" + "DNA:" + bestCar.DNA + ";";
      //Test:
      char[] chars = bestCar.DNA.toCharArray();
      for(int c = 0; c < chars.length; c++) {
        int v = int(str(chars[c]));
        if(v >= 5) v -= 9;
    
        if(c < 8) {
          bestValues += "W" + c + ":" + v + ";";
        } else {
          bestValues += "B" + (c - 8) + ":" + v + ";";
        }
      }
      saveStrings("best.txt", bestValues.split(";"));
      println("Latest generation best car values: " + bestValues);
    }
  }
  
}
