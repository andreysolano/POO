class Triangulo extends Figura {
  Triangulo(float posx, float posy, float ang_i, float dimen_i, color c1_i, float esc_i){
    super(posx, posy,ang_i, dimen_i,c1_i, esc_i);
  }
  void dibujar() {
    float x1 = 0;
    float y1 = 2*dim/3;
    float x2 = -dim;
    float y2 = -dim/3;
    float x3 = dim;
    float y3 = -dim/3;
    push();
    translate(tx, ty);
    rotate(ang);
    fill(c1);
    stroke (c1);
    triangle(x1, y1, x2, y2, x3, y3);
    pop();
  }
}
