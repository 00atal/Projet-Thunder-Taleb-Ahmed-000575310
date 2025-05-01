Bob bob;

void setup() {
  size(800, 600); 
 //float x, float y, color c, float s,int leg_position, float speed 
  bob = new Bob(width/2, height-100, color(255, 20, 0), 50, 10, -20);
}

void draw() {
  background(100);
  fill(0, 150, 0); // Vert
  noStroke();
  rect(0, height - 65, width, 65);
  bob.display();
}
