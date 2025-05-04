class Leaderboard {
  HashMap<String, Integer> scores;
  String filename;

  Leaderboard(String filename) {
    scores = new HashMap<String, Integer>();
    this.filename = filename; 
  }

  void addScore(String playerName, int score) {
    scores.add(new String (playerName));
    scores.add(new String (score));

    if (scores.size() > 10) {
      scores.remove(scores.size() - 1); 
    }
    saveScores();
  }

  void displayScores() {

  }
  
    void saveScores() {
    
  }
}
