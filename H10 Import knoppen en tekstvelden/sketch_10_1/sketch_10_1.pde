import controlP5.*;

ControlP5 cp;

Button butt1;
Button butt2;

void setup() {
  size(350, 200);
  
  cp = new ControlP5(this);
  
  butt1 = cp.addButton("Butt1")
    .setPosition(50, 50)
    .setSize(100, 100)
    .setCaptionLabel("Klik mij!");
    
  butt2 = cp.addButton("Butt2")
    .setPosition(200, 50)
    .setSize(100, 100)
    .setCaptionLabel("Klik mij!");    
}

void draw() {
  
}

void Butt1() {
  println("Helaas fout!");
}

void Butt2() {
  println("Goed Gedaan!");
}
