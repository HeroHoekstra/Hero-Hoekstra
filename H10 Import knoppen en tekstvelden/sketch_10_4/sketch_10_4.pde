import controlP5.*;

int student = -1;
int ouder = -1;
int totaal = -2;

ControlP5 cp;

Button butt1;
Button butt2;

void setup() {
  size(500, 500);
  fill(0, 0, 0);
  
  cp = new ControlP5(this);
  
  butt1 = cp.addButton("ass1")
    .setSize(100, 50)
    .setPosition(25, 25)
    .setCaptionLabel("Studenten")
    .setColorLabel(color(0, 255, 0));
    
  butt2 = cp.addButton("ass2")
    .setSize(100, 50)
    .setPosition(150, 25)
    .setCaptionLabel("Ouders")
    .setColorLabel(color(0, 255, 0));
  
  ass1();
  ass2();
}

void draw() {
  background(255, 255, 255);
  text("Aantal studenten: " + student, 25, 100);
  text("Aantal ouders: " + ouder, 25, 125);
  text("Totaal: " + totaal, 25, 150);
}

void ass1() {
  student++;
  totaal++;
}

void ass2() {
  ouder++;
  totaal++;
}
