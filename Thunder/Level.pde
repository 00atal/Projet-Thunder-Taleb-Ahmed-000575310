class Level{
  int level;
  float speed;
  float bobSpeed;  
  float strikeSpeed;  
  int maxStrikes;  
  float bobDeceleration;
  
  Level (int startingLevel){
    level = startingLevel;
    setLevelProperties();
  }
  
  void setLevelProperties() {
    if (level == 1) {
      bobSpeed = 5;
      strikeSpeed = 2;
      maxStrikes = 1;
      bobDeceleration = 0.98;  // Ralentissement plus rapide
    } else if (level == 2) {
      bobSpeed = 7;
      strikeSpeed = 3;
      maxStrikes = 2;
      bobDeceleration = 0.95;  // Ralentissement plus lent
    } else if (level == 3) {
      bobSpeed = 10;
      strikeSpeed = 4;
      maxStrikes = 3;
      bobDeceleration = 0.92;  // Ralentissement encore plus lent
    }
  }
  
  void setSpeed(int newBobSpeed){
    this.speed=newBobSpeed;
  }
  
  float getSpeed(){
    return this.speed;
  }
  void increaseLevel() {
    if (level < 3) {  // Ne pas dépasser le niveau 3
      level++;
      setLevelProperties();  // Met à jour les propriétés du niveau suivant
    }
  }
  void decreaseLevel() {
    if (level > 1) {  // Ne pas descendre en dessous du niveau 1
      level--;
      setLevelProperties();  // Met à jour les propriétés du niveau précédent
    }
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
