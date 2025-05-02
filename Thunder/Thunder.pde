Bob bob;
ManageStrike manageStrike;

Strike strike= null;
boolean firstMove = false;
ManageDisplay displayManager;
ManageScore scoreManager;
int delayBeforeNextStrike=0;

void setup() {
  size(800, 600); 
  bob = new Bob(width/2, height-100, color(255, 20, 0), 50, 10, -20);
  displayManager = new ManageDisplay();
  scoreManager = new ManageScore();
  manageStrike = new ManageStrike();
}

void draw() {
  displayManager.drawClouds();
  displayManager.drawScene(bob,scoreManager);
  bob.moveManage();
  bob.move(bob.speed);
  bob.limitPosition();
    
manageStrike.manageStrike(bob, scoreManager);
  
  if (strike != null && strike.hits(bob)) {
    displayManager.displayScore(scoreManager.getScore(), scoreManager.getHighScore());
  }
}
