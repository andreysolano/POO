

//Tangram Programado en Processing para Android +4.0

//Libreria Ketai para los sensores del celular
import ketai.sensors.*;
import android.hardware.SensorManager;
//import java.io.FilenameFilter;

import android.media.MediaPlayer;
import android.content.res.AssetFileDescriptor;
import android.content.Context;
import android.app.Activity;




KetaiSensor sensor;
PVector accelerometer= new PVector();
PVector p_accelerometer=new PVector();

MediaPlayer foto = new MediaPlayer();
;
Context context;
Activity act;
AssetFileDescriptor fd;





float contador1=0;

Boton_mini[] botones_niveles = new Boton_mini[16];
Boton[] botones_dos = new Boton[2];
Boton[] botones_menu= new Boton[4];
Boton boton_guardar;
PImage [] niveles= new PImage[16]; 
int state=0;
int nivel=0;

Ball b1;
Ball b2;
Ball b3;


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

  act = this.getActivity();
  context = act.getApplicationContext();



  figuras();

  //Cargar imagenes de los niveles a un array
  for (int i=0; i<niveles.length; i++) {
    niveles[i]= loadImage("nivel"+i+".png");
  }


  b1 = new Ball(50*displayDensity, color(34, 34, 232), 8, 4, "Andrey Solano");
  b2 = new Ball(50*displayDensity, color(255, 70, 243), 8, 4, "Oscar Olivos");
  b3 = new Ball(80*displayDensity, color(0, 255, 23), 2, 2, "Universidad Nacional de Colombia");
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
    play(nivel);
    break;

  default:
    println("Error 3459: Unknown state error " + state);  
    state = 0; 
    break;
  }
}

//state 0 Menú Principal
void menu() {
  background(120, 100, 250);
  drawGrid(3*displayDensity);

  //Inicializacion Botones del menú
  for (int i = 0; i < botones_menu.length; i++) {
    botones_menu[i] = new Boton(width/4, ((6+3*i)*height)/20, width/2, height/10, 10, i);
  }

  fill(0);
  //Mostrar Botones de la sección niveles
  for (int i = 0; i < botones_menu.length; i++) {
    botones_menu[i].display();
  }

  fill(255);
  textSize(25*displayDensity);
  text("Niveles", 100 + width/4, 50 + 6*height/20, width/2, height/10);
  text("Modo Creador", 50 +width/4, 50 + 9*height/20, width/2, height/10);
  text("Instrucciones", 50 +width/4, 50 + 12*height/20, width/2, height/10);
  text("Creditos", 100 + width/4, 50+ 15*height/20, width/2, height/10);




  //Comprueba si se selecciono algún botón 
  if (botones_menu[0].click(mouseX, mouseY)) {
    state = 1;
    delay(300);
  }
  if (botones_menu[1].click(mouseX, mouseY)) {

    state = 2;
  }
  if (botones_menu[2].click(mouseX, mouseY)) {

    state = 3;
  }
  if (botones_menu[3].click(mouseX, mouseY)) {

    state = 4;
  }
}




//state 1 Seleccionar modo de juego
void niveles() {

  background(234, 237, 105);
  drawGrid(3*displayDensity);

  //Inicialización botones del selec niveles 
  botones_dos[0]= new Boton(width/10, 3*height/10, 7*width/20, 2*height/5, 10, 0);
  botones_dos[1]= new Boton(3*width/5, 3*height/10, 7*width/20, 2*height/5, 10, 1);

  fill(0);
  botones_dos[0].display();
  botones_dos[1].display();

  fill(255);
  textSize(35*displayDensity);
  text("Niveles Juego", width/10, 4*height/10, 7*width/20, 2*height/5);
  text("Niveles Usuario", 3*width/5, 4*height/10, 7*width/20, 2*height/5 );






  if (botones_dos[0].click(mouseX, mouseY)) {
    delay(300);
    state = 5;
  }
  if (botones_dos[1].click(mouseX, mouseY)) {
    delay(300);
    state = 6;
  }
}




//state 2 Modo creador  de niveles 
void modo_creador() {

  background(116, 222, 120);
  drawGrid(3*displayDensity);

  boton_guardar = new Boton(width/2, height/2, 600, 600, 10, 1);
  fill(255);
  boton_guardar.display();

  if (boton_guardar.click(mouseX, mouseY)) {
      foto.reset();
      sonido();
      
 
  }
}


//state 3 Instrucciones 
void instructivo() {

  background(255, 255, 255);
  drawGrid(3*displayDensity);

  textSize (80);
  fill (235, 183, 52);
  text ("Instrucciones", (width/2)-(textWidth ("Instrucciones")/2), height/6);
}

//state 4 Créditos 
void acerca() {

  background(115, 80, 80);
  drawGrid(3*displayDensity);
  textSize (35*displayDensity);
  fill (235, 183, 52);
  text ("Los creadores:", (width/2)-(textWidth ("Instrucciones")/2), height/6);




  b1.display();
  b2.display();
  b3.display();
}




//state 5 Menú con los niveles predeterminados del juego 
void nivelesp() {
  background(105, 223, 237);
  drawGrid(3*displayDensity);
  int j=0;
  int p=1;

  //Inicialización Botones del selec_niveles predeterminados a un array
  for (int i = 0; i < botones_niveles.length; i++) {
    botones_niveles[i] = new Boton_mini(j*width/4 +50, p*height/7, 200, 200, 5, i);
    j=j+1;
    if (j==4) {
      j=0;
      p=p+1;
    }
  }

  //Reinicia la posición de las figuras
  figuras();
  fill(255);
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

//state 6 Menú con los niveles creados por el usuario
void nivelesc() {

  background(190, 90, 200);
  drawGrid(3*displayDensity);










  /*
  
   // int cant = dataFile("").list(png_filtro).length;
   //println(cant);
   int j=0;
   int p=1;
   PImage [] niveles_creador = new PImage[2]; 
   Boton [] botones_creador = new Boton[2];
   
   for (int i=0; i<niveles_creador.length; i++) {
   niveles[i]= loadImage("creador"+i+".png");
   }
   
   //Cargar imagenes de los niveles a un array  //Mostrar Botones de la sección niveles
   for (int i = 0; i < botones_niveles.length; i++) {
   botones_niveles[i].display();
   if (botones_niveles[i].click(mouseX, mouseY)==true) {
   delay(300);
   }
   }
   
   //Inicialización Botones del selec_niveles predeterminados a un array
   for (int i = 0; i < botones_creador.length; i++) {
   botones_creador[i] = new Boton_mini(j*width/4 +50, p*height/6, 200, 200, 5, i);
   j=j+1;
   if (j==4) {
   j=0;
   p=p+1;
   }
   }
   
   //Mostrar Botones de la sección niveles
   for (int i = 0; i < botones_creador.length; i++) {
   botones_creador[i].display();
   if (botones_niveles[i].click(mouseX, mouseY)==true) {
   print("hey");
   }
   }
   */
}

// Funcion que cambia el state
void onBackPressed() {
  delay(300);
  if (state==5 || state==6) state=1;
  if (state==7) state=5;
  else state=0;
}


void play(int i) {
  background(54, 54, 54);
  drawGrid(3*displayDensity);
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



  float progress = (contador1-2000)/41130;
  fill(16, 255, 13);
  print(width - (width*progress));
  rect(0, 0, width-(width*progress), 10*displayDensity);

  if (contador1 < 1500) {
    win();
  }
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
  loadPixels();
  contador1=0;
  for (int i=0; i<width*height; i++) {
    float r= red(pixels[i]) ;
    float g= green(pixels[i]);
    float b= blue(pixels[i]);
    i=i+5;
    if (r==245 & g==206 & b==197) {  
      contador1++;
    }
  }
}



void figuras() {
  triangle1 = new Triangle(color(93, 241, 42), 0, 9*height/10, 2, 0);   //Triangulo Verde
  triangle2 = new Triangle(color(255, 8, 0 ), 0, 7*height/10, 2, 0);   //Triangulo Rojo
  triangle3= new Triangle(color(152, 50, 138), 4*width/5, 9*height/10, sqrt(2), 0);  //Triangulo morado 
  parallelogram= new Parallelogram(color(113, 125, 126), 2*width/5, 9*height/10, 1, 0); //Paralelogramo
  square=new Square(color(110, 44, 0), 4*width/5, 7*height/10, 1, 45); //Cuadrado
  triangle5 = new Triangle(color(238, 241, 42), 2*width/5, 7*height/10, 1, 135);  //Triangulo amarillo
  triangle4 = new Triangle(color(50, 103, 152), 3*width/5, 7*height/10, 1, 135); //Triangulo azul
}



/*
//Filtro para imagenes del modo creador 
 static final FilenameFilter png_filtro = new FilenameFilter() {
 @ Override boolean accept(File path, String name) {
 return name.startsWith("creador") && name.endsWith(".png");
 }
 };*/

void win() {

  fill (random (0, 255), random (0, 255), random(0, 255));
  textSize (60*displayDensity);
  text("!Ganaste!", random (0, width/2), random (0, height/2));
  delay (200);
}

void sonido() {


  try {
    fd = context.getAssets().openFd("foto.mp3");
    foto.setDataSource(fd.getFileDescriptor(), fd.getStartOffset(), fd.getLength());
    foto.prepare();
    foto.start();
  }
  catch (IllegalArgumentException e) {
    e.printStackTrace();
  }
  catch (IllegalStateException e) {
    e.printStackTrace();
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
}
