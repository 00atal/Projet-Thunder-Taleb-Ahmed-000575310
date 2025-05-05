class ManageScore {
  // Score actuel du joueur
  int score;
  // Meilleur score atteint
  int highScore;

  // Constructeur : initialise les scores à zéro
  ManageScore() {
    score = 0;
    highScore = 0;
  }

  // Réinitialise uniquement le score actuel
  void resetScore() {
    score = 0;
  }

  // Incrémente le score et met à jour le high score si nécessaire
  void setScore() {
    score++;
    if (score > highScore) {
      highScore = score;
    }
  }

  // Renvoie le score actuel
  int getScore() {
    return score;
  }

  // Renvoie le meilleur score
  int getHighScore() {
    return highScore;
  }

  // Affiche le score et le high score à l'écran
  void display() {
    fill(255);
    textSize(24);
    text("Score : " + score, 10, 30);
    text("High Score : " + highScore, 10, 60);
  }

  // Réinitialise le high score à zéro
  void resetHighScore() {
    highScore = 0;
  }
}
