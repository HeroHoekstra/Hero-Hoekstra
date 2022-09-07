float cijfer = 5.7;
boolean diploma = false;
boolean cumlaude = false;

if(cijfer >= 5.5){
    diploma = true;
} else if (cijfer >= 8) {
  cumlaude = true;
}

if(diploma || cumlaude){
    println("Gefeliciteerd");
}
