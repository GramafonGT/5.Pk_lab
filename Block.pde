class Block {
  int id;
  boolean art;
  float x, y, w, h;
  int[] farbe= new int[3];

  Block(int i, int j) {
    id = i * 15 + j;
    art = true;
    w = width / 15;
    h = (height - height / 5) / 15;
    x = i * w;
    y = j * h + height / 5;
    farbe(255);
  }

  void display() {
    fill(farbe[0],farbe[1] ,farbe[2]);
    rect(x, y, w, h);
  }

  boolean istMausDarauf() {
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }

  void aenderenFarbe() {
   
    art = !art;
    if (art)
      farbe(255);
    else
      farbe(100);
  }

  void farbe(int f) {
    for (int i=0; i<3; i++)
      farbe[i]=f;
  }
  void farbe(int a, int b, int c) {
    farbe[0]=a;
    farbe[1]=b;
    farbe[2]=c;
  }
}
