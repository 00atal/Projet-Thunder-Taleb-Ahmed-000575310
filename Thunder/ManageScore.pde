class ManageScore {
  int score;// Score actuel du joueur
  int highScore;// Meilleur score atteint (score maximal enregistré)
 // Constructeur : initialise le score et le high score à 0
  ManageScore() {
    score = 0;
    highScore = 0;
  }
// Réinitialise le score à 0 (utilisé après une collision par exemple)
  void resetScore() {
    score = 0;
  }
 // Incrémente le score de 1 point et met à jour le high score si nécessaire
  void setScore() {
    score++;
    if (score > highScore) {
      highScore = score;
    }
  }
  // Renvoie le score actuel
  int getScore(){
    return score;
  }
  // Renvoie le meilleur score enregistré
  int getHighScore(){
    return highScore;
  }
// Affiche le score et le high score à l'écran
  void display() {
    fill(255);
    textSize(24);
    text("Score : " + score, 10, 30);
    text("High Score : " + highScore, 10, 60);
  }
  // Réinitialise le high score à 0 (par exemple via un bouton "Reset")
  void resetHighScore(){
    highScore=0;
  }
}
