class Cuadrado extends Figura {
  Cuadrado(float posx, float posy, float ang_i, float dim_i, color c1_i, float esc_i){
    super(posx, posy, ang_i, dim_i, c1_i, esc_i);
  }
  
void dibujar (){
  
    float x1 = -sqrt(2)*d/4;
    float y1 = -sqrt (2)*d/4;
    float x2 = sqrt (2)*d/2;
    float y2 = sqrt (2)*d/2;
    
    push();
    translate (tx, ty);
    rotate(ang);
    stroke(c1);
    fill(c1);  
    rect(x1, y1, x2, y2);
    pop();
   }
 }
