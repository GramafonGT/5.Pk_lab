
Block[][] blocke = new Block[15][15];
Auto myCar= new Auto();



int Kx=1;
int Ky=1;
float  circleX;
float  circleY;

void setup() {
  size(1080, 900);
  background(0, 110, 20);
  initialisieren();
}


void draw() {
  anzeigen();
  aktualisieren();
}

void mousePressed() {
  for (int i = 0; i < 15; i++) {
    for (int j = 0; j < 15; j++) {
      if (blocke[i][j].istMausDarauf()) {
        blocke[i][j].aenderenFarbe();
        blocke[i][j].display();  // Display der block nach der Farbeänderung
      }
    }
  }
}

void keyPressed() {

  // Bewege den Kreis basierend auf den Pfeiltasten
  if (keyCode == UP && blocke[Kx][Ky-1].art==true) {
    Ky-=1;
    Ky=constrain(Ky, 0, 14);
    circleY = blocke[Kx][Ky].y + blocke[0][0].h / 2;
  } else if (keyCode == DOWN && blocke[Kx][Ky+1].art==true) {
    Ky+=1;
    Ky=constrain(Ky, 0, 14);
    circleY = blocke[Kx][Ky].y + blocke[0][0].h / 2;
  } else if (keyCode == LEFT && blocke[Kx-1][Ky].art==true) {
    Kx-=1;
    Kx=constrain(Kx, 0, 14);
    circleX = blocke[Kx][Ky].x + blocke[0][0].w / 2;
  } else if (keyCode == RIGHT && blocke[Kx+1][Ky].art==true) {
    Kx+=1;

    circleX = blocke[Kx][Ky].x + blocke[0][0].w / 2;
  }
}

void initialisieren() {

  for (int i=0; i<15; i++) {
    for (int j=0; j<15; j++) {
      blocke[i][j]= new Block(i, j);
      if (i==0||j==0||i==14||j==14)
        blocke[i][j].aenderenFarbe();
    }
  }
  circleX = blocke[1][0].x + blocke[1][0].w / 2;
  circleY = blocke[0][1].y + blocke[0][1].h / 2;
}

void anzeigen() {
  pushMatrix();
  fill(0);
  rect(0, 0, width, height/5);
  textSize(28*width/600);
  textAlign(CENTER);
  fill(255);
  text("Labyrinth", width/2, height/10 );
  popMatrix();
}

void aktualisieren() {
  pushMatrix();
  for (int i=0; i<15; i++) {
    for (int j=0; j<15; j++) {
      blocke[i][j].display();
      if (blocke[i][j].id==16) {
        blocke[i][j].farbe(0, 144, 0);
        blocke[i][j].art=true;
      }
      if (blocke[i][j].id==208) {
        blocke[i][j].farbe(0, 0, 220);
        blocke[i][j].art=true;
      }
    }
  }
  popMatrix();
  myCar.display();
}
