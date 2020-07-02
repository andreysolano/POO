class Boton {
  constructor(x, y, w, h, num) {
    this.x = x; 
    this.y = y; 
    this.w = w;
    this.h = h; 
    this.num = num;
  }


  click(px, py) {
    if (px >= this.x &&        //Esquina sup. izquierda
      px <= this.x + this.w &&   // Esquina sup. derecha
      py >= this.y &&        // Esquina infe. izquierda
      py <= this.y + this.h) {   //Esquina infe. derecha 
      return true;
    }
    return false;
  }


  show() {
    noStroke();
    rectMode(CORNER);
    fill (120,235,0);
    rect(this.x, this.y, this.w, this.h);
  }
}
