String[] names = {"Henk", "Gertruda", "Jan", "Bob"};

void setup() {
  for (int i = 0; i < names.length; i++) {
    if (names[i] == "Jan") {
      println("Jan zit op plek " + i + " in de array");
    }
  }
}
