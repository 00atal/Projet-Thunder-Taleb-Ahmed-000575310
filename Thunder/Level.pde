class Level {
  int number;
  String name;
  float bobInertia;
  int strikeSpeed;
  int maxStrikes;

  Level(int number) {
    setLevel(number);
  }

  void setLevel(int number) {
    this.number = number;
    if (number == 1) {
      name = "Basic";
      bobInertia = 0.95;
      strikeSpeed = 20;
      maxStrikes = 1;
    } else if (number == 2) {
      name = "Medium";
      bobInertia = 0.90;
      strikeSpeed = 40;
      maxStrikes = 2;
    } else if (number == 3) {
      name = "Expert";
      bobInertia = 0.85;
      strikeSpeed = 60;
      maxStrikes = 3;
    }
    resetGame(); // Redémarre la partie à chaque changement de niveau
  }

  void resetGame() {
    // À adapter selon votre code
    bob.reset(); // reset position/vitesse
    scoreManager.resetScore();
    //Strike.resetStrikes(); // méthode statique à créer pour vider tous les éclairs
  }

  float getBobInertia() {
    return bobInertia;
  }

  int getStrikeSpeed() {
    return strikeSpeed;
  }

  int getMaxStrikes() {
    return maxStrikes;
  }

  String getName() {
    return name;
  }

  int getNumber() {
    return number;
  }
}
