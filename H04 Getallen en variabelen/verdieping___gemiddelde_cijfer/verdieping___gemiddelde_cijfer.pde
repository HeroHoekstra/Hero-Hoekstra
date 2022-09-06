float cijfer1 = 3.4;
float cijfer2 = 7.1;
float cijfer3 = 6.5;

float gemiddeld = (cijfer1 + cijfer2 + cijfer3) / 3;

gemiddeld *= 10;
gemiddeld = (int) gemiddeld;
gemiddeld /= 10;

println(gemiddeld);
