class SensorSystem {
    float sensorMag = 50;
    float sensorAngle = PI*2/8;
    
    PVector sensorVectorFront = new PVector(0, sensorMag);
    PVector sensorVectorLeft = new PVector(0, sensorMag);
    PVector sensorVectorRight = new PVector(0, sensorMag);
    
    boolean frontSensorSignal = false;
    boolean leftSensorSignal = false;
    boolean rightSensorSignal = false;
    
    boolean outOfBounds = false;
    boolean nextLineBlue = true;
    boolean crossedBlue = false;
    boolean crossedGreen = false;
    
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
      
      //Check if car crossed checkpoint
      if (carPositionColor != -1 && blue(carPositionColor) > green(carPositionColor) && green(carPositionColor) < 100 && blue(carPositionColor) > 50) {
        crossedBlue = true;
        
      }
      
      //Check if car is on finish line
      if (carPositionColor != -1 && green(carPositionColor) > blue(carPositionColor)  && blue(carPositionColor) < 100 && green(carPositionColor) > 50 && crossedBlue) {
        crossedGreen = true;
      }
      
      updateSensorPosition(vel);
    }
    
    void displaySensors(PVector pos) {
      //Draw front sensor
      if (frontSensorSignal) {
        fill(255, 0, 0);
      } else {
        fill(100);
      }
      ellipse(pos.x + sensorVectorFront.x, pos.y + sensorVectorFront.y, 10, 10);
      //Draw left sensor
      if (leftSensorSignal) {
        fill(255, 0, 0);
      } else {
        fill(100);
      }
      ellipse(pos.x + sensorVectorLeft.x, pos.y + sensorVectorLeft.y, 10, 10);
      //Draw right sensor
      if (rightSensorSignal) {
        fill(255, 0, 0);
      } else {
        fill(100);
      }
      ellipse(pos.x + sensorVectorRight.x, pos.y + sensorVectorRight.y, 10, 10);
      
      //Draw connecting lines
      fill(100);
      line(pos.x, pos.y, pos.x + sensorVectorFront.x, pos.y + sensorVectorFront.y);
      line(pos.x, pos.y, pos.x + sensorVectorLeft.x, pos.y + sensorVectorLeft.y);
      line(pos.x, pos.y, pos.x + sensorVectorRight.x, pos.y + sensorVectorRight.y);
      
      //Draw stranded car
      if (outOfBounds && frontSensorSignal && leftSensorSignal && rightSensorSignal) {
        fill(255, 0, 0);
        ellipse(pos.x, pos.y, 10, 10);
      }
    }
}
