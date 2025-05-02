class ManageDisplay {
  color bgColor;

  ManageDisplay() {
    bgColor = color(169, 169, 169); 
  }

  void setDangerBackground() {
    bgColor = color(169, 0, 0); 
  }

  void resetBackground() {
    bgColor = color(169, 169, 169);
  }

  void drawScene(Bob bob, ScoreManager scoreManager) {
    background(bgColor);
    drawGround();
    drawClouds();
    bob.display();
    scoreManager.display(); 
  }

  void drawGround() {
    fill(0, 150, 0); 
    noStroke();
    rect(0, height - 65, width, 65);
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
}
