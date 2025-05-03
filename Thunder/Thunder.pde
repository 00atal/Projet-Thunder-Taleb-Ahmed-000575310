GameManager gameManager = new GameManager();

void setup() {
  size(800, 600);
  gameManager.setupGame();
}

void draw() {
  gameManager.updateGame();
  
}
