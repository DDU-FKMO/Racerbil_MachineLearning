class Car {
  PVector pos = new PVector(100, 100);
  PVector vel = new PVector(0, 5);
  int value = 0;
  String DNA;
  int startTime = millis();
  int finishTime;
  //SensorSystem
  SensorSystem sensors;
  //NeuralNetwork
  NeuralNetwork neuralNetwork;

  Car(String dna) {
    DNA = dna;
    neuralNetwork = new NeuralNetwork(DNA);
    sensors = new SensorSystem();
  }

  Car() {
    DNA = "";
    for (int i = 0; i < 11; i++) {
      DNA += str(int(random(9)));
    }
    neuralNetwork = new NeuralNetwork(DNA);
    sensors = new SensorSystem();
  }

  void turnCar(float turnAngle) {
    vel.rotate(turnAngle);
  }

  void displayCar() {
    stroke(100);
    fill(100);
    ellipse(pos.x, pos.y, 10, 10);
    textSize(15);
    //text("V: " + value, pos.x, pos.y - 30);
  }

  void updateScore() {
    if (sensors.outOfBounds) {
      value -= 1;
    }
    if (sensors.crossedBlue && sensors.nextLineBlue) {
      finishTime = millis();
      value += 1000 - (finishTime - startTime)/300;
      sensors.nextLineBlue = false;
    }
    if (sensors.crossedGreen && !sensors.nextLineBlue) {
      finishTime = millis();
      value += 3000 - (finishTime - startTime)/300;
      sensors.crossedBlue = false;
      sensors.crossedGreen = false;
      sensors.nextLineBlue = true;
    }
  }

  void update() {
    //Check sensors
    sensors.updateSensors(pos, vel);
    //Update score
    updateScore();
    //NeuralNetwork
    float output = neuralNetwork.GetOutput(sensors.leftSensorSignal, sensors.rightSensorSignal, sensors.frontSensorSignal);
    //Turn car
    turnCar(output / 100);
    //Move car
    pos.add(vel);
    //Display car
    displayCar();
    sensors.displaySensors(pos);
  }
}
