int x1 = 225; int y1 = 250; int w1 = 50; int h1 = 250; int w2 = 100; int y2 = 250;

void setup() {
  size(500, 500); 
  //bos ig
  boom(x1, y1, w1, h1, w2, y2);
  boom(x1 / 2, y1, w1, h1, w2, y2 / 2);
  boom(x1 / 8, y1, w1, h1, w2, y2 / 4);
  boom(x1 * 2, y1, w1, h1, w2, y2 * 2);
  boom(x1 + 100, y1, w1, h1, w2, y2 + 100);
}

void boom(int x1, int y1, int w1, int h1, int w2, int y2) {
  fill(114, 92, 66);
  rect(x1, y1, w1, h1);
  fill(66, 105, 47);
  ellipse(x1 - 30, y1 - 50, w2 / 1.5, w2 / 1.5);
  ellipse(x1 + 75, y1 - 50, w2 / 1.5, w2 / 1.5);
  ellipse(x1 - 30, y1 - 10, w2, w2);
  ellipse(x1 + 75, y1 - 10, w2, w2);
  ellipse(y2, y1 - 100, w2, w2);
  ellipse(y2, y1 - 20, w2, w2);
}
