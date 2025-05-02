Bob bob;
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
}

void draw() {
  displayManager.drawClouds();
  displayManager.drawScene(bob,scoreManager);
  bob.moveManage();
  bob.move(bob.speed);
  bob.limitPosition();
    
  if (strike != null) {
    strike.update();
    strike.display();
    
  if (strike.hits(bob)) {
    scoreManager.resetScore();
    strike = null;
    delayBeforeNextStrike = 60; 
  } else if (strike.finished()) {
    scoreManager.setScore();
    strike = null;
    delayBeforeNextStrike = 60;
  }
  }else {
  if (delayBeforeNextStrike > 0) {
    delayBeforeNextStrike--;
  } else if (random(1) < 0.05) {
    strike = new Strike(random(width), 0, 10);
  }
}
  
  if (strike != null && strike.hits(bob)) {
    displayManager.displayScore(scoreManager.getScore(), scoreManager.getHighScore());
  }
}
