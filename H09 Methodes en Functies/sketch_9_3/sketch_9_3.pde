float gem;

void setup() {
  gem = gemiddeld(6, 17);
  println(gem);
}

float gemiddeld(int cijfer1, int cijfer2) {
  int gemiddelde = (cijfer1 + cijfer2) / 2;
  return gemiddelde;
}
