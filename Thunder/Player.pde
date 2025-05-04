class Player {
  int playerNumber;
  String playerName;
  String playerFile;

  Player(String name) {
    this.playerName = name;
    this.playerNumber = getNextPlayerNumber();
    this.playerFile = "Player_" + playerNumber + ".txt";

    savePlayerFile();
  }
  
  int getCurrentPlayer(){
    String[] lines = loadStrings("Player.txt");
      if (lines != null && lines.length > 0) {
    return int(trim(lines[0]));  // Convertit la première ligne en int
  } else {
    return 0;  // Valeur par défaut si le fichier est vide ou inexistant
  }
  }
  
  int getNextPlayerNumber() {
    int number = 1;
    String[] lines = loadStrings("Player.txt");

    if (lines != null && lines.length > 0) {
      try {
        number = Integer.parseInt(lines[0].trim()) + 1;
      } catch (NumberFormatException e) {
        println("Erreur de lecture du numéro dans Player.txt");
      }
    }

    // Sauvegarder le nouveau numéro dans Player.txt
    saveStrings("Player.txt", new String[]{str(number)});
    return number;
  }

  void savePlayerFile() {
    String[] content = {
      "Nom du joueur : " + playerName+
      " Numéro du joueur : " + playerNumber
    };
    saveStrings(playerFile, content);
    println("Fichier créé : " + playerFile);
  }
}
