class Level {
  int number = 1;
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
  }

  void resetGame(Bob bob, ManageScore scoreManager) {
    bob.reset(); 
    scoreManager.resetScore(); 
  }

  float getBobInertia() { return bobInertia; }
  int getStrikeSpeed() { return strikeSpeed; }
  int getMaxStrikes() { return maxStrikes; }
  String getName() { return name; }
  int getNumber() { return number; }
}
