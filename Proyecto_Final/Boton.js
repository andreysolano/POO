class Boton {
  constructor(x, y, w, h, num) {
    this.x = x; 
    this.y = y; 
    this.w = w;
    this.h = h; 
    this.num = num;
  }





  show() {
    noStroke();
    rectMode(CENTER);
    fill (120,235,0);
    rect(this.x, this.y, this.w, this.h);
  }
}
