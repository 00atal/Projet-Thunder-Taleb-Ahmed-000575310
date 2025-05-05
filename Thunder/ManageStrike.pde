class ManageStrike {
  // Liste des éclairs actifs
  ArrayList<Strike> strikes;
  // Délai avant de pouvoir générer un nouvel éclair
  int delayBeforeNextStrike;

  // Constructeur : initialise la liste et le délai
  ManageStrike() {
    strikes = new ArrayList<Strike>();
    delayBeforeNextStrike = 0;
  }

  // Gère l'apparition, l'affichage, et les collisions des éclairs
  void manageStrike(Bob bob, ManageScore scoreManager, int strikeSpeed, int nbStrikes) {
    // Génère de nouveaux éclairs s'il n'y a pas de délai
    if (delayBeforeNextStrike == 0) {
      for (int i = 0; i < nbStrikes; i++) {
        // Crée un nouvel éclair à une position horizontale aléatoire
        strikes.add(new Strike(random(width), 0, strikeSpeed));
      }
      delayBeforeNextStrike = 60; // Attend 60 frames avant de pouvoir en générer d'autres
    } else {
      delayBeforeNextStrike--;
    }

    // Met à jour et affiche chaque éclair
    for (int i = 0; i < strikes.size(); i++) {
      Strike strike = strikes.get(i);
      strike.update();
      strike.display();

      // Si l'éclair touche Bob, le score est réinitialisé
      if (strike.hits(bob)) {
        scoreManager.resetScore();
        strikes.remove(i);
        i--; // Corriger l'index après suppression
      }
      // Si l'éclair est sorti de l'écran sans toucher Bob, on augmente le score
      else if (strike.finished()) {
        scoreManager.setScore();
        strikes.remove(i);
        i--; // Corriger l'index après suppression
      }
    }
  }

  // Ajoute un nombre donné d'éclairs (par exemple après un reset)
  void addStrike(int nbStrikes) {
    strikes.clear(); // Supprime tous les éclairs actuels
    for (int i = 0; i < nbStrikes; i++) {
      strikes.add(new Strike(random(width), 0, level.getStrikeSpeed()));
    }
  }

  // Renvoie le nombre d'éclairs actifs
  int strikesSize() {
    return strikes.size();
  }
}
