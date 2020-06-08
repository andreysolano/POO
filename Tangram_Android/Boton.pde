
class Boton {    

  // Locación y tamaño de los botones
  float x;   
  float y;   
  float w;   
  float h;   
  int num;
  float c;

  Boton(float tempX, float tempY, float tempW, float tempH,float tempc, int tempnum) {    
    x  = tempX;   
    y  = tempY;   
    w  = tempW;   
    h  = tempH;   
    num=tempnum;
    c= tempc*displayDensity;
  }    
  
  //Comprueba que se seleccione un botón 
  boolean click(float px, float py) {
    if (px >= x && px <= x + w && py >= y && py <= y + h && mousePressed) {  
      return true;
    }
    return false;
  }
  int flag=0;

  void display() {
    stroke(0);
    rect(x, y, w, h,c);
  }
} 
