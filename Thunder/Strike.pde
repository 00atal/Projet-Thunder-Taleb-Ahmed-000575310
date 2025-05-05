class Strike {
  // Coordonnées de départ et d’arrivée du segment de l’éclair
  float x1, y1, x2, y2;
  // Position actuelle de l’extrémité de l’éclair
  float current_x, current_y;
  float progress;
  int strike_speed;

  // Segment suivant de l’éclair (pour créer des ramifications)
  Strike nextStrike;

  // Constructeur
  Strike(float _x1, float _y1, int _strike_speed) {
    strike_speed = _strike_speed; // vitesse de descente suggérée : 10
    x1 = _x1;
    y1 = _y1;
    
    // Position de fin (aléatoire, mais proche du bas de l'écran)
    y2 = random(0.95, 0.85) * height;
    x2 = random(max(0, x1 - (height - y1)), min(width, x1 + (height - y1)));

    progress = 0;
    nextStrike = null;

    current_x = x1;
    current_y = y1;
  }

  // Mise à jour de l’éclair et de ses éventuelles ramifications
  void update() {
    if (nextStrike == null) {
      progress(); // fait avancer l’éclair principal
      if (random(1) < 0.05) {
        // 5% de chance de créer une ramification à chaque frame
        nextStrike = new Strike(current_x, current_y, strike_speed);
      }
    } else {
      nextStrike.update(); // mise à jour récursive de la ramification
    }
  }

  // Fait descendre l’éclair vers y2 avec interpolation de x
  void progress() {
    current_y += strike_speed;
    current_y = constrain(current_y, 0, y2);
    current_x = x2 + (x1 - x2) * (current_y - y2) / (y1 - y2);
  }

  // Affichage de l’éclair
  void display() {
    stroke(255, 255, 0); // couleur jaune
    strokeWeight(3);
    line(x1, y1, current_x, current_y); // segment principal
    noStroke();

    if (nextStrike != null) {
      nextStrike.display(); // dessine la ramification
    }
  }

  // Indique si l’éclair est arrivé à destination (ou si toutes ses branches le sont)
  boolean finished() {
    return current_y == y2 || (nextStrike != null && nextStrike.finished());
  }

  // Vérifie si l’éclair touche Bob (collision circulaire)
  boolean hits(Bob bob) {
    return (dist(bob.x, bob.y, current_x, current_y) < 0.7 * bob.s) || 
           (nextStrike != null && nextStrike.hits(bob));
  }

  // Permet de modifier dynamiquement la vitesse d’un éclair
  void setStrikeSpeed(int newStrikeSpeed) {
    this.strike_speed = newStrikeSpeed;
  }
}
