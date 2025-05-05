class ManageDisplay {
  // Couleur de fond de la scène
  color bgColor;


  // Constructeur : initialise la couleur de fond
  ManageDisplay() {
    bgColor = color(169, 169, 169); 
  }

  // Réinitialise la couleur de fond
  void resetBackground() {
    bgColor = color(169, 169, 169);
  }

  // Affiche la scène complète avec Bob, le sol, les nuages et le score
  void drawScene(Bob bob, ManageScore scoreManager) {
    background(bgColor);
    drawGround();       // Affiche le sol
    drawClouds();       // Affiche les nuages
    bob.display();      // Affiche le personnage Bob
    scoreManager.display(); // Affiche les scores
  }

  // Dessine le sol en bas de l'écran
  void drawGround() {
    fill(0, 150, 0); 
    noStroke();
    rect(0, height - 65, width, 65);
  }

  // Dessine plusieurs nuages à l'écran
  void drawClouds() {
    fill(100); 
    noStroke();
    ellipse(150, 100, 120, 60); 
    ellipse(300, 120, 150, 70);
    ellipse(500, 80, 100, 50);
    ellipse(700, 100, 130, 65);
    ellipse(0, 0, 120, 200); 
    ellipse(200, 0, 300, 200);
    ellipse(500, 0, 350, 150);
    ellipse(700, 0, 250, 165);
    ellipse(400, 80, 150, 65);
  }

  // Affiche le score actuel et le meilleur score
  void displayScore(int score, int highScore) {
    fill(255);
    textSize(24);
    text("Score : " + score, 10, 30);
    text("High Score : " + highScore, 10, 60);
  }

  // Affiche le nom du niveau actuel
  void displayLevelName(String levelName) {
    fill(255);
    textSize(24);
    text("Level: " + levelName, 10, 90);
  }

  // Affiche le nom du joueur
  void displayPlayerName(String playerName) {
    fill(255);
    textSize(24);
    text("Player: " + playerName, 10, 120);
  }

  // Fonction prévue pour dessiner les meilleurs scores (à implémenter)

  void drawHighScoceOrder() {
  background(0);
  fill(255);
  textSize(28);
  textAlign(CENTER);
  text("TOP 10 SCORES", width / 2, 50);
  textSize(18);
  
  String[] lines;
  try {
    lines = loadStrings("LeaderScore.txt");
  } catch (Exception e) {
    text("Aucun score disponible", width / 2, height / 2);
    return;
  }

  // Liste pour stocker les entrées sous forme [nom, level, date, score]
  ArrayList<String[]> entries = new ArrayList<String[]>();

  for (String line : lines) {
    line = line.trim();
    if (line.isEmpty()) continue;
    if (line.endsWith(";")) line = line.substring(0, line.length() - 1);
    
    String[] parts = line.split(",");
    if (parts.length == 4) {
      entries.add(parts);
    }
  }

  // Trier par score décroissant (partie 3)
  entries.sort((a, b) -> Integer.parseInt(b[3]) - Integer.parseInt(a[3]));

  // Afficher les 10 premiers
  int maxToShow = min(10, entries.size());
  for (int i = 0; i < maxToShow; i++) {
    String[] entry = entries.get(i);
    String name = entry[0];
    String lvl = entry[1];
    String date = entry[2];
    String score = entry[3];

    String display = (i + 1) + ". " + name + " | " + lvl + " | " + date + " | Score: " + score;
    text(display, width / 2, 100 + i * 30);
  }

  textSize(16);
  text("Appuie sur 'B' pour retourner au jeu", width / 2, height - 30);
  }
  
    void showNameScreen(String inputName) {
    fill(0);
    textSize(24);
    textAlign(LEFT);
    text("Entrez votre nom et appuyez sur Entrée :", 100, height / 2 - 40);
    text(inputName + "|", 100, height / 2);
  }
}
