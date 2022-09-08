import controlP5.*;

float prijs = 1772;
float prijsIBTW;

ControlP5 cp;

Button butt;

void setup() {
  size(250, 175);
  background(255, 255, 255);
  cp = new ControlP5(this);
  
  butt = cp.addButton("ass")
    .setCaptionLabel("Win een prijs")
    .setPosition(50, 50)
    .setSize(150, 50)
    .setColorLabel(color(0, 255, 0)); 
}

void draw() {

}

void ass() {
  prijsIBTW = prijs * 1.21;
  
  fill(0, 0, 0);  
  text("Prijs (exclusief btw): €" + prijs, 50, 110);
  
  textSize(20);
  text("Prijs: €" + prijsIBTW, 50, 130);
}
