class ManageStrike {
  ArrayList<Strike> strikes;
  int delayBeforeNextStrike;

  ManageStrike() {
    strikes = new ArrayList<Strike>();
    delayBeforeNextStrike = 0;
  }

  void manageStrike(Bob bob, ManageScore scoreManager, int strikeSpeed, int nbStrikes) {
    // Créer de nouveaux éclairs si nécessaire en fonction de nbStrikes
    if (delayBeforeNextStrike == 0) {
        // Ajouter le nombre d'éclairs demandé
        for (int i = 0; i < nbStrikes; i++) {
            strikes.add(new Strike(random(width), 0, strikeSpeed));
        }
        delayBeforeNextStrike = 60;  // Délai avant de créer de nouveaux éclairs
    } else {
        delayBeforeNextStrike--;
    }

    // Mettre à jour et afficher les éclairs existants
    for (int i = 0; i < strikes.size(); i++) {
        Strike strike = strikes.get(i);
        strike.update();
        strike.display();

        // Vérifier si l'éclair touche Bob
        if (strike.hits(bob)) {
            scoreManager.resetScore();
            strikes.remove(i);
            i--;  // Réduire l'index après suppression
        } else if (strike.finished()) {
            scoreManager.setScore();
            strikes.remove(i);
            i--;  // Réduire l'index après suppression
        }
    }
}


  void addStrike(int nbStrikes) {
    strikes.clear(); // Supprimer les éclairs précédents
    for (int i = 0; i < nbStrikes; i++) {
      strikes.add(new Strike(random(width), 0, level.getStrikeSpeed()));
    }
  }

  int strikesSize() {
    return strikes.size();
  }
}
