size(500, 500);
background(255, 255, 255);

int brickX = -50;
int brickY = 0;

fill(200, 85, 57);
for(int i = 0; i < 19; i++) {
  for(int j = 0; j < 9; j++) {
    rect(brickX, brickY, 50, 25);
    brickX += 50;
  }
  if (i % 2 == 0) {
    brickX = 25;
  } else {
    brickX = 50;
  }
  brickY += 25;
}
