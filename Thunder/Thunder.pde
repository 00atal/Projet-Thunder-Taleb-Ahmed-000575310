Bob bob;
ManageStrike manageStrike;
Level level;
Strike strike= null;
boolean firstMove = false;
ManageDisplay displayManager;
ManageScore scoreManager;

void setup() {
  size(800, 600); 
  bob = new Bob(width/2, height-100, color(255, 20, 0), 50, 10, -20);
  displayManager = new ManageDisplay();
  scoreManager = new ManageScore();
  manageStrike = new ManageStrike(level);
  level = new Level(1);
}

void draw() {
  displayManager.displayMain();
  bob.bobMain();
  manageStrike.manageStrike(bob, scoreManager);
  if (strike != null && strike.hits(bob)) {
    displayManager.displayScore(scoreManager.getScore(), scoreManager.getHighScore());
  }
  if (keyPressed) {
    if (key == '1') {
      level = new Level(1);
      manageStrike.setLevel(level); // met à jour le niveau dans manageStrike
      scoreManager.resetScore();
    } else if (key == '2') {
      level = new Level(2);
      manageStrike.setLevel(level);
      scoreManager.resetScore();
    } else if (key == '3') {
      level = new Level(3);
      manageStrike.setLevel(level);
      scoreManager.resetScore();
    }
  }
}
