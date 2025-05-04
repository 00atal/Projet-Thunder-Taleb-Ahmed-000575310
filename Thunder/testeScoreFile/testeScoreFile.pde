void setup() {
  size(600, 600);
  String[] lines = loadStrings("score.txt");
  println("There are " + lines.length + " lines.");
  printArray(lines);
}
