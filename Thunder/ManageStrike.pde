class ManageStrike {
  Strike strike ;
  int delayBeforeNextStrike ;
  Level level;
  //Constructeur par defaut invisible car hérité de la class parent Object
  ManageStrike (Level level){
   strike = null;
   delayBeforeNextStrike = 0;
   this.level=level;
  }
  void manageStrike(Bob bob, ManageScore scoreManager,int strikeSpeed) {
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
        strike = new Strike(random(width), 0, strikeSpeed);
      }
    }
  }
  void setLevel(Level newLevel) {
    this.level = newLevel;
  }
}
