class Guarda extends Boton{
  constructor(x, y, w, h, colR, colG, colB, img, c) {
    super(x, y, w, h, colR, colG, colB);
    this.img = img;
    this.c=c;
  }
  
  showImg(){
    rectMode(CORNER);
    fill(0,40);
    rect(this.x + 3, this.y + 3, this.w + 3, this.h + 3);
    image(this.img, this.x, this.y, this.w, this.h);
  }
  saver(){
    if (l_Wrist.x>= this.x && l_Wrist.x<= (this.x + this.w) && l_Wrist.y <= (this.y + this.h) && l_Wrist.y >= this.y){
      //let sec = second();
      saveCanvas(this.c, 'Dibujo', 'png');
    }
  }
}
