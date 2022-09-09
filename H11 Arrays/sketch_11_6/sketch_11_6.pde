int[] cijfers = {13, 73, 7, 26, 85, 24, 9, 13, 86, 75};

void setup() {
  for (int i = 0; i < cijfers.length; i++) {
    for (int j = 0; j < cijfers.length; i++) {
      if (cijfers[i] == cijfers[j]) {
        println(cijfers[i]);
      }
    }
  }
}
