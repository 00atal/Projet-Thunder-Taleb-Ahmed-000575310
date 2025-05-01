Bob bob;

void setup() {
  size(800, 600); 
 //float x, float y, color c, float s,int leg_position, float speed 
  bob = new Bob(width/2, height-100, color(0, 102, 204), 50, 10, -20);
}

void draw() {
  background(255);
  bob.display();
}
