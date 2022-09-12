import processing.sound.*;
import controlP5.*;

ControlP5 cp;

SoundFile file;
Button butt;

void setup() {
  size(300, 150);
  
  cp = new ControlP5(this);
  
  butt = cp.addButton("Butt1")
    .setSize(50, 50)
    .setPosition(50, 50)
    .setCaptionLabel("Sound 1");

  butt = cp.addButton("Butt2")
    .setSize(50, 50)
    .setPosition(125, 50)
    .setCaptionLabel("Sound 2");

  butt = cp.addButton("Butt3")
    .setSize(50, 50)
    .setPosition(200, 50)
    .setCaptionLabel("Sound 3");
}

void draw() {

}

void Butt1() {
  file = new SoundFile(this, "my movie.mp3");
  file.play();
}

void Butt2() {
  file = new SoundFile(this, "noise.mp3");
  file.play();
}

void Butt3() {
  file = new SoundFile(this, "tbh creature.mp3");
  file.play();
}
