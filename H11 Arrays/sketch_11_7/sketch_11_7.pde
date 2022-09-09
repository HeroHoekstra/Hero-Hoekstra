import controlP5.*;

String[] names = new String[10];
int total;

ControlP5 cp;

Button enter;
Textfield tekst;

void setup() {
  size(250, 250);
  
  cp = new ControlP5(this);
  
  tekst = cp.addTextfield("Tekst")
    .setSize(150, 30)
    .setPosition(25, 25)
    .setCaptionLabel("Names")
    .setColorLabel(color(0, 255, 0));
  
  enter = cp.addButton("Enter")
    .setSize(30, 30)
    .setPosition(195, 25)
    .setCaptionLabel("Enter")
    .setColorLabel(color(0, 255, 0));
}

void draw() {
  background(255, 255, 255);
  fill(0, 0, 0);
  textSize(16);
  
  if (total == 10) {
    text(names[0], 25, 85);
    text(names[1], 25, 100);
    text(names[2], 25, 115);
    text(names[3], 25, 130);
    text(names[4], 25, 145);
    text(names[5], 25, 160);
    text(names[6], 25, 175);
    text(names[7], 25, 190);
    text(names[8], 25, 205);
    text(names[9], 25, 220);
  } 
}

void Enter() {
  names[total] = tekst.getText();
  
  total++;
}
