class ManageStrike {
  ArrayList<Strike> strikes;
  int delayBeforeNextStrike ;
  
  ManageStrike (){
   strikes = new ArrayList<Strike>();
   delayBeforeNextStrike = 0;
  }
  
void manageStrike(Bob bob, ManageScore scoreManager, int strikeSpeed) {
    if (strikes.size() < level.getMaxStrikes()) {
      if (delayBeforeNextStrike == 0) {
        strikes.add(new Strike(random(width), 0, strikeSpeed));
        delayBeforeNextStrike = 60;
      } else {
        delayBeforeNextStrike--;
      }
    }

    for (int i = 0; i < strikes.size(); i++) {
      Strike strike = strikes.get(i);
      strike.update();
      strike.display();

      if (strike.hits(bob)) {
        scoreManager.resetScore();
        strikes.remove(i);
        i--;
      } else if (strike.finished()) {
        scoreManager.setScore();
        strikes.remove(i);
        i--;
      }
    }
  }
  
void addStrikes(int nbStrikes) {
  strikes.clear();
  
  for (int i = 0; i < nbStrikes; i++) {
    strikes.add(new Strike(random(width), 0, level.getStrikeSpeed()));
  }
}

  
  int strikesSize(){
    return strikes.size();
  }
}
