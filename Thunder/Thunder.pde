Bob bob;
ManageStrike manageStrike;
Level level;
Strike strike = null;
boolean firstMove = false;
ManageDisplay displayManager;
ManageScore scoreManager;
int delayBeforeNextStrike = 0;
Leaderboard lb;
boolean isPaused = false;
boolean isNameScreen = true;
String inputName = "";

void setup() {
  size(800, 600);
}

void draw() {
  background(255);

  // Écran de saisie du nom
  if (isNameScreen) {
    showNameScreen();
    return;
  }

  // Si le jeu est en pause, on affiche les scores
  if (isPaused) {
    displayManager.drawHighScoceOrder();
    return;
  }

  // Partie du jeu principale
  displayManager.drawClouds();
  displayManager.drawScene(bob, scoreManager);
  displayManager.displayPlayerName(inputName);
  bob.moveManage(level.getBobInertia());
  bob.move(bob.speed);
  bob.limitPosition();
  manageStrike.manageStrike(bob, scoreManager, level.getStrikeSpeed(), level.getNumber());

  if (strike != null && strike.hits(bob)) {
    displayManager.displayScore(scoreManager.getScore(), scoreManager.getHighScore());
  }

  displayManager.displayLevelName(level.getName());
}



void showNameScreen() {
  fill(0);
  textSize(24);
  textAlign(LEFT);
  text("Entrez votre nom et appuyez sur Entrée :", 100, height / 2 - 40);
  text(inputName + "|", 100, height / 2);
}

void keyPressed() {
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

  lb= new Leaderboard("LeaderScore.txt");
}
