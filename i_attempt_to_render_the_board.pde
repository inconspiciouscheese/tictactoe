
void printBoard() {
  System.out.println("\nNEW BOARD TIME");
  for (Square square : squares) {
    if (square.isX) {
      System.out.print("X");
    } else if (square.isO) {
      System.out.print("O");
    } else {
      System.out.print(".");
    }
    if (squares.indexOf(square) == 2 ||squares.indexOf(square) == 5||squares.indexOf(square) == 8) {
      System.out.print("\n");
    }
  }
}

void checkForWin() {
  //horizontals
  int counter = 0;
  while (counter < 7) {
    if ((squares.get(counter).isX == squares.get(counter + 1).isX & squares.get(counter + 1).isX == squares.get(counter + 2).isX) & squares.get(counter+2).isX == true) {
      System.out.println("got a win on aisle " + counter);
      winner('x');
    }
    if ((squares.get(counter).isO == squares.get(counter + 1).isO & squares.get(counter + 1).isO == squares.get(counter + 2).isO) & squares.get(counter+2).isO == true) {
      System.out.println("got a win on aisle " + counter);
      winner('o');
    }
    counter+=3;
  }

  //verticals
  counter = 0;
  while (counter < 3) {
    if ((squares.get(counter).isX == squares.get(counter + 3).isX & squares.get(counter + 3).isX == squares.get(counter + 6).isX) & squares.get(counter+3).isX == true) {
      System.out.println("got a win on aisle " + counter);
      winner('x');
    }
    if ((squares.get(counter).isO == squares.get(counter + 3).isO & squares.get(counter + 3).isO == squares.get(counter + 6).isO) & squares.get(counter+3).isO == true) {
      System.out.println("got a win on aisle " + counter);
      winner('o');
    }
    counter ++;
  }

  //diagonals
  if ((squares.get(0).isX == squares.get(4).isX & squares.get(4).isX == squares.get(8).isX) & squares.get(0).isX == true) {
    System.out.println("got a win on that funky diagonal");
    winner('x');
  }
  if ((squares.get(0).isO == squares.get(4).isO & squares.get(4).isO == squares.get(8).isO) & squares.get(0).isO == true) {
    System.out.println("got a win on that funky diagonal");
    winner('o');
  }
  if ((squares.get(2).isX == squares.get(4).isX & squares.get(4).isX == squares.get(6).isX) & squares.get(2).isX == true) {
    System.out.println("got a win on that funky diagonal");
    winner('x');
  }
  if ((squares.get(2).isO == squares.get(4).isO & squares.get(4).isO == squares.get(6).isO) & squares.get(2).isO == true) {
    System.out.println("got a win on that funky diagonal");
    winner('o');
  }
}

void winner(char winner) { //<>//
  noLoop();
  String winnerText = String.valueOf(winner).toUpperCase();
  rectMode(CORNER);
  fill(255, 201);
  rect(0, 0, width, height);
  stroke(0);
  rectMode(CENTER);

  fill(255);
  rect(width/2, height/2, 800, 200, 30);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(100);
  text(winnerText + " is the winner!", width/2, height/2);
  System.out.println(winner);
  
  gameWon = true;
}
