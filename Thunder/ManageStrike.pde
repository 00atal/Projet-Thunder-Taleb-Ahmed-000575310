class ManageStrike {
  Strike strike = null;
  int delayBeforeNextStrike = 0;
  //Constructeur par defaut invisible car hérité de la class parent Object
  void manageStrike(Bob bob, ManageScore scoreManager) {
    if (strike != null) {
      strike.update();
      strike.display();
      
      if (strike.hits(bob)) {
        scoreManager.resetScore();  
        strike = null;
        delayBeforeNextStrike = 60;
      } else if (strike.finished()) {
        scoreManager.setScore();
        strike = null;
        delayBeforeNextStrike = 60;
      }
    } else {
      if (delayBeforeNextStrike > 0) {
        delayBeforeNextStrike--;
      } else if (random(1) < 0.05) {
        strike = new Strike(random(width), 0, 10);
      }
    }
  }
}
