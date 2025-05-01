class Level{
  int level;
  float speed;
  
  Level (float bobSpeed){
    this.bobSpeed=bobSpeed;
  }
  
  void setSpeed(float newBobSpeed){
    this.bobSpeed=newBobSpeed;
  }
  
  float getSpeed(){
    return this.bobSpeed;
  }
}
