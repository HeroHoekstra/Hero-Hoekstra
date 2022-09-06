size(1550, 500);
background(255, 255, 255);

//Lijn
fill(0, 0, 0);
line(50, 75, 500, 75);
text("Lijn", 275, 100);

//Rechthoek
noFill();
rect(50, 125, 450, 125);
text("Rechthoek", 250, 275);

//Gevulde rechthoek met ovaal
fill(255, 0, 255);
stroke(255, 0, 255);
rect(550, 125, 450, 125);
noFill();
stroke(0, 0, 0);
ellipse(775, 188, 450, 125);
fill(0, 0, 0);
text("Gevulde rechthoek met ovaal", 700, 275);

//Gevulde ovaal
fill(255, 0, 255);
stroke(255, 0, 255);
ellipse(775, 350, 450, 125);
fill(0, 0, 0);
text("gevulde ovaal", 750, 430);

//Cirkel
noFill();
stroke(0, 0, 0);
ellipse(1275, 350, 125, 125);
text("Cirkel", 1265, 430);

//Taartpunt met ovaal eromheen
ellipse(1275, 188, 450, 125);
fill(255, 0, 255);
stroke(255, 0, 255);
arc(1275, 188, 450, 125, PI*1.75, 2*PI);
fill(0, 0, 0);
text("Taartpunt met ovaal eromheen", 1200, 275);

//Afgeronde rechthoek
noFill();
stroke(0, 0, 0);
arc(90, 338, 75, 75, PI, PI*1.5);
arc(450, 338, 75, 75, PI*1.5, PI*2);
arc(90, 375, 75, 75, PI*0.5, PI);
arc(450, 375, 75, 75, 0, PI*0.5);
line(90, 300, 450, 300);
line(90, 412, 450, 412);
line(52, 338, 52, 375);
line(487, 338, 487, 375);
text("Afgeronde rechthoek", 225, 430);
