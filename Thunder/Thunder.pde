Bob bob;
Strike strike= null;
boolean firstMove = false;
int delayBeforeNextStrike=0;
int score = 0;

void setup() {
  size(800, 600); 
 //float x, float y, color c, float s,int leg_position, float speed 
  bob = new Bob(width/2, height-100, color(255, 20, 0), 50, 10, -20);
  
}

void draw() {
  background(169, 169, 169);
  fill(0, 150, 0); 
  noStroke();
  rect(0, height - 65, width, 65);
  drawClouds();
  bob.display();
  fill(255);
    textSize(24);
    text("Score : " + score, 10, 30);
  bob.moveManage();

  bob.move(bob.speed);
  bob.limitPosition();
  
  
  if (strike != null) {
    strike.update();
    strike.display();

    if (strike.finished()) {
      strike = null;
      delayBeforeNextStrike = int(random(30, 90)); 
    }
  } else {
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
  }
}

void drawClouds() {
  fill(100); 
  noStroke();
  ellipse(150, 100, 120, 60); 
  ellipse(300, 120, 150, 70);
  ellipse(500, 80, 100, 50);
  ellipse(700, 100, 130, 65);
  ellipse(0, 0, 120, 200); 
  ellipse(200, 0, 300, 200);
  ellipse(500, 0, 350, 150);
  ellipse(700, 0, 250, 165);
  ellipse(400, 80, 150, 65);
}
