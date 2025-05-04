  Bob bob;
  ManageStrike manageStrike;
  Level level;
  Strike strike = null;
  boolean firstMove = false;
  ManageDisplay displayManager;
  ManageScore scoreManager;
  int delayBeforeNextStrike = 0;

void setup() {
  size(800, 600);
  bob = new Bob(width / 2, height - 100, color(0, 20, 500), 50, 15, -20);
    displayManager = new ManageDisplay();
    scoreManager = new ManageScore();
    level = new Level(1); 
    manageStrike = new ManageStrike();
}

void draw() {
  displayManager.drawClouds();
    displayManager.drawScene(bob, scoreManager);
    bob.moveManage();
    bob.move(bob.speed);
    bob.limitPosition();

    manageStrike.manageStrike(bob, scoreManager, level.getStrikeSpeed());

    if (strike != null && strike.hits(bob)) {
      displayManager.displayScore(scoreManager.getScore(), scoreManager.getHighScore());
    }
      displayManager.displayLevelName(level.getName());
if (keyPressed) {
  if (key == '1') {
    level.setLevel(1);
    println("1"+bob.getSlowSpeed());
  } else if (key == '2') {
    level.setLevel(2);
    println("2"+bob.getSlowSpeed());
  } else if (key == '3') {
    level.setLevel(3);
    println("3"+bob.getSlowSpeed());
  }
}

}
