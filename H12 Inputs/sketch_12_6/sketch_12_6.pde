boolean X1 = false;
boolean Y1 = false;
boolean X2 = false;
boolean Y2 = false;

int posX = 250;
int posY = 250;

void setup() {
  size(500, 500);
}

void draw() {  
  background(255, 255, 255);
  
  if (X1 == true) {
    posX -= 10;
  }
  if (Y1 == true) {
    posY -= 10;
  }
  if (X2 == true) {
    posX += 10;
  }
  if (Y2 == true) {
    posY += 10;
  }
  
  rect(posX, posY, 25, 25);
  
  println(posX, posY);
}

void keyPressed() {
  if (keyCode == LEFT) {
    X1 = true;
  }
  if (keyCode == RIGHT) {
    X2 = true;
  }
  if (keyCode == UP) {
    Y1 = true;
  }
  if (keyCode == DOWN) {
    Y2 = true;
  }
}

void keyReleased() {
  if (keyCode == LEFT) {
    X1 = false;
  }
  if (keyCode == RIGHT) {
    X2 = false;
  }
  if (keyCode == UP) {
    Y1 = false;
  }
  if (keyCode == DOWN) {
    Y2 = false;
  }
} 
