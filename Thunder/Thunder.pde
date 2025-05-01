Bob bob;
void setup() {
  size(600, 400); 
  bob = new Bob(width/2, height/2, 566, color(0, 102, 204),0, 1);
}

void draw() {
  background(255); // Couleur de fond
  bob.display();
}
