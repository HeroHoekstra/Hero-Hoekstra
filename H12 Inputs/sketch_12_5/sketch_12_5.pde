boolean pushed = false;

int posX1 = 0;
int posY1 = 0;
int posX2 = 0;
int posY2 = 0;

void setup() {
  size(500, 500);
  background(255, 255, 255);
}

void draw() {
  if (pushed == true) {
    posX1 = mouseX;
    posY1 = mouseY;
  } else if (pushed == false) {
    posX2 = posX1;
    posY2 = posY1;
  }
  
  line(posX1, posY1, posX2, posY2);
  
  println(posX1, posY2, posX2, posY2);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    pushed = true;
  }
}
void mouseReleased() {
  if (mouseButton == LEFT) {
    pushed = false;
  }
}
