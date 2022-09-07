int cubeX = -50;
int cubeY = -50;

size(500, 500);
background(255, 255);

for (int i = 0; i < 10; i++) {
  cubeX += 50;
  cubeY += 50;
  
  rect(cubeX, cubeY, 50, 50);
}
