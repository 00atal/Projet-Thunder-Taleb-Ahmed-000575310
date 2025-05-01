Bob bob;

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
  if (keyPressed) {
    if (keyCode == LEFT) {
      bob.move(-1);
    } else if (keyCode == RIGHT) {
      bob.move(1);
    }
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
