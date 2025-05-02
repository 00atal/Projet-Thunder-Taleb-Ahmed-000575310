Bob bob;
Strike strike= null;
boolean firstMove = false;
ManageDisplay displayManager;
ScoreManager scoreManager;
int delayBeforeNextStrike=0;
int score = 0;
int highScore =0;

void setup() {
  size(800, 600); 
  bob = new Bob(width/2, height-100, color(255, 20, 0), 50, 10, -20);
  displayManager = new ManageDisplay();
  scoreManager = new ScoreManager();
}

void draw() {
  displayManager.drawScene(scoreManager);
  displayManager.drawClouds();
  bob.display();
  bob.moveManage();

  bob.move(bob.speed);
  bob.limitPosition();
    
  if (strike != null) {
    strike.update();
    strike.display();
  if (strike.hits(bob)) {
    score = 0; 
    strike = null;
    delayBeforeNextStrike = 60; 
  } else if (strike.finished()) {
    score++; 
    if (score > highScore) {
      highScore = score; 
    }
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
    fill(255);
    textSize(24);
    text("Score : " + score, 10, 30);
    println("Bob is hit by the strike !");
    background(169, 0, 0);
  }
}
