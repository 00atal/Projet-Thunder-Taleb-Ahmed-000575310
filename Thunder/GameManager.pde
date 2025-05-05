class GameManager {
  GameManager(){
  }
  
  void keyP(){
      if (isNameScreen) {
    if (key == ENTER || key == RETURN) {
      isNameScreen = false;
      startGame();
    } else if (key == BACKSPACE && inputName.length() > 0) {
      inputName = inputName.substring(0, inputName.length() - 1);
    } else if (key != CODED && key != ENTER && key != RETURN) {
      inputName += key;
    }
  } else {
    if (key == '1') {
      level.setLevel(1);
      manageStrike.addStrike(level.getNumber());
      scoreManager.resetHighScore();
    } else if (key == '2') {
      level.setLevel(2);
      manageStrike.addStrike(level.getNumber());
      scoreManager.resetHighScore();
    } else if (key == '3') {
      level.setLevel(3);
      manageStrike.addStrike(level.getNumber());
      scoreManager.resetHighScore();
    } else if (key == 'q' || key == 'Q') {
      lb.addScore(inputName, level.getName(), 
        year() + "-" + nf(month(), 2) + "-" + nf(day(), 2) + " " +
        nf(hour(), 2) + ":" + nf(minute(), 2) + ":" + nf(second(), 2),
        scoreManager.getHighScore());
      exit();
    } else if (key == ' ') {
      isPaused = true; // Met le jeu en pause
    } else if (key == 'b' || key == 'B') {
      isPaused = false; // Reprend le jeu
      println("Jeu repris !");
    }
  }
  }
  
  void startGame() {
    bob = new Bob(width / 2, height - 100, color(0, 20, 500), 50, 15, -20);
    displayManager = new ManageDisplay();
    scoreManager = new ManageScore();
    level = new Level(1); 
    manageStrike = new ManageStrike();
    lb = new Leaderboard("LeaderScore.txt");
  }
  
  void updateGameScreen() {
    background(255);  // Réinitialisation de l'arrière-plan à blanc

    // Écran de saisie du nom
    if (isNameScreen) {
        displayManager.showNameScreen(inputName);
        return;
    }

    // Si le jeu est en pause, on affiche les scores
    if (isPaused) {
        displayManager.drawHighScoceOrder();  // Affichage des scores élevés
        return;
    }

    // Partie du jeu principale
    displayManager.drawClouds();  // Affichage des nuages
    displayManager.drawScene(bob, scoreManager);  // Affichage de la scène du jeu
    displayManager.displayPlayerName(inputName);  // Affichage du nom du joueur

    // Gestion du mouvement du joueur (Bob)
    bob.moveManage(level.getBobInertia());  // Gestion de l'inertie du joueur
    bob.move(bob.speed);  // Déplacement du joueur en fonction de sa vitesse
    bob.limitPosition();  // Limitation de la position du joueur dans l'écran

    // Gestion des frappes (collisions, etc.)
    manageStrike.manageStrike(bob, scoreManager, level.getStrikeSpeed(), level.getNumber());

    // Si une frappe touche le joueur (Bob), on affiche le score
    if (strike != null && strike.hits(bob)) {
        displayManager.displayScore(scoreManager.getScore(), scoreManager.getHighScore());
    }

    // Affichage du nom du niveau actuel
    displayManager.displayLevelName(level.getName());
}

}
