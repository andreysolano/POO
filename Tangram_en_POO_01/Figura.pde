class Figura {
  float tx, ty, ang, dim, esc;
  color c1;

 Figura(float posx, float posy, float ang_i, float dimen_i, color c1_i, float esc_i){
    tx = posx;
    ty= posy;
    ang = ang_i;
    dim = dimen_i;
    c1= c1_i;
    esc= esc_i;
  }
  
 void seleccion(){
    color col_mouse;
    boolean  sel_fig = false;
    col_mouse= get(mouseX, mouseY);
    
 if ((red(col_mouse)==red(c1) && green(col_mouse)==green(c1) && blue(col_mouse)==blue(c1))){
      sel_fig=true;
 }
    
 if(mousePressed){
      if(mouseButton==LEFT && sel_fig==true) {
        tx = mouseX;
        ty = mouseY;
      }
 }
 if (keyPressed) {
  if(key == ' ' && sel_fig==true) {
        ang += PI/4;
        delay (200);
      }
  if (key == 'r' || key == 'R' && sel_fig==true) {
      esc *= -1;
      delay (50);
    }
  }
 }
}
