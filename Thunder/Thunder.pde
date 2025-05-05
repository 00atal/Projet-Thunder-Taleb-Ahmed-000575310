// Déclaration des variables globales du jeu
Bob bob;// Joueur principal
ManageStrike manageStrike;// Gestion des éclairs
Level level;// Niveau actuel
Strike strike = null; // Éclair courant qui pourrait toucher Bob
Leaderboard lb; // Tableau des scores
ManageDisplay displayManager=new ManageDisplay();// Gestion de l'affichage
ManageScore scoreManager;// Gestion du score
GameManager gm = new GameManager();// Gestion globale du jeu (logique et événements)
boolean firstMove = false;// Indique si le joueur a effectué son premier mouvement
int delayBeforeNextStrike = 0;// Délai avant l'apparition d'un nouvel éclair
boolean isPaused = false;// Indique si le jeu est en pause
boolean isNameScreen = true;// Indique si l'écran de saisie du nom est affiché
String inputName = "";//Chaîne de caractères contenant le nom du joueur
// Fonction de configuration initiale (exécutée une seule fois au démarrage)
void setup() {
  size(800, 600);// Définit la taille de la fenêtre du jeu
}
// Fonction appelée en boucle à chaque frame (mise à jour de l'écran)
void draw() {
  gm.updateGameScreen();// Mise à jour de l'affichage en fonction de l'état du jeu
}
// Fonction appelée à chaque pression de touche
void keyPressed() {
  gm.keyP();// Gère les actions clavier (choix de niveau, pause, saisie nom, etc.)
}
