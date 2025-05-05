class Leaderboard {
  ArrayList<String> scores;
  String filename;

  Leaderboard(String filename) {
    this.scores = new ArrayList<String>(); // Initialiser la liste des scores
    this.filename = filename; // Le nom du fichier pour stocker ou charger les scores
  }

  void addScore(String playerName, String lvl, String dateHour,int score ) {
    scores.add(new String (playerName));
    scores.add(new String (lvl));
    scores.add(new String (dateHour));
    scores.add(new String (""+score));
    saveScore();
  }
void saveScore() {
  orderScore();
  // Lire les anciennes lignes du fichier s'il existe
  String[] oldLines;
  try {
    oldLines = loadStrings(filename);
  } catch (Exception e) {
    oldLines = new String[0]; // Si le fichier n'existe pas encore
  }

  // Construire la nouvelle entrée (la dernière ajoutée à scores[])
  int n = scores.size();
  String playerName = scores.get(n - 4);
  String lvl = scores.get(n - 3);
  String dateHour = scores.get(n - 2);
  String score = scores.get(n - 1);
  String newLine = playerName + "," + lvl + "," + dateHour + "," + score + ";";

  // Créer un nouveau tableau avec ancien + nouveau
  String[] allLines = new String[oldLines.length + 1];
  for (int i = 0; i < oldLines.length; i++) {
    allLines[i] = oldLines[i];
  }
  allLines[oldLines.length] = newLine;

  // Réécrire le fichier avec toutes les lignes concaténées
  saveStrings(filename, allLines);
}



  void displayScores() {

  }
  
 
void orderScore() {
  // Créer une structure temporaire pour contenir chaque entrée de score
  ArrayList<String[]> scoreEntries = new ArrayList<>();

  // Parcourir la liste "scores" 4 par 4
  for (int i = 0; i < scores.size(); i += 4) {
    String playerName = scores.get(i);
    String lvl = scores.get(i + 1);
    String dateHour = scores.get(i + 2);
    String scoreStr = scores.get(i + 3);
    int score = Integer.parseInt(scoreStr);

    scoreEntries.add(new String[]{playerName, lvl, dateHour, String.valueOf(score)});
  }

  // Trier les entrées par score décroissant
  scoreEntries.sort((a, b) -> Integer.parseInt(b[3]) - Integer.parseInt(a[3]));

  // Réinitialiser la liste scores et la remplir avec les entrées triées
  scores.clear();
  for (String[] entry : scoreEntries) {
    scores.add(entry[0]); // playerName
    scores.add(entry[1]); // lvl
    scores.add(entry[2]); // dateHour
    scores.add(entry[3]); // score
  }
}








}
