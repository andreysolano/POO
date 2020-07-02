class Boton{
  constructor(x, y, w, h, num){
    this.x = x; 
    this.y = y; 
    this.w = w;
    this.h = h; 
    this.num = num;
  }

  show() {
    noStroke();
    rect(this.x, this.y, this.w , this.h);
  }

  click(px, py) {
    if (this.x >= this.x && px <= this.x + this.w && py >= this.y && py <= this.y + this.h ) {  
      return true;
    }
    return false;
  }

}
