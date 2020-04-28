//Bienvenido al Tangram 
//con la tecla espacio rotas las fichas 45 grados
// con la tecla R puedes rotar el paralelogramo
// con la tecla P reinicias las fichas a sus posiciones iniciales


float l= 300;  //equivalencias entre las figuras
float l2=l/2;
float l4=l/4;
float l8= l/8;
float h1 = ((sqrt(2)*l)/2);
float h2 = ((sqrt(2)*l)/4);
float radius = 25;
//coordenada del centro de los circulos
float cx1 = 200;
float cy1 = 300-l4;

float cx2 =200-l4;
float cy2= 300;

float cx3=(200+(3*l8));
float cy3= 300+l4;

float cx4 =(200+(3*l8));
float cy4 = 300-l4;

float cx5 =200;
float cy5 = 300+l8;

float cxp=200 - l8;
float cyp=300+ (3*l8);

float cxc=200+l4;
float cyc=300;
//angulos iniciales
float ang1=0;
float ang2=0;
float ang3=0;
float ang4=0;
float ang5=0;
float angp=0;
float angc=0;

//escalas reflexión del paralelogramo
float escx=1;
float escy=1;

color negro = color(54,54,54);
color nivel= color(245,206,197);


PShape pez;
boolean drawGrid = true;
float contador1=0;
boolean n1= true;
boolean n2= true;

void setup() {
  size(1200,600);
}
void draw() {
  background(negro);
  strokeWeight(2);
  if (drawGrid){
    drawGrid(10);
  }
   
   
  if(n1==true){ 
    push();
    pez();
    shape(pez);
    pop();
    
    fichas();
    
    cuentapixeles();
    print(contador1);
    print("       ");
    n1=win(contador1);
  } else ganador();
 
  
  
  
}






void fichas(){
  


  //------BLOQUE TRIANGULO VERDE (1)----------//
  if(encima(mouseX,mouseY, cx1, cy1, radius)){
    fill(255,150,0);
  }
  else fill(93, 241, 42 );
  triangulo1(cx1,cy1,ang1);

 //comprubea que el mouse esta encima y hay click izq
 if(seleccion(cx1,cy1)){
        cx1=mouseX;
        cy1=mouseY;
 }
 //comprueba que le mouse este encima y se presiona espacio
 if (tespacio(cx1,cy1)){
     ang1=ang1 +45;
     delay(100);
  }

  //------BLOQUE TRIANGULO ROJO (2)----------//
  if(encima(mouseX,mouseY, cx2, cy2, radius)){
    fill(255,150,0);
  }
  else fill(255, 8, 0 );
  triangulo2(cx2,cy2,ang2);

 //comprubea que el mouse esta encima y hay click izq
 if(seleccion(cx2,cy2)){
        cx2=mouseX;
        cy2=mouseY;
 }
 //comprueba que le mouse este encima y se presiona espacio
 if (tespacio(cx2,cy2)){
     ang2 +=45;
     delay(100);
  }

  //------BLOQUE TRIANGULO MORADO (3)----------//
  if(encima(mouseX,mouseY, cx3, cy3, radius)){
    fill(255,150,0);
  }
  else fill(152, 50, 138 );
  triangulo3(cx3,cy3,ang3);

 //comprubea que el mouse esta encima y hay click izq
 if(seleccion(cx3,cy3)){
        cx3=mouseX;
        cy3=mouseY;
 }
 //comprueba que le mouse este encima y se presiona espacio
 if (tespacio(cx3,cy3)){
     ang3 +=45;
     delay(100);
  }

  //------BLOQUE TRIANGULO AZUL (4)----------//
  if(encima(mouseX,mouseY, cx4, cy4, radius)){
    fill(255,150,0);
  }
  else fill(50, 103, 152);
  triangulo4(cx4,cy4,ang4);

 //comprubea que el mouse esta encima y hay click izq
 if(seleccion(cx4,cy4)){
        cx4=mouseX;
        cy4=mouseY;
 }
 //comprueba que le mouse este encima y se presiona espacio
 if (tespacio(cx4,cy4)){
     ang4 +=45;
     delay(100);
  }

 //------BLOQUE TRIANGULO AMARILLO (5)----------//
  if(encima(mouseX,mouseY, cx5, cy5, radius)){
    fill(255,150,0);
  }
  else fill(238, 241, 42);
  triangulo5(cx5,cy5,ang5);

 //comprubea que el mouse esta encima y hay click izq
 if(seleccion(cx5,cy5)){
        cx5=mouseX;
        cy5=mouseY;
 }
 //comprueba que le mouse este encima y se presiona espacio
 if (tespacio(cx5,cy5)){
     ang5 +=45;
     delay(100);
  }

 //------BLOQUE PARALELOGRAMO GRIS (6)----------//
  if(encima(mouseX,mouseY, cxp, cyp, radius)){
    fill(255,150,0);
  }
  else fill(113, 125, 126);
  paralelogramo(cxp,cyp,angp,escx,escy);

 //comprubea que el mouse esta encima y hay click izq
 if(seleccion(cxp,cyp)){
        cxp=mouseX;
        cyp=mouseY;
 }
 //comprueba que le mouse este encima y se presiona espacio
 if (tespacio(cxp,cyp)){
     angp +=45;
     delay(100);
  }
 if (reflejar (cxp, cyp)) {
      escx *= -1;
      delay (100);
 }


 //------BLOQUE CUADRADO CAFE (7)----------//
  if(encima(mouseX,mouseY, cxc, cyc, radius)){
    fill(255,150,0);
  }
  else fill(110, 44, 0);
  cuadrado(cxc,cyc,angc);

 //comprubea que el mouse esta encima y hay click izq
 if(seleccion(cxc,cyc)){
        cxc=mouseX;
        cyc=mouseY;
 }
 //comprueba que le mouse este encima y se presiona espacio
 if (tespacio(cxc,cyc)){
     angc +=45;
     delay(100);
  }

  
}




//TRIANGULO VERDE
void triangulo1(float cx,float cy, float angulo){
  push();
  noStroke();
  translate(cx,cy);
  rotate(radians(angulo));
  cx=0;cy=0;
  triangle(cx+l2,cy-l4,cx,cy+l4,cx-l2,cy-l4);
  stroke(0);
  ellipse(cx, cy, radius,radius);
  pop();
}

//TRIANGULO ROJO
void triangulo2(float cx,float cy, float angulo){
  push();
  noStroke();
  translate(cx,cy);
  rotate(radians(angulo));
  cx=0;cy=0;
  triangle(cx+l4,cy,cx-l4,cy-l2,cx-l4,cy+l2);
  stroke(0);
  ellipse(cx, cy, radius,radius);
  pop();
}

//TRIANGULO MORADO
void triangulo3(float cx,float cy, float angulo){
  push();
  noStroke();
  translate(cx,cy);
  rotate(radians(angulo));
  cx=0;cy=0;
  triangle(cx+l8,cy-l4,cx+l8,cy+l4,cx-(3*l8),cy+l4);
  stroke(0);
  ellipse(cx, cy, radius,radius);
  pop();
}

//TRIANGULO AZUL
void triangulo4(float cx,float cy, float angulo){
  push();
  noStroke();
  translate(cx,cy);
  rotate(radians(angulo));
  cx=0;cy=0;
  triangle(cx-l8,cy,cx+l8,cy+l4,cx+l8,cy-l4);
  stroke(0);
  ellipse(cx, cy, radius,radius);
  pop();
}

//TRIANGULO AMARILLO
void triangulo5(float cx,float cy, float angulo){
  push();
  noStroke();
  translate(cx,cy);
  rotate(radians(angulo));
  cx=0;cy=0;
  triangle(cx,cy-l8,cx+l4,cy+l8,cx-l4,cy+l8);
  stroke(0);
  ellipse(cx, cy, radius,radius);
  pop();
}

//PARALELOGRAMO CAFE
void paralelogramo(float cx,float cy, float angulo, float escalax, float escalay){
  push();
  noStroke();
  translate(cx,cy);
  scale (escalax, escalay);
  rotate(radians(angulo));
  cx=0;cy=0;
  quad(cx-l8,cy-l8,cx+(3*l8),cy-l8,cx+l8,cy+l8,cx-(3*l8),cy+l8);
  stroke(0);
  ellipse(cx, cy, radius,radius);
  pop();
}

//CUADRADO CAFE
void cuadrado(float cx,float cy, float angulo){
  push();
  noStroke();
  translate(cx,cy);
  rotate(radians(angulo));
  cx=0;cy=0;
  quad(cx-l4,cy,cx,cy-l4,cx+l4,cy,cx,cy+l4);
  stroke(0);
  ellipse(cx, cy, radius,radius);
  pop();
}

void pez(){
  
  translate(650,200);
  pez =createShape();
  pez.beginShape();
  pez.noStroke();
  pez.fill(nivel);
  pez.noStroke();
  pez.vertex(0, 0);
  pez.vertex(h1,0);
  pez.vertex(h1-h2,-h2);
  pez.vertex((h1-h2)+h2,-h2);
  pez.vertex(h1+h2,0);
  pez.vertex(h1+h2+h2,+h2);
  pez.vertex(h1,h1+h2);
  pez.vertex(h1-h2,h1+h2);
  pez.vertex(h1,h1);
  pez.vertex(0,h1);
  pez.vertex(h2,h2);
  endShape(CLOSE);
  
  
}


void casa(){
  
  translate(650,200);
  fill(nivel);
  rect(50,50,50,50);

}



boolean seleccion(float cx, float cy){
  if(mouseButton == LEFT && encima(mouseX,mouseY, cx, cy, radius)) return true;
  else return false;
}

boolean tespacio(float cx,float cy){
  if (keyPressed  && encima(mouseX,mouseY, cx, cy, radius) ) {
       if (key == ' ') return true;
   }
   return false;
}

boolean reflejar (float cx, float cy){
  if (keyPressed && encima (mouseX,mouseY, cx, cy, radius)){
    if (key == 'r' ) return true;
  }
  return false;
}

//obtiene la distancia entre el mouse y el centro del circulo usando pitagoras
boolean encima(float px, float py, float cx, float cy, float r) {
  float distX = px - cx;
  float distY = py - cy;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  //Si la distancia es menor que el radio, esta adentro
  if (distance <= r) {
    return true;
  }
  return false;
}
void drawGrid(float scale) {
  push();
  strokeWeight(1);
  int i;
  for (i=0; i<=width/scale; i++) {
    stroke(0, 0, 0, 20);
    line(i*scale, 0, i*scale, height);
  }
  for (i=0; i<=height/scale; i++) {
    stroke(0, 0, 0, 20);
    line(0, i*scale, width, i*scale);
  }
  pop();
}

void keyPressed() {
  if (key == 'g' || key == 'G')
    drawGrid = !drawGrid;
  if (key == 'p' || key == 'P'){
    reset();
  }
}






void cuentapixeles(){
  //recibir los pixeles del canvas
  loadPixels();
  // reiniciar contador de blancos
  contador1=0;
  // for que revise cada pixel del canvas
  for(int i=0;i<width*height;i++){
    //extraer los rgb de cada pixel
    float r= red(pixels[i]) ;
    float g= green(pixels[i]);
    float b= blue(pixels[i]);
    // comparar cada valor con los de blanco, y si es blanco el contador aumenta.
    if(r==245 & g==206 & b==197){
      contador1++;
    }
  }
  
  /* 
  for ( int i = 0; i < height; i++) {
   for (int j =0; j < width; j ++ ) { 
      if(get(i,j)==nivel);cuenta=cuenta+1;
     }
 } */
  
}

boolean win(float contador){
  if(contador<=50) return false;
  else return true;
}

void ganador(){
  fill (255);
  textSize (100);
  text("Ganaste!", mouseX, mouseY);

}
   

void reset(){
       cx1 = 200;
     cy1 = 300-l4;
     cx2 =200-l4;
     cy2= 300;
    
     cx3=(200+(3*l8));
     cy3= 300+l4;
    
     cx4 =(200+(3*l8));
     cy4 = 300-l4;
    
     cx5 =200;
     cy5 = 300+l8;
    
     cxp=200 - l8;
     cyp=300+ (3*l8);
    
     cxc=200+l4;
     cyc=300;
    //angulos iniciales
     ang1=0;
     ang2=0;
     ang3=0;
     ang4=0;
     ang5=0;
     angp=0;
     angc=0;
    
    //escalas reflexión del paralelogramo
     escx=1;
     escy=1; 
}
