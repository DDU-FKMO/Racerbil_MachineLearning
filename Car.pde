class Car {
  PVector pos = new PVector(0, 0);
  PVector vel = new PVector(0, 5);
  int value = 0;
  String DNA;

  Car(String dna) {
    DNA = dna;
    println(DNA);
  }

  Car() {
    DNA = "";
    for (int i = 0; i < 11; i++) {
      DNA += str(int(random(9)));
    }
    println(DNA);
  }

  void turnCar(float turnAngle) {
    vel.rotate(turnAngle);
  }

  void displayCar() {
    stroke(100);
    fill(100);
    ellipse(pos.x, pos.y, 10, 10);
  }

  void update() {
    //Check sensors

    //NeuralNetwork

    //Turn car

    //Move
    pos.add(vel);
    //Display
    displayCar();
  }
}
