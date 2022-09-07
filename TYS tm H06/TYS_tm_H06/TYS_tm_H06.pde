int leeftijd = 69;
//in kilo
float gewicht = 60;
//in meter
float lengte = 1.77;
float BMI;

int r = 0;
int g = 0;
int b = 0;

size(435, 270);
background(255, 255, 255);

BMI = gewicht / sq(1.64);

if (leeftijd <= 69) {
  if (BMI < 18.5) {
    r = 255;
    g = 165;
    b = 0;
  } else if (BMI >= 18.5 && BMI < 25) {
    r = 50;
    g = 205;
    b = 50;
  } else if (BMI >= 25 && BMI < 30) {
    r = 255;
    g = 140;
    b = 0;
  } else {
    r = 210;
    g = 43;
    b = 43;
  }
} else {
  if (BMI < 22) {
    r = 255;
    g = 165;
    b = 0;
  } else if (BMI >= 22 && BMI < 28) {
    r = 50;
    g = 205;
    b = 50;
  } else if (BMI >= 28 && BMI < 30) {
    r = 255;
    g = 140;
    b = 0;
  } else {
    r = 210;
    g = 43;
    b = 43;
  }
}

BMI *= 10;
BMI = (int) BMI;
BMI /= 10;
textSize(25);
fill(r, g, b);
text("Jouw BMI is " + BMI, 235, 140);

fill(0, 0, 0);
textSize(16);
text("Leeftijd: " + leeftijd, 40, 60);
text("Gewicht (in kilo): " + gewicht, 40, 140);
text("Lengte (in meter): " + lengte, 40, 220);

noFill();
rect(30, 30, 175, 50);
rect(30, 110, 175, 50);
rect(30, 190, 175, 50);

noStroke();
fill(255, 165, 0);
rect(235, 150, 15, 15);

fill(50, 205, 50);
rect(235, 170, 15, 15);

fill(255, 140, 0);
rect(235, 190, 15, 15);

fill(210, 43, 43);
rect(235, 210, 15, 15);

textSize(15);
fill(0, 0, 0);
text("Ondergewicht", 255, 163);
text("Gezond Gewicht", 255, 183);
text("Overgewicht", 255, 203);
text("Zwaar Overgewicht", 255, 223);
