class Level{
  int level;
  float speed;
  float bobSpeed;  
  float strikeSpeed;  
  int maxStrikes;  
  float bobDeceleration;
  
  Level (int startingLevel){
    level = startingLevel;
    setLevelProperties(1);
  }
  
  void setLevelProperties(int lvl) {
    if (lvl == 1) {
      bobSpeed = 9;
      strikeSpeed = 10;
      maxStrikes = 1;
      bobDeceleration = 0.90;  // Ralentissement plus rapide
      level=lvl;
    } else if (lvl == 2) {
      bobSpeed = 7;
      strikeSpeed = 15;
      maxStrikes = 2;
      bobDeceleration = 0.95;  // Ralentissement plus lent
      level=lvl;
    } else if (lvl == 3) {
      bobSpeed = 10;
      strikeSpeed = 20;
      maxStrikes = 3;
      bobDeceleration = 0.99;  // Ralentissement encore plus lent
      level=lvl;
    }
  }
  
  void setSpeed(int newBobSpeed){
    this.speed=newBobSpeed;
  }
    float getBobSpeed(){
    return this.bobSpeed;
  }
  
  float getSpeed(){
    return this.speed;
  }

  // Méthode pour obtenir la vitesse des éclairs
  float getStrikeSpeed() {
    return strikeSpeed;
  }

  // Méthode pour obtenir le nombre d'éclairs simultanés
  int getMaxStrikes() {
    return maxStrikes;
  }

  // Méthode pour obtenir l'inertie de Bob
  float getBobDeceleration() {
    return bobDeceleration;
  }
}
