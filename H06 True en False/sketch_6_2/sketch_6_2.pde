//Als het kouder is dan 0 graden, dan kan je schaatsen.
int tempratuur = -2;
if (tempratuur < 0) {
  println("" + true);
}

//Ik mag niet de gele sneeuw eten.
String sneeuw = "Wit";
if (sneeuw != "Geel") {
  println("" + true);
}

//Jantje mag van tafel, als hij vier of meer stukjes broccoli op heeft.
int jantje = 6;
if (jantje >= 4) {
  println("" + true);
}

//Als je jarig bent, krijg je cadeaus. 
String datum = "01-04";
String mijnVerjaardag = "01-04";
if (mijnVerjaardag == datum) {
  println("" + true);
}

//Als je 1.60m of kleiner bent, mag je gratis naar het toilet bij de bezinepomp.
double mijnLengte = 1.60;
if (mijnLengte <= 1.60) {
  println("" + true);
}

//Als je meer dan 10 seconde je mond kan houden, word ik gelukkig.
int mijnMondGehouden = 15;
if(mijnMondGehouden > 10){
  println("" + true);
}
