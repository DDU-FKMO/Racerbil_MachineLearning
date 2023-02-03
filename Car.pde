class Car {
  PVector pos;
  PVector vel = new PVector(0, 5);
  int value = 0;
  String DNA;
  //SensorSystem
  SensorSystem sensors = new SensorSystem();
  //NeuralNetwork
  NeuralNetwork neuralNetwork;

  Car(String dna) {
    DNA = dna;
    neuralNetwork = new NeuralNetwork(DNA);
    pos = new PVector(width / 2, height / 2);
  }

  Car() {
    DNA = "";
    for (int i = 0; i < 11; i++) {
      DNA += str(int(random(9)));
    }
    neuralNetwork = new NeuralNetwork(DNA);
    pos = new PVector(width / 2, height / 2);
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
    sensors.updateSensors(pos, vel);
    //NeuralNetwork
    float output = neuralNetwork.GetOutput(sensors.leftSensorSignal, sensors.rightSensorSignal, sensors.frontSensorSignal);
    //Turn car
    turnCar(output / 100000);
    //Move car
    pos.add(vel);
    //Display car
    displayCar();
    sensors.displaySensors(pos);
  }
}
