import controlP5.*;

ControlP5 cp;
Textfield textInput;
Button butt;

void setup() {
  size(255, 100);
  
  cp = new ControlP5(this);
  
  textInput = cp.addTextfield("TextInput1")
    .setPosition(25, 25)
    .setSize(150, 40)
    .setCaptionLabel("Naam")
    .setColorLabel(color(0, 0, 0));
  
  butt = cp.addButton("Butt")
    .setCaptionLabel("Enter")
    .setSize(50, 40)
    .setPosition(180, 25);
}

void draw() {

}

void Butt() {
  println("Hoi mijn naam is: " + textInput.getText());
}
