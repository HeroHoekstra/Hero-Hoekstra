int total = 0;

void draw() {
  if (10000 >  millis()) {
    println(total);
  }
}

void keyPressed() {
  if (key == ' ') {
    total++;
  }  
}
