class Paralelogramo extends Figura {
  Paralelogramo(float posx, float posy, float ang_i, float dim_i, color c1_i, float esc_i){
    super(posx, posy, ang_i, dim_i, c1_i, esc_i);
  }
  void dibujar() {
    float x1 = -d/4;
    float y1 = -d/4;
    float x2 = 3*d/4;
    float y2 = -d/4;
    float x3 = d/4;
    float y3 = d/4;
    float x4 = -3*d/4;
    float y4 = d/4;
    push();
    translate(tx, ty);
    rotate(ang);
    stroke(c1);
    fill(c1);
    quad(esc*x1,y1, esc*x2,y2,esc*x3,y3,esc*x4,y4);
    pop();
  }
}
