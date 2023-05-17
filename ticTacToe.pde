ArrayList<Square> squares = new ArrayList<Square>();
int frameSize = 900;
int boxSize = frameSize/3;
boolean turnIsX = true;
int turnCounter = 0;
boolean gameWon = false;

void setup()
{
  size(900, 900);
  rectMode(CORNER);

  //set up the tiles (i'm now realizing i could have called them tiles instead of squares and it would make more sense but oh well
  int counter = 0;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      Square temp = new Square(boxSize*j, boxSize*i, counter);
      squares.add(temp);
      squares.get(counter).display();
      counter++;
    }
  }
}

void draw() {
  background(255);
  gridLines();
  for (Square square : squares) {
    square.inBounds();
    if (square.inBox) {
      //System.out.println("we ballin in " + squares.indexOf(square));
      if (turnIsX && !square.isX && !square.isO) {
        drawX(square.x, square.y, false);
      } else if (!turnIsX && !square.isX && !square.isO) {
        drawO(square.x, square.y, false);
      }
    }
    if (square.isX) {
      drawX(square.x, square.y, true);
    }

    if (square.isO) {
      drawO(square.x, square.y, true);
    }
  }
  checkForWin();

  if (!gameWon) {
    if (turnCounter == 9) {
      rectMode(CORNER);
      fill(255, 201);
      rect(0, 0, width, height);
      stroke(0);
      rectMode(CENTER);

      fill(255);
      rect(width/2, height/2, 800, 200, 30);
      fill(0);
      textAlign(CENTER, CENTER);
      textSize(50);
      text("No one wins. Cry about it.", width/2, height/2);
    }
  }
}

class Square {
  int x, y, number;
  boolean inBox = false;
  boolean isX, isO = false;

  Square(int _x, int _y, int _number) {
    x = _x;
    y = _y;
    number = _number;
  }

  void display() {
    rect(x, y, boxSize, boxSize);
  }

  boolean inBounds() {
    if (mouseX > x && mouseX < x + boxSize && mouseY > y && mouseY < y + boxSize) {
      inBox = true;
    } else {
      inBox = false;
    }
    return inBox;
  }
}

void mouseClicked() {
  for (Square square : squares) {
    if (square.inBox) {
      if (turnIsX && !square.isO && !square.isX) {
        square.isX = true;
        turnIsX = !turnIsX;
        turnCounter++;
      } else if (!turnIsX && !square.isX && !square.isO) {
        square.isO = true;
        turnIsX = !turnIsX;
        turnCounter++;
      }
    }
  }
  printBoard();
}
