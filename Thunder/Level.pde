class Level {
  int number = 1;// Numéro du niveau (1 = facile, 2 = moyen, 3 = difficile)
  String name;// Nom du niveau ("Basic", "Medium", "Expert")
  float bobInertia; // Inertie appliquée au joueur (plus faible = mouvement plus fluide)
  int strikeSpeed;  // Vitesse des éclairs (plus élevé = plus difficile)
  int maxStrikes;// Nombre maximum d'éclairs actifs à la fois
// Constructeur : initialise un niveau avec son numéro
  Level(int number) {
    setLevel(number);
  }
// Définit les paramètres du niveau en fonction de son numéro
  void setLevel(int number) {
    this.number = number;
    if (number == 1) {
      name = "Basic";
      bobInertia = 0.95;
      strikeSpeed = 20;
      maxStrikes = 1;
    } else if (number == 2) {
      name = "Medium";
      bobInertia = 0.90;
      strikeSpeed = 40;
      maxStrikes = 2;
    } else if (number == 3) {
      name = "Expert";
      bobInertia = 0.85;
      strikeSpeed = 60;
      maxStrikes = 3;
    }
  }
  // Réinitialise l'état du joueur et le score
  void resetGame(Bob bob, ManageScore scoreManager) {
    bob.reset(); // Réinitialise la position et l'état de Bob
    scoreManager.resetScore(); // Réinitialise le score
  }
 // Getters pour les propriétés du niveau
  float getBobInertia() { return bobInertia; }
  int getStrikeSpeed() { return strikeSpeed; }
  int getMaxStrikes() { return maxStrikes; }
  String getName() { return name; }
  int getNumber() { return number; }
}
