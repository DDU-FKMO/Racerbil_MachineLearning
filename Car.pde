class Car {
    PVector pos = new PVector(0,0);
    PVector vel = new PVector(0,10);
    int value = 0;
  
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
