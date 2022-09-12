PImage img;

void setup() {  
  size(500, 500);
  
  img = loadImage("loss.jpg");
  
  image(img, 0, 0, width, height);
}
