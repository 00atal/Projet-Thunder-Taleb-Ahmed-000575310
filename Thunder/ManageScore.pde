class ManageScore {
  int score;
  int highScore;

  ManageScore() {
    score = 0;
    highScore = 0;
  }

  void resetScore() {
    score = 0;
  }

  void setScore() {
    score++;
    if (score > highScore) {
      highScore = score;
    }
  }
  
  int getScore(){
    return score;
  }
  
  int getHighScore(){
    return highScore;
  }

  void display() {
    fill(255);
    textSize(24);
    text("Score : " + score, 10, 30);
    text("High Score : " + highScore, 10, 60);
  }
}
