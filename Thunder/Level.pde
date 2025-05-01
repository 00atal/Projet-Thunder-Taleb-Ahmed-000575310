class Level{
  float level;
  float speed;
  
  Level (float startingLevel){
    level = startingLevel;
    speed = level * 2;
  }
  
  void setSpeed(float newBobSpeed){
    this.speed=newBobSpeed;
  }
  
  float getSpeed(){
    return this.speed;
  }
  void increaseLevel() {
    level++;
    speed = level * 2; 
  }
}
