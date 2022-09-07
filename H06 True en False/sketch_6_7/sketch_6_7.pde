float cijfer = 5.8;
float cijferAnderVak = 8.0;
boolean diploma = false;
boolean vrijstelling = false;

if(cijfer >= 5.5){
    diploma = true;
} else if (cijferAnderVak >= 8.0){
  vrijstelling = true;
}
  

if(diploma || vrijstelling){
    println("Gefeliciteerd");
}
