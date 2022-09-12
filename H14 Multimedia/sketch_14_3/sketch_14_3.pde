import processing.sound.*;

SoundFile file;

void setup() {
  file = new SoundFile(this, "noise.wav");
  file.play();
}      
