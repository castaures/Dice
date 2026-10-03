void setup()
{
  noLoop();
  size(500, 500);
}

void draw()
{
  background(255);
  int total = 0;
  int dieSize = 20;
  int gap = 10; 
  int totalColumns = 15; 
  int totalRows = 15;

  for (int j = 0; j < totalRows; j++) {
    for (int i = 0; i < totalColumns; i++) {
      int x = gap + i * (dieSize + gap);
      int y = gap + j * (dieSize + gap);
      diceBlueprint bob = new diceBlueprint(x, y, dieSize);
      bob.show();
      total += bob.value;
    }
  }

  fill(0);
  textSize(18);
  textAlign(CENTER);
  text("TOTAL: " + total, width / 2, 470);
}

void mousePressed()
{
  redraw();
}

class diceBlueprint
{
  int myX, myY, value, dieSize;

  diceBlueprint(int x, int y, int size) {
    value = (int)(Math.random() * 6) + 1;
    myX = x+20;
    myY = y;
    dieSize = size;
  }

  void show()
  {
    int d = 2;
    int diceLeft = myX + dieSize / 4;
    int diceRight = myX + 3 * dieSize / 4;
    int diceMid = myX + dieSize / 2;
    int diceCenter = myY + dieSize / 2;
    int diceTop = myY + dieSize / 4;
    int diceBottom = myY + 3 * dieSize / 4;
    
    fill((int)(Math.random() * 150));
    stroke(0);
    strokeWeight(2);
    rect(myX, myY, dieSize, dieSize, 5);

    fill(255);
    stroke(255);
    strokeWeight(1);

    if (value==1 || value==3 || value==5) {
      ellipse(diceMid, diceCenter, d, d);
    }
    if (value >= 2) {
      ellipse(diceLeft, diceTop, d, d);
      ellipse(diceRight, diceBottom, d, d);
    }
    if (value >= 4) {
      ellipse(diceRight, diceTop, d, d);
      ellipse(diceLeft, diceBottom, d, d);
    }
    if (value == 6) {
      ellipse(diceLeft, diceCenter, d, d);
      ellipse(diceRight, diceCenter, d, d);
    }
  }
}
