class Level {
  // Numéro du niveau (1 = facile, 2 = moyen, 3 = difficile)
  int number = 1;

  // Nom du niveau
  String name;

  // Inertie appliquée à Bob (plus faible = plus de friction)
  float bobInertia;

  // Vitesse d'apparition des éclairs
  int strikeSpeed;

  // Nombre maximum d'éclairs présents simultanément
  int maxStrikes;

  // Constructeur : initialise un niveau donné
  Level(int number) {
    setLevel(number);
  }

  // Configure les paramètres en fonction du numéro du niveau
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

    // Réinitialise la partie quand on change de niveau
    resetGame();
  }

  // Remet Bob et les scores à zéro (à adapter si d'autres éléments doivent être réinitialisés)
  void resetGame() {
    bob.reset(); // Réinitialise la position et vitesse de Bob
    scoreManager.resetScore(); // Remet le score à zéro
    //Strike.resetStrikes(); // Décommenter si une méthode statique gère les éclairs
  }

  // Renvoie l'inertie de Bob pour ce niveau
  float getBobInertia() {
    return bobInertia;
  }

  // Renvoie la vitesse d'apparition des éclairs
  int getStrikeSpeed() {
    return strikeSpeed;
  }

  // Renvoie le nombre maximum d'éclairs en jeu
  int getMaxStrikes() {
    return maxStrikes;
  }

  // Renvoie le nom du niveau
  String getName() {
    return name;
  }

  // Renvoie le numéro du niveau
  int getNumber() {
    return number;
  }
}
