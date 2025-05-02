Bob bob;
Strike strike= null;
boolean firstMove = false;
ManageDisplay diplayManager;
int delayBeforeNextStrike=0;
int score = 0;
int highScore =0;

void setup() {
  size(800, 600); 
 //float x, float y, color c, float s,int leg_position, float speed 
  bob = new Bob(width/2, height-100, color(255, 20, 0), 50, 10, -20);
  diplayManager = new ManageDisplay();
  
}

void draw() {
  background(169, 169, 169);
  fill(0, 150, 0); 
  noStroke();
  rect(0, height - 65, width, 65);
diplayManager.drawClouds();
  bob.display();
  fill(255);
  textSize(24);
  text("Score : " + score, 10, 30);
  text("High Score : " + highScore, 10, 60);
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
