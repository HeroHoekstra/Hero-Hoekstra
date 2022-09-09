boolean stop = false;

void setup() {
  size(150, 50);
}

void draw() {
  int mil = 0 + millis();
  int sec = mil / 1000;
  int min = sec / 60;
  int uur = min / 60;
  
  background(255, 255, 255);
  
  for (int i = 1000; i < mil;) {
    mil -= 1000;
    sec++;
  }
  for (int j = 60; j < sec;) {
    sec -= 60;
    min++;
  }
  for (int k = 60; k < min;) {
    min -= 60;
    uur++;
  }
  
  
  while (stop == true) {
    mil *= 0;
  }
  
  fill(0, 0, 0);
  text(uur + ", " + min + ", " + sec + "." + mil, 25, 25);
  text("Stop: q", 25, 35);
}

void keyPressed() {
  if (key == 'q') {
    stop = true;
  }
}
