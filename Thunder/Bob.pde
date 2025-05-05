class Bob {
  // Position de Bob
  private float x, y;

  // Couleur du t-shirt
  private color c;

  // Taille du personnage
  private float s;

  // Position utilisée pour animer les jambes
  private int leg_position;

  // Vitesse horizontale
  private float speed;

  // Indique si un mouvement a déjà commencé
  boolean firstMove = false;

  // Facteur de ralentissement
  float slowSpeed = 0.98;

  // Constructeur
  Bob(float x, float y, color c, float s, int leg_position, float speed) {
    this.x = x;
    this.y = y;
    this.c = c;
    this.s = s;
    this.leg_position = leg_position;
    this.speed = speed;
  }

  // Affiche le personnage à l'écran
  void display() {
    pushMatrix();
    translate(x, y); // Centre sur la position de Bob

    // Tête
    fill(255, 224, 189);
    ellipse(0, -s * 0.5, s * 0.6, s * 0.6);

    // Mouvement des jambes si une touche est pressée
    fill(0);
    float leg_movement = 25;
    if (keyPressed) {
      if (keyCode == LEFT || keyCode == RIGHT) {
        leg_position += abs(speed);
        leg_movement = sin(leg_position * 0.1) * s * speed * 0.03;
      }
    } else {
      leg_position = 0;
      leg_movement = 0;
    }

    // Jambes
    rect(-s * 0.25, s * 0.25, s * 0.2, s * 0.5 + min(leg_movement, 0));
    rect(s * 0.05, s * 0.25, s * 0.2, s * 0.5 - max(leg_movement, 0));

    // Corps
    fill(c);
    rect(-s * 0.5, -s * 0.25, s, s * 0.5);

    // Bras
    fill(255, 224, 189);
    rect(-s * 0.7, -s * 0.25, s * 0.2, s * 0.5);
    rect(s * 0.5, -s * 0.25, s * 0.2, s * 0.5);

    popMatrix();
  }

  // Change la vitesse de Bob
  void changeSpeed(float deltaSpeed) {
    speed += deltaSpeed;
  }

  // Applique un ralentissement progressif
  void slowDown(float slow) {
    if (speed > 0) {
      speed *= slow;
    } else if (speed < 0) {
      speed *= slow;
    }
    if (abs(speed) < 0.1) {
      speed = 0;
    }
  }

  // Empêche Bob de sortir de l'écran
  void limitPosition() {
    if (x <= s / 2 || x >= width - s / 2) {
      speed = 0;
    }
  }

  // Déplace Bob horizontalement
  void move(float dx) {
    x += dx;
    x = constrain(x, s / 2, width - s / 2);
  }

  // Gère le déplacement en fonction des touches et du ralentissement
  void moveManage(float slow) {
    if (keyPressed) {
      if (keyCode == LEFT) {
        this.changeSpeed(-0.5);
        firstMove = true;
      } else if (keyCode == RIGHT) {
        this.changeSpeed(0.5);
        firstMove = true;
      }
    } else {
      if (firstMove) {
        this.slowDown(slow);
      } else {
        this.x = width / 2;
        this.speed = 0;
      }
    }
  }

  // Réinitialise Bob au centre de l'écran
  void reset() {
    x = width / 2;
    y = height - 100;
    speed = 0;
    firstMove = false;
  }

  // Renvoie le facteur de ralentissement
  float getSlowSpeed() {
    return slowSpeed;
  }
}
