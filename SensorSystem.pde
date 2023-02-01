class SensorSystem {
    float sensorMag = 100;
    float sensorAngle = PI*2/8;
    
    PVector sensorVectorFront = new PVector(0, sensorMag);
    PVector sensorVectorLeft = new PVector(0, sensorMag);
    PVector sensorVectorRight = new PVector(0, sensorMag);
    
    boolean frontSensorSignal = false;
    boolean leftSensorSignal = false;
    boolean rightSensorSignal = false;
    
    boolean outOfBounds = false;
    boolean lapComplete = false;
    
    int startTime = millis();
    int finishFrameTime;
    
    void updateSensorPosition(PVector vel) {
      //Update position of front sensor with velocity
      sensorVectorFront.set(vel);
      sensorVectorFront.normalize();
      sensorVectorFront.mult(sensorMag);
      //Update position of left sensor with front sensor and angle
      sensorVectorLeft.set(sensorVectorFront);
      sensorVectorLeft.rotate(-sensorAngle);
      //Update position of right sensor with front sensor and angle
      sensorVectorRight.set(sensorVectorFront);
      sensorVectorRight.rotate(sensorAngle);
    }
    
    void updateSensors(PVector pos, PVector vel) {
      //Sensor detection
      frontSensorSignal = get(int(pos.x + sensorVectorFront.x), int(pos.y + sensorVectorFront.y)) == -1 ? true: false;
      leftSensorSignal = get(int(pos.x + sensorVectorLeft.x), int(pos.y + sensorVectorLeft.y)) == -1 ? true: false;
      rightSensorSignal = get(int(pos.x + sensorVectorRight.x), int(pos.y + sensorVectorRight.y)) == -1 ? true: false;
      
      //Car detection
      color carPositionColor = get(int(pos.x), int(pos.y));
      //Check if car out of bounds
      if (carPositionColor == -1) {
        outOfBounds = true;
      }
      //Check if car is on finish line
      if (carPositionColor != -1 && green(carPositionColor) != 0) {
        lapComplete = true;
      }
      
      //Lap time calculation
      if (lapComplete) {
        finishFrameTime = millis() - startTime;
      }
      
      //Delete stranded car
      if (outOfBounds && frontSensorSignal && leftSensorSignal && rightSensorSignal) {
        
      }
      
      updateSensorPosition(vel);
    }
    
    void displaySensors(PVector pos) {
      
    }
}
