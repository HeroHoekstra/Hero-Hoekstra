import controlP5.*;

float totaal;
float cijfer1;
float cijfer2;

ControlP5 cp;

Button add;
Button minus;
Button devide;
Button times;
Textfield text1;
Textfield text2;

void setup() {
  size(500, 500);
  fill(0, 0, 0);
  cp = new ControlP5(this);
  
  text1 = cp.addTextfield("Text1")
    .setSize(100, 25)
    .setPosition(25, 25);
    
  text2 = cp.addTextfield("Text2")
    .setSize(100, 25)
    .setPosition(135, 25);
    
  add = cp.addButton("Add")
    .setSize(25, 25)
    .setPosition(245, 25)
    .setCaptionLabel(" +");
  minus = cp.addButton("Minus")
    .setSize(25, 25)
    .setPosition(280, 25)
    .setCaptionLabel(" -");
  times = cp.addButton("Times")
    .setSize(25, 25)
    .setPosition(315, 25)
    .setCaptionLabel(" *");
  devide = cp.addButton("Devide")
    .setSize(25, 25)
    .setPosition(350, 25)
    .setCaptionLabel(" /");
}

void draw() {
  background(255, 255, 255);
  text("Totaal: " + totaal, 25, 85);
}

void Add() {
  cijfer1 = float(text1.getText());
  cijfer2 = float(text2.getText());
  
  totaal = cijfer1 + cijfer2;
}
void Minus() {
  cijfer1 = float(text1.getText());
  cijfer2 = float(text2.getText());
  
  totaal = cijfer1 - cijfer2;
}
void Times() {
  cijfer1 = float(text1.getText());
  cijfer2 = float(text2.getText());
  
  totaal = cijfer1 * cijfer2;
}
void Devide() {
  cijfer1 = float(text1.getText());
  cijfer2 = float(text2.getText());
  
  totaal = cijfer1 / cijfer2;
}
