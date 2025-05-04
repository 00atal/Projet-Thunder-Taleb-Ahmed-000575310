class ManageStrike {
  Strike strike ;
  int delayBeforeNextStrike ;
  
  ManageStrike (){
   strike = null;
   delayBeforeNextStrike = 0;
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
  
}
