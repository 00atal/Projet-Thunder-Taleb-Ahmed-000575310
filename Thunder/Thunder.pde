Bob bob;

void setup() {
  size(600, 400); 
  bob = new Bob(width/2, height/2, color(0, 102, 204), 100, 0, 1);
}

void draw() {
  background(255);
  bob.display();
}
