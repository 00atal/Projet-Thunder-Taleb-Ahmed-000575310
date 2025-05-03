class Level {
  String name;
  float acceleration;   
  float deceleration;   
  float maxSpeed;             

  Level( String name, float acceleration, float deceleration, float maxSpeed) {
    this.name=name;
    this.acceleration = acceleration;
    this.deceleration = deceleration;
    this.maxSpeed = maxSpeed;
  }

  String getName() {
    return name;
  }

  float getAcceleration() {
    return acceleration;
  }

  float getDeceleration() {
    return deceleration;
  }

  float getMaxSpeed() {
    return maxSpeed;
  }
  
  void setAcceleration(float acceleration) {
    this.acceleration = acceleration;
  }

  void setDeceleration(float deceleration) {
    this.deceleration = deceleration;
  }

  void setMaxSpeed(float maxSpeed) {
    this.maxSpeed = maxSpeed;
  }
}
