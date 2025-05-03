class GameManager {
  Bob bob;
  ManageStrike manageStrike;
  Level level;
  Strike strike = null;
  boolean firstMove = false;
  ManageDisplay displayManager;
  ManageScore scoreManager;
  int delayBeforeNextStrike = 0;

  void setupGame() {
    bob = new Bob(width / 2, height - 100, color(255, 20, 0), 50, 10, -20);
    displayManager = new ManageDisplay();
    scoreManager = new ManageScore();
    level = new Level(); 
    manageStrike = new ManageStrike(level);
  }

  void updateGame() {
    displayManager.drawClouds();
    displayManager.drawScene(bob, scoreManager);
    bob.moveManage();
    bob.move(bob.speed);
    bob.limitPosition();

    manageStrike.manageStrike(bob, scoreManager, 30);

    if (strike != null && strike.hits(bob)) {
      displayManager.displayScore(scoreManager.getScore(), scoreManager.getHighScore());
    }
  }
}
