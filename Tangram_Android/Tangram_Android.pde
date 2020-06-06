//Tangram Programado en Processing para Android +4.0

//Libreria Ketai para los sensores del celular
import ketai.sensors.*;
import android.hardware.SensorManager;
KetaiSensor sensor;
PVector accelerometer= new PVector();
PVector p_accelerometer=new PVector();
float contador1=0;

Boton_mini[] botones_niveles = new Boton_mini[10];
Boton[] botones_dos = new Boton[2];
Boton[] botones_menu= new Boton[4];
PImage [] niveles= new PImage[10]; 
int state=0;
int nivel=0;




Triangle triangle1;
Triangle triangle2;
Triangle triangle3;
Triangle triangle4;
Triangle triangle5;
Square square;
Parallelogram parallelogram;

void setup() {
  fullScreen();
  orientation(PORTRAIT);    
  fill(0);
  sensor = new KetaiSensor(this);
  sensor.start();

  figuras();

  //Cargar imagenes de los niveles a un array
  for (int i=0; i<niveles.length; i++) {
    niveles[i]= loadImage("nivel"+i+".png");
  }
}



void draw() {
  switch (state) {
  case 0: 
    menu();
    break; 

  case 1: 
    niveles();
    break; 

  case 2: 
    modo_creador();
    break; 

  case 3: 
    instructivo();
    break;

  case 4: 
    acerca();
    break;

  case 5: 
    nivelesp();
    break;

  case 6: 
    nivelesc();
    break;

  case 7:
    canvas();
    break;

  default:
    println("Error 3459: Unknown state error " + state);  
    state = 0; 
    break;
  }
}

//state 0
void menu() {
  background(255, 255, 255);

  //Inicializacion Botones del menú
  for (int i = 0; i < botones_menu.length; i++) {
    botones_menu[i] = new Boton(width/4, ((6+3*i)*height)/20, width/2, height/10, 10, i);
  }

  //Mostrar Botones de la sección niveles
  for (int i = 0; i < botones_menu.length; i++) {
    botones_menu[i].display();
  }



  if (botones_menu[0].click(mouseX, mouseY)) {
    delay(300);
    state = 1;
  }
  if (botones_menu[1].click(mouseX, mouseY)) {
    delay(300);
    state = 2;
  }
  if (botones_menu[2].click(mouseX, mouseY)) {
    delay(300);
    state = 3;
  }
  if (botones_menu[3].click(mouseX, mouseY)) {
    delay(300);
    state = 4;
  }
}




//state 1
void niveles() {
  delay(100);
  background(234, 237, 105);

  //Inicialización botones del selec niveles 
  botones_dos[0]= new Boton(width/10, 3*height/10, 7*width/20, 2*height/5, 10, 0);
  botones_dos[1]= new Boton(3*width/5, 3*height/10, 7*width/20, 2*height/5, 10, 1);

  botones_dos[0].display();
  botones_dos[1].display();

  if (botones_dos[0].click(mouseX, mouseY)) {
    delay(600);
    state = 5;
  }
  if (botones_dos[1].click(mouseX, mouseY)) {
    delay(600);
    state = 6;
  }
}



//state 2
void modo_creador() {
  background(116, 222, 120);
}


//state 3
void instructivo() {

  background(255, 255, 255);
  textSize (80);
  fill (235, 183, 52);
  text ("Instrucciones", (width/2)-(textWidth ("Instrucciones")/2), height/6);
}

//state 4
void acerca() {
  delay(200);
  background(147, 27, 27);
  textSize (80);
  fill (235, 183, 52);
  text ("Los creadores:", (width/2)-(textWidth ("Instrucciones")/2), height/6);
}

//state 5
void nivelesp() {
  background(105, 223, 237);
  int j=0;
  int p=1;
  //Inicialización Botones del selec_niveles predeterminados a un array
  for (int i = 0; i < botones_niveles.length; i++) {
    botones_niveles[i] = new Boton_mini(j*width/4 +50, p*height/6, 200, 200, 5, i);
    j=j+1;
    if (j==4) {
      j=0;
      p=p+1;
    }
  }
  figuras();
  //Mostrar Botones de la sección niveles
  for (int i = 0; i < botones_niveles.length; i++) {
    botones_niveles[i].display();
    if (botones_niveles[i].click(mouseX, mouseY)==true) {
      delay(300);
      nivel=i;
      state=7;
    }
  }
}


//state 6
void nivelesc() {
  background(190, 90, 200);
}


void onBackPressed() {
  if (state==5 || state==6) state=1;
  if (state==7) state=5;
  else state=0;
}


void play(int i) {
  background(54, 54, 54);
  drawGrid(10);
  image(niveles[i], 0, 50*displayDensity, 420*displayDensity, 420*displayDensity);

  triangle1.display();
  triangle2.display();
  triangle3.display();
  parallelogram.display();
  square.display();
  triangle4.display();
  triangle5.display();


  triangle1.seleccion();
  triangle2.seleccion();
  triangle3.seleccion();
  parallelogram.seleccion();
  square.seleccion();
  triangle4.seleccion();
  triangle5.seleccion();




  cuentapixeles();
  println(contador1);  
  p_accelerometer.set(accelerometer);



  float progress = (contador1-2000)/60000;
  fill(16, 255, 13);
  print(width - (width*progress));
  rect(0, 0, width-(width*progress), 10*displayDensity);
}










void drawGrid(float scale) {
  push();
  scale=scale*displayDensity;
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





void cuentapixeles() {
  //recibir los pixeles del canvas
  loadPixels();
  // reiniciar contador de blancos
  contador1=0;
  // for que revise cada pixel del canvas
  for (int i=0; i<width/2*height; i++) {
    //extraer los rgb de cada pixel
    float r= red(pixels[i]) ;
    float g= green(pixels[i]);
    float b= blue(pixels[i]);
    i=i+5;
    // comparar cada valor con los de blanco, y si es blanco el contador aumenta.
    if (r==245 & g==206 & b==197) {  
      contador1++;
    }
  }
}

void canvas() {

  play(nivel);
}

void figuras() {
  triangle1 = new Triangle(color(93, 241, 42), 0, height/2+400, 2, 0);   //Triangulo Verde
  triangle2 = new Triangle(color(255, 8, 0 ), 0, height/2+100, 2, 0);   //Triangulo Rojo
  triangle3= new Triangle(color(152, 50, 138), 100, 0, sqrt(2), 0);  //Triangulo morado 
  parallelogram= new Parallelogram(color(113, 125, 126), 600, height, 1, 0); //Paralelogramo
  square=new Square(color(110, 44, 0), 0, 300, 1, 45); //Cuadrado
  triangle5 = new Triangle(color(238, 241, 42), width/4, 30, 1, 180);  //Triangulo amarillo
  triangle4 = new Triangle(color(50, 103, 152), width/4+400, 30, 1, 180); //Triangulo azul
}
