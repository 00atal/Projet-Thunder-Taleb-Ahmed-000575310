class GameManager {
  Bob bob;
  ManageStrike manageStrike;
  Level level;
  ManageDisplay displayManager;
  ManageScore scoreManager;
  String levelInfo = "Current Level : ";
   Strike strike;

  void setupGame() {
    bob = new Bob(width / 2, height - 100, color(255, 20, 0), 50, 10, -20);
    displayManager = new ManageDisplay();
    scoreManager = new ManageScore();
    
    level = new Level(" Basic", 0.5f, 0.1f, 5f);  
    bob.setLevel(level);  

    manageStrike = new ManageStrike(level);
  }

  void updateGame() {
    displayManager.drawClouds();
    displayManager.drawScene(bob, scoreManager);

    bob.moveManage();
    bob.move(bob.speed);
    bob.limitPosition();
    manageStrike.manageStrike(bob, scoreManager, 20);

    if (strike != null && strike.hits(bob)) {
      displayManager.displayScore(scoreManager.getScore(), scoreManager.getHighScore());
    }

    fill(255); 
    textSize(20);
    text(levelInfo + level.getName(), 10, 90); 
  }
}
