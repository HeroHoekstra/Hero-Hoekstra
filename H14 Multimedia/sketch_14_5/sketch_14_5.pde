PImage img;

int X = 0;
int Y = 0;

void setup() {
  size(500, 500);
   
  img = loadImage("death.jpg");
   
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 4; j++) {
      image(img, X, Y, 100, 125);
      Y += 125;
    }
    Y = 0;
    X += 100;
  }
}
