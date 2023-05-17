
void drawX(int _x, int _y, boolean fullColor) {
  if (fullColor) {
    fill(255, 0, 0);
  } else {
    fill(255, 162, 162);
  }
  noStroke();
  rectMode(CENTER);
  pushMatrix();
  translate(_x, _y);
  pushMatrix();
  translate(boxSize/2, boxSize/2);
  rotate(radians(45));
  rect(0, 0, 300, 35, 40);
  rect(0, 0, 35, 300, 40);
  popMatrix();
  popMatrix();
}

void drawO(int _x, int _y, boolean fullColor) {
  noStroke();
  int ellipseX = _x + boxSize/2;
  int ellipseY = _y + boxSize/2;
  int thicc = 105;
  if (fullColor) {
    fill(0, 0, 255);
  } else {
    fill(162, 162, 255);
  }

  ellipse(ellipseX, ellipseY, boxSize-40, boxSize-40);
  fill(255);
  ellipse(ellipseX, ellipseY, boxSize - thicc, boxSize - thicc);
}

void gridLines() {
  int counter = 0;
  stroke(10);
  strokeWeight(9);
  while (counter < 3) {
    line(counter * boxSize + boxSize, 0, counter * boxSize + boxSize, height);
    counter++;
  }
  counter = 0;
  while (counter < 3) {
    line(0, counter * boxSize + boxSize, width, counter* boxSize + boxSize);
    counter++;
  }
}
