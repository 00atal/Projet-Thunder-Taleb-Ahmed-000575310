Bob bob;
ManageStrike manageStrike;
Level level;
Strike strike = null;
Leaderboard lb;
ManageDisplay displayManager=new ManageDisplay();
ManageScore scoreManager;
GameManager gm = new GameManager();
boolean firstMove = false;
int delayBeforeNextStrike = 0;
boolean isPaused = false;
boolean isNameScreen = true;
String inputName = "";

void setup() {
  size(800, 600);
}
void draw() {
  gm.updateGameScreen();
}
void keyPressed() {
  gm.keyP();
}
