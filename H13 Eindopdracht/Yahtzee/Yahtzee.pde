//loads images
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage imgRoll;
PImage imgLock;

//ints and bools and stuff
int positionDice = 0;
int positionCard = 0;

int rectY = 55;
int onDiceRed = 255;
int onDiceWeight = 5;  
int onCardRed = 255;
int onCardWeight = 5;

String[] valsPlayer1 = {"", "", "", "", "", "", "", "", "", "", "", "", ""};
String[] valsPlayer2 = {"", "", "", "", "", "", "", "", "", "", "", "", ""};
int player1Total;
int player2Total;

boolean stopCal = false;
int[] dice = new int[5];

int[] numbers = {0, 0, 0, 0, 0, 0};

boolean[] deel1 = new boolean[6];
boolean[] deel2 = new boolean[6];

boolean[] lock = {false, false, false, false, false};

boolean[] place = new boolean[16];

boolean player1 = true;
boolean throwable = true;
int turn = 0;
boolean canTurn = true;
boolean onDice = true;

int total = dice[0] + dice[1] + dice[2] + dice[3] + dice[4];
int[] totalDeel1 = new int[6];

int endRound = 0;

void setup() {
  size(285, 420);
  
  roll();
  
  //loads images pt2 electric boogaloo
  img1 = loadImage("dice1.jpg");
  img2 = loadImage("dice2.jpg");
  img3 = loadImage("dice3.jpg");
  img4 = loadImage("dice4.jpg");
  img5 = loadImage("dice5.jpg");
  img6 = loadImage("dice6.jpg");
  imgRoll = loadImage("roll.jpg");
  imgLock = loadImage("lock.jpg");
}

void draw() {
  cal3OAK();
  cal4OAK();
  calFullHouse();
  calKS();
  calGS();
  calYahtzee();
  calDeel1();
  background(255, 255, 255); 
  
  //makes the boxes that contain the dices and things  
  drawDice();
  visualLoc();
  playerCardGenInfo();
  player1Card();
  player2Card();
  
  int rectX = 225;
  if (player1 == true) {rectX = 225;} else {rectX = 250;}
  noFill();
  stroke(onCardRed, 0, 0);
  strokeWeight(onCardWeight);
  rect(rectX, rectY, 25, 15);
  
  if (turn >= 3) {
    throwable = false;
  } 
  
  noFill();
  stroke(0, 0, 0);
  strokeWeight(1);
  rect(10, 10, 100, 310);
  rect(120, 10, 155, 370);
  if (endRound >= 13) {
    if (player1Total > player2Total) {
      background(255, 255, 255);
      textSize(25);
      text("Speler 1 heeft gewonnen!", 110, 100);
    } else if (player1Total < player2Total) {
      background(255, 255, 255);
      textSize(25);
      text("Speler 2 heeft gewonnen!", 110, 100);
    }
  }
}

//calculations
//calculate 3 of a kind
void cal3OAK() {
  int[] tur1 = new int [6];
  int[] amount = new int[6];
  int[] sortDice = new int[5];
  
  arrayCopy(dice, sortDice);
  
  sortDice = sort(sortDice);
   
  for (int i = 0; i < 5; i++) {
    switch(sortDice[i]) {
      case 1: amount[0]++; break;
      case 2: amount[1]++; break;
      case 3: amount[2]++; break;
      case 4: amount[3]++; break;
      case 5: amount[4]++; break;
      case 6: amount[5]++; break;
    }
  }
  for (int i = 0; i < 6; i++) {
    if (amount[i] >= 3) {
      tur1[i]++;
    }
  }
  int tur2 = tur1[0] + tur1[1] + tur1[2] + tur1[3] + tur1[4] + tur1[5];
  if (tur2 >= 1) {
    deel2[0] = true;
  } else {
    deel2[0] = false;
  }
}

//calculate carre
void cal4OAK() {
  int[] tur1 = new int [6];
  int[] amount = new int[6];
  int[] sortDice = new int[5];
  
  arrayCopy(dice, sortDice);
  
  sortDice = sort(sortDice);
   
  for (int i = 0; i < 5; i++) {
    switch(sortDice[i]) {
      case 1: amount[0]++; break;
      case 2: amount[1]++; break;
      case 3: amount[2]++; break;
      case 4: amount[3]++; break;
      case 5: amount[4]++; break;
      case 6: amount[5]++; break;
    }
  }
  for (int i = 0; i < 6; i++) {
    if (amount[i] >= 4) {
      tur1[i]++;
    }
  }
  int tur2 = tur1[0] + tur1[1] + tur1[2] + tur1[3] + tur1[4] + tur1[5];
  if (tur2 >= 1) {
    deel2[1] = true;
  } else {
    deel2[1] = false;
  }
}


//calculate full house
void calFullHouse() {
  int[] sortDice = new int[5];
  arrayCopy(dice, sortDice);
  
  sortDice = sort(sortDice);
  
  if ((sortDice[0] == sortDice[2] && sortDice[3] == sortDice[4] && sortDice[0] != sortDice[4]) || (sortDice[0] == sortDice[1] && sortDice[2] == sortDice[4] && sortDice[0] != sortDice[2])) {
    deel2[2] = true;
  } else {
    deel2[2] = false;
  }
}

boolean valueIsInArray(int v, int[] arr) {
  for (int i = 0; i < arr.length; i++) {
    if (v == arr[i]) {
      return true;
    }
  }
  return false;
}

//calculate small street
void calKS() {
  int a = 0;
  int b = 0;
  int c = 0;
  
  int[] sortDice = new int[5];
  int[] filtered = {};
  
  arrayCopy(dice, sortDice); 
  
  sortDice = sort(sortDice);
  
  for (int i = 0; i < sortDice.length; i++) {
    if (!valueIsInArray(sortDice[i], filtered)) {
      filtered = append(filtered, sortDice[i]);
    }
  }
  
  for (int i = 0; i < filtered.length;  i++) {
    if (filtered[i] == i + 1) {
      a++;
    }
  }
  for (int i = 0; i < filtered.length;  i++) {
    if (filtered[i] == i + 2) {
      b++;
    }
  }
  for (int i = 0; i < filtered.length;  i++) {
    if (filtered[i] == i + 3) {
      c++;
    }
  }
  
  if (a >= 4 || b >= 4 || c >= 4) {
    deel2[3] = true;
  } else {
    deel2[3] = false;
  }
}

//caLculate bEEEEg street
void calGS() {
  int a = 0;
  int b = 0;
  int[] sortDice = new int[5];
  arrayCopy(dice, sortDice);
  
  sortDice = sort(sortDice);
  
  if (sortDice[0] == 1) {
    for (int i = 0; i < 5; i++) {
      if (sortDice[i] == i + 1) {
        a++;
      }
    }
  }
  if (sortDice[0] == 2) {
    for (int i = 0; i < 5; i++) {
      if (sortDice[i] == i + 2) {
        b++;
      }
    }
  }
  
  if (a >= 5 || b >= 5) {
    deel2[4] = true;
  } else {
    deel2[4] = false;
  }
}

//calcuate yahtzee
void calYahtzee() {
  int[] sortDice = new int[5];
  arrayCopy(dice, sortDice);
  
  sortDice = sort(sortDice);
  
  if (sortDice[0] == sortDice[4]) {
    deel2[5] = true;
  } else {
    deel2[5] = false;
  }
  if (sortDice[0] == 0) {
    deel2[5] = false;
  }
}

//calculate singles
void calDeel1() {
  int[] sortDice = new int[5];
  arrayCopy(dice, sortDice);
  
  sortDice = sort(sortDice);

  if (stopCal == false) {
    for (int i = 0; i < 5; i++) {
      switch(sortDice[i]) {
        case 1: numbers[0]++; break;
        case 2: numbers[1]++; break;
        case 3: numbers[2]++; break;
        case 4: numbers[3]++; break;
        case 5: numbers[4]++; break;
        case 6: numbers[5]++; break;       
      }
    }
    stopCal = true;
  }

  for (int j = 0; j < 6; j++) {
    if (numbers[j] >= 1) {
      deel1[j] = true;
    } else {
      deel1[j] = false;
    }
  }
}

void reset() {
  for (int i = 0; i < 6; i++) {
    numbers[i] = 0;
  }
  for (int i = 0; i < 5; i++) {
    lock[i] = false;
    dice[i] = 0;
  }
  canTurn = false;
}

void keyPressed() {
  //is the player on the card or on the dice and move the correct one
  if (key == 'w' || key == 'W' || keyCode == UP) {
    if (onDice == true && positionDice > 0) {
      positionDice--;
    } 
    if (onDice == false && positionCard > 0) {
      positionCard--;
    }
  }
  if (key == 's' || key == 'S' || keyCode == DOWN) {
    if (onDice == true && positionDice < 4) {
      positionDice++;
    } 
    if (onDice == false && positionCard < 12) {
      positionCard++;
    }
  }
  
  //switches the players position from on dice to on cards and vice versa
  if (key == 'a' || key == 'A' || keyCode == LEFT) {
    onDice = true;
  } 
  if (key == 'd' || key == 'D' || keyCode == RIGHT) {
    onDice = false;
  }
  
  if (keyCode == ENTER) {
    if (onDice == true) {
      lock();
    } else {
      place();
      reset();      
      throwable = true;
      turn = 0;
      if (player1 == true) {
        player1 = false;
      } else {
        player1 = true;
      }
    }
  }
  
  if (key == ' ') {
    if (throwable == true) {
      roll();
    }
    turn++;
    stopCal = false;
    for (int i = 0; i < 6; i++) {
      numbers[i] = 0;
    }
    canTurn = true;
  }
}

void player1Card() {
  boolean bonus = false;
  int deel1 = 0;
  int deel2 = 0;
  for (int i = 0; i < 6; i++) {
    deel1 += int(valsPlayer1[i]);
  }
  for (int i = 6; i < 13; i++) {
    deel2 += int(valsPlayer1[i]);
  }
  int deel1Bonus = deel1;
  if (deel1 >= 63) {
    deel1Bonus += 35;
    text("35", 232, 172);
    bonus = true;
  }
  if (bonus == true) {
    deel1 -= 35;
  }
  player1Total = deel1Bonus + deel2;
  text(valsPlayer1[0], 232, 67);
  text(valsPlayer1[1], 232, 82);
  text(valsPlayer1[2], 232, 97);
  text(valsPlayer1[3], 232, 112);
  text(valsPlayer1[4], 232, 127);
  text(valsPlayer1[5], 232, 142);
  
  text(valsPlayer1[6], 232, 242);
  text(valsPlayer1[7], 232, 257);
  text(valsPlayer1[8], 232, 272);
  text(valsPlayer1[9], 232, 287);
  text(valsPlayer1[10], 232, 302);
  text(valsPlayer1[11], 232, 317);
  text(valsPlayer1[12], 232, 332);
  
  text(deel1, 232, 157);
  text(deel1Bonus, 232, 187);
  text(deel1Bonus, 232, 347);
  text(deel2, 232, 362);
  text(total, 232, 377);
}

void player2Card() {
  boolean bonus = false;
  int deel1 = 0;
  int deel2 = 0;
  for (int i = 0; i < 6; i++) {
    deel1 += int(valsPlayer2[i]);
  }
  for (int i = 6; i < 13; i++) {
    deel2 += int(valsPlayer2[i]);
  }
  int deel1Bonus = deel1;
  if (deel1 >= 63) {
    deel1Bonus += 35;
    text("35", 232, 172);
    bonus = true;
  }
  if (bonus == true) {
    deel1 -= 35;
  }
  player2Total = deel1Bonus + deel2;
  text(valsPlayer2[0], 257, 67);
  text(valsPlayer2[1], 257, 82);
  text(valsPlayer2[2], 257, 97);
  text(valsPlayer2[3], 257, 112);
  text(valsPlayer2[4], 257, 127);
  text(valsPlayer2[5], 257, 142);
  
  text(valsPlayer2[6], 257, 242);
  text(valsPlayer2[7], 257, 257);
  text(valsPlayer2[8], 257, 272);
  text(valsPlayer2[9], 257, 287);
  text(valsPlayer2[10], 257, 302);
  text(valsPlayer2[11], 257, 317);
  text(valsPlayer2[12], 257, 332);
  
  text(deel1, 257, 157);
  text(deel1Bonus, 257, 187);
  text(deel1Bonus, 257, 347);
  text(deel2, 257, 362);
  text(total, 257, 377);
}

//the generic info of the card
void playerCardGenInfo() {
  fill(0, 0, 0);
  stroke(0, 0, 0);
  strokeWeight(1);
  textSize(14);
  text("Player", 230, 30);
  
  textSize(11);
  //catogories
  //deel1
  text("Deel 1", 125, 52);
  text("Enen", 125, 67);
  text("Tweeën", 125, 82);
  text("Drieën", 125, 97);
  text("Vieren", 125, 112);
  text("Vijfen", 125, 127);
  text("Zessen", 125, 142);
  text("Totaal aantal punten*", 125, 157);
  text("Extra bonus**", 125, 172);
  text("Totaal", 125, 187);
  
  //deel2
  text("Deel 2", 125, 227);
  text("Three of a kind", 125, 242);
  text("Carré", 125, 257);
  text("Full house", 125, 272);
  text("Kleine straat", 125, 287);
  text("Grote straat", 125, 302);
  text("Yahtzee", 125, 317);
  text("Chance", 125, 332);
  text("Totaal, deel1", 125, 347);
  text("Totaal, deel2", 125, 362);
  text("Totaal", 125, 377);
  
  //spel
  text("1", 232, 52);
  text("2", 257, 52);
  
  //gen info
  text("*Het aantal punten zonder de bonus", 10, 395);
  text("**Je krijgt een bonus als deel 1 meer dan 63 is", 10, 410);
  
  //draws lines
  for (int i = 0; i < 11; i++) {
    line(120, i*15+40, 275, i*15+40);
  }
  for (int j = 0; j < 3; j++) {
    line(j*25+225, 40, j*25+225, 190);
  }
  
  for (int k = 0; k < 11; k++) {
    line(120, k*15+215, 275, k*15+215);
  }
  for (int l = 0; l < 3; l++) {
    line(l*25+225, 230, l*25+225, 380);
  }
}

void place() {
  if (player1 == true) {
    if (positionCard == 0 && deel1[0] == true) {valsPlayer1[0] = str(numbers[0]);} else if (positionCard == 0 && deel1[0] == false) {valsPlayer1[0] = "X";}
    if (positionCard == 1 && deel1[1] == true) {valsPlayer1[1] = str(numbers[1] * 2);} else if (positionCard == 1 && deel1[1] == false) {valsPlayer1[1] = "X";}
    if (positionCard == 2 && deel1[2] == true) {valsPlayer1[2] = str(numbers[2] * 3);} else if (positionCard == 2 && deel1[2] == false) {valsPlayer1[2] = "X";}
    if (positionCard == 3 && deel1[3] == true) {valsPlayer1[3] = str(numbers[3] * 4);} else if (positionCard == 3 && deel1[3] == false) {valsPlayer1[3] = "X";}
    if (positionCard == 4 && deel1[4] == true) {valsPlayer1[4] = str(numbers[4] * 5);} else if (positionCard == 4 && deel1[4] == false) {valsPlayer1[4] = "X";}
    if (positionCard == 5 && deel1[5] == true) {valsPlayer1[5] = str(numbers[5] * 6);} else if (positionCard == 5 && deel1[5] == false) {valsPlayer1[5] = "X";}    
    if (positionCard == 6 && deel2[0] == true) {valsPlayer1[6] = str(dice[0] + dice[1] + dice[2] + dice[3] + dice[4]);} else if (positionCard == 6 && deel2[0] == false) {valsPlayer1[6] = "X";}
    if (positionCard == 7 && deel2[1] == true) {valsPlayer1[7] = str(dice[0] + dice[1] + dice[2] + dice[3] + dice[4]);} else if (positionCard == 7 && deel2[1] == false) {valsPlayer1[7] = "X";}
    if (positionCard == 8 && deel2[2] == true) {valsPlayer1[8] = "25";} else if (positionCard == 8 && deel1[2] == false) {valsPlayer1[8] = "X";}
    if (positionCard == 9 && deel2[3] == true) {valsPlayer1[9] = "30";} else if (positionCard == 9 && deel1[3] == false) {valsPlayer1[9] = "X";}
    if (positionCard == 10 && deel2[4] == true) {valsPlayer1[10] = "40";} else if (positionCard == 10 && deel1[4] == false) {valsPlayer1[10] = "X";}
    if (positionCard == 11 && deel2[5] == true) {valsPlayer1[11] = "50";} else if (positionCard == 11 && deel1[5] == false) {valsPlayer1[11] = "X";} 
    if (positionCard == 12) {valsPlayer1[12] = str(dice[0] + dice[1] + dice[2] + dice[3] + dice[4]);}
  } else {
    if (positionCard == 0 && deel1[0] == true) {valsPlayer2[0] = str(numbers[0]);} else if (positionCard == 0 && deel1[0] == false) {valsPlayer2[0] = "X";}
    if (positionCard == 1 && deel1[1] == true) {valsPlayer2[1] = str(numbers[1] * 2);} else if (positionCard == 1 && deel1[1] == false) {valsPlayer2[1] = "X";}
    if (positionCard == 2 && deel1[2] == true) {valsPlayer2[2] = str(numbers[2] * 3);} else if (positionCard == 2 && deel1[2] == false) {valsPlayer2[2] = "X";}
    if (positionCard == 3 && deel1[3] == true) {valsPlayer2[3] = str(numbers[3] * 4);} else if (positionCard == 3 && deel1[3] == false) {valsPlayer2[3] = "X";}
    if (positionCard == 4 && deel1[4] == true) {valsPlayer2[4] = str(numbers[4] * 5);} else if (positionCard == 4 && deel1[4] == false) {valsPlayer2[4] = "X";}
    if (positionCard == 5 && deel1[5] == true) {valsPlayer2[5] = str(numbers[5] * 6);} else if (positionCard == 5 && deel1[5] == false) {valsPlayer2[5] = "X";}    
    if (positionCard == 6 && deel2[0] == true) {valsPlayer2[6] = str(dice[0] + dice[1] + dice[2] + dice[3] + dice[4]);} else if (positionCard == 6 && deel2[0] == false) {valsPlayer2[6] = "X";}
    if (positionCard == 7 && deel2[1] == true) {valsPlayer2[7] = str(dice[0] + dice[1] + dice[2] + dice[3] + dice[4]);} else if (positionCard == 7 && deel2[1] == false) {valsPlayer2[7] = "X";}
    if (positionCard == 8 && deel2[2] == true) {valsPlayer2[8] = "25";} else if (positionCard == 8 && deel2[2] == false) {valsPlayer2[8] = "X";}
    if (positionCard == 9 && deel2[3] == true) {valsPlayer2[9] = "30";} else if (positionCard == 9 && deel2[3] == false) {valsPlayer2[9] = "X";}
    if (positionCard == 10 && deel2[4] == true) {valsPlayer2[10] = "40";} else if (positionCard == 10 && deel2[4] == false) {valsPlayer2[10] = "X";}
    if (positionCard == 11 && deel2[5] == true) {valsPlayer2[11] = "50";} else if (positionCard == 11 && deel2[5] == false) {valsPlayer2[11] = "X";} 
    if (positionCard == 12) {valsPlayer2[12] = str(dice[0] + dice[1] + dice[2] + dice[3] + dice[4]);}
    endRound++;
  }
}

//rolls a random number unless it's locked
void roll() {
  if (lock[0] == false) {
    dice[0] = floor(random(1, 7));
  }
  if (lock[1] == false) {
    dice[1] = floor(random(1, 7));
  }
  if (lock[2] == false) {
    dice[2] = floor(random(1, 7));
  }
  if (lock[3] == false) {
    dice[3] = floor(random(1, 7));
  }
  if (lock[4] == false) {
    dice[4] = floor(random(1, 7));
  }
}

//locks the value when enter is pressed
void lock() {
  switch(positionDice) {
    case 0: if (lock[0] == false) {lock[0] = true;} else {lock[0] = false;}break;
    case 1: if (lock[1] == false) {lock[1] = true;} else {lock[1] = false;}break;
    case 2: if (lock[2] == false) {lock[2] = true;} else {lock[2] = false;}break;
    case 3: if (lock[3] == false) {lock[3] = true;} else {lock[3] = false;}break;
    case 4: if (lock[4] == false) {lock[4] = true;} else {lock[4] = false;}break;
  }
}

//visuals
void visualLoc() {
  noFill();
  stroke(onDiceRed, 0, 0); 
  strokeWeight(onDiceWeight);
  switch(positionDice) {
    case 0: rect(22, 20, 50, 50); break;
    case 1: rect(22, 80, 50, 50); break;
    case 2: rect(22, 140, 50, 50); break;
    case 3: rect(22, 200, 50, 50); break;
    case 4: rect(22, 260, 50, 50); break;
  }
  
  switch(positionCard) {
    case 0: rectY = 55; break; case 1: rectY = 70; break; case 2: rectY = 85; break;
    case 3: rectY = 100; break; case 4: rectY = 115; break; case 5: rectY = 130; break;
    case 6: rectY = 230; break; case 7: rectY = 245; break; case 8: rectY = 260; break; 
    case 9: rectY = 275; break; case 10: rectY = 290; break; case 11: rectY = 305; break; 
    case 12: rectY = 320; break;
  }
  
  //makes the lock appear with magic
  if (lock[0] == true) {image(imgLock, 77, 35, 25, 25);}
  if (lock[1] == true) {image(imgLock, 77, 95, 25, 25);}
  if (lock[2] == true) {image(imgLock, 77, 155, 25, 25);}
  if (lock[3] == true) {image(imgLock, 77, 215, 25, 25);}
  if (lock[4] == true) {image(imgLock, 77, 275, 25, 25);}
  
  //decides if the dice is worthy enough to be red and bold
  if (onDice == true) {
    onDiceRed = 255;
    onDiceWeight = 5;
    
    onCardRed = 0;
    onCardWeight = 2;
  } else {
    onDiceRed = 0;
    onDiceWeight = 2;
    
    onCardRed = 255;
    onCardWeight = 5;
  }
  
  fill(0, 255, 0, 50);
  noStroke();
  if (player1 == true) {
    if (deel1[0] == true && valsPlayer1[0] == "") {rect(225, 55, 25, 15);}
    if (deel1[1] == true && valsPlayer1[1] == "") {rect(225, 70, 25, 15);}
    if (deel1[2] == true && valsPlayer1[2] == "") {rect(225, 85, 25, 15);}
    if (deel1[3] == true && valsPlayer1[3] == "") {rect(225, 100, 25, 15);}
    if (deel1[4] == true && valsPlayer1[4] == "") {rect(225, 115, 25, 15);}
    if (deel1[5] == true && valsPlayer1[5] == "") {rect(225, 130, 25, 15);}
    
    if (deel2[0] == true && valsPlayer1[6] == "") {rect(225, 230, 25, 15);}
    if (deel2[1] == true && valsPlayer1[7] == "") {rect(225, 245, 25, 15);}
    if (deel2[2] == true && valsPlayer1[8] == "") {rect(225, 260, 25, 15);}
    if (deel2[3] == true && valsPlayer1[9] == "") {rect(225, 275, 25, 15);}
    if (deel2[4] == true && valsPlayer1[10] == "") {rect(225, 290, 25, 15);}
    if (deel2[5] == true && valsPlayer1[11] == "") {rect(225, 305, 25, 15);}
    if (dice[0] != 0 && valsPlayer1[12] == "") {rect(225, 320, 25, 15);}
  } else {
    if (deel1[0] == true && valsPlayer2[0] == "") {rect(250, 55, 25, 15);}
    if (deel1[1] == true && valsPlayer2[1] == "") {rect(250, 70, 25, 15);}
    if (deel1[2] == true && valsPlayer2[2] == "") {rect(250, 85, 25, 15);}
    if (deel1[3] == true && valsPlayer2[3] == "") {rect(250, 100, 25, 15);}
    if (deel1[4] == true && valsPlayer2[4] == "") {rect(250, 115, 25, 15);}
    if (deel1[5] == true && valsPlayer2[5] == "") {rect(250, 130, 25, 15);}
    
    if (deel2[0] == true && valsPlayer2[6] == "") {rect(250, 230, 25, 15);}
    if (deel2[1] == true && valsPlayer2[7] == "") {rect(250, 245, 25, 15);}
    if (deel2[2] == true && valsPlayer2[8] == "") {rect(250, 260, 25, 15);}
    if (deel2[3] == true && valsPlayer2[9] == "") {rect(250, 275, 25, 15);}
    if (deel2[4] == true && valsPlayer2[10] == "") {rect(250, 290, 25, 15);}
    if (deel2[5] == true && valsPlayer2[11] == "") {rect(250, 305, 25, 15);}
    if (dice[0] != 0 && valsPlayer2[12] == "") {rect(250, 320, 25, 15);}  
  }
}

//makes the dice appear with the corresponding value
void drawDice() {
    switch(dice[0]) {
    case 0: image(imgRoll, 22, 20); break;
    case 1: image(img1, 22, 20); break;
    case 2: image(img2, 22, 20); break;
    case 3: image(img3, 22, 20); break;
    case 4: image(img4, 22, 20); break;
    case 5: image(img5, 22, 20); break;
    case 6: image(img6, 22, 20); break;
  }
  switch(dice[1]) {
    case 0: image(imgRoll, 22, 80); break;
    case 1: image(img1, 22, 80); break;
    case 2: image(img2, 22, 80); break;
    case 3: image(img3, 22, 80); break;
    case 4: image(img4, 22, 80); break;
    case 5: image(img5, 22, 80); break;
    case 6: image(img6, 22, 80); break;
  }
  switch(dice[2]) {
    case 0: image(imgRoll, 22, 140); break;
    case 1: image(img1, 22, 140); break;
    case 2: image(img2, 22, 140); break;
    case 3: image(img3, 22, 140); break;
    case 4: image(img4, 22, 140); break;
    case 5: image(img5, 22, 140); break;
    case 6: image(img6, 22, 140); break;
  }
  switch(dice[3]) {
    case 0: image(imgRoll, 22, 200); break;
    case 1: image(img1, 22, 200); break;
    case 2: image(img2, 22, 200); break;
    case 3: image(img3, 22, 200); break;
    case 4: image(img4, 22, 200); break;
    case 5: image(img5, 22, 200); break;
    case 6: image(img6, 22, 200); break;
  }
  switch(dice[4]) {
    case 0: image(imgRoll, 22, 260); break;
    case 1: image(img1, 22, 260); break;
    case 2: image(img2, 22, 260); break;
    case 3: image(img3, 22, 260); break;
    case 4: image(img4, 22, 260); break;
    case 5: image(img5, 22, 260); break;
    case 6: image(img6, 22, 260); break;
  }
}
