boolean a = false;

float firstX,   firstY;    //punt inicial
float secondX,  secondY;   //punt final
float thirdX,   thirdY;    //tercer punt
float fourthX,  fourthY;   //tercer punt

float p11x, p11y;    //primer punt dins de la primera corva
float p12x, p12y;    //segon punt dins de la primera corva 
float p21x, p21y;    //primer punt dins de la segona corva 
float p22x, p22y;    //seong punt dins de la segon corva 
float p31x, p31y;    //primer punt dins de la tercera corva 
float p32x, p32y;    //...
float p41x, p41y;    
float p42x, p42y;    

float Ux1, Uy1;      //vector linea 1
float Ux2, Uy2;      //vector linea 2
float Ux3, Uy3;      //vector linea 3
float Ux4, Uy4;      //vector linea 4

float vel = 0.01;
float size = 10;
float sizeP = 5;

float x, y;          //punt de la recta
float t;             //t
float tMax = 1;      //com a minim en linees rectes i tal com esta fet el vector, = 1

int line;     //determina quina linea recorre el punt

int divLine = 30;   //divisions line

float[] PLx1 = new float [divLine];     //punts linea, 10 divisions
float[] PLy1 = new float [divLine]; 

float[] PLx2 = new float [divLine];
float[] PLy2 = new float [divLine]; 

float[] PLx3 = new float [divLine];
float[] PLy3 = new float [divLine]; 

float[] PLx4 = new float [divLine];
float[] PLy4 = new float [divLine]; 

void setup() {
  size(600, 600);
  
  line = 1;
  
  firstX = 100;
  firstY = 100;
  
  secondX = 500;
  secondY = 100;
  
  thirdX = 500;
  thirdY = 500;
  
  fourthX = 100;
  fourthY = 500;
  
  p11x = 200; 
  p11y = 45;
  p12x = 218;
  p12y = 280;
  
  p21x = 480; 
  p21y = 260;
  p22x = 460; 
  p22y = 380;
  
  p31x = 360;
  p31y = 460;
  p32x = 254; 
  p32y = 542;
  
  p41x = 13; 
  p41y = 209;    
  p42x = 143;
  p42y = 403; 
  
  x = firstX;
  y = firstY;
  
  Ux1 = secondX - firstX;
  Uy1 = secondY - firstY;
  
  Ux2 = thirdX - secondX;
  Uy2 = thirdY - secondY;
  
  Ux3 = fourthX - thirdX;
  Uy3 = fourthY - thirdY;
  
  Ux4 = firstX - fourthX;
  Uy4 = firstY - fourthY;
  
  t = 0;
}

void draw() {
  background(255, 204, 0);
  fill(255, 255, 255);
  
  ellipse(p11x, p11y, sizeP, sizeP);
  ellipse(p12x, p12y, sizeP, sizeP);
  ellipse(p21x, p21y, sizeP, sizeP);
  ellipse(p22x, p22y, sizeP, sizeP);
  ellipse(p31x, p31y, sizeP, sizeP);
  ellipse(p32x, p32y, sizeP, sizeP);
  ellipse(p41x, p41y, sizeP, sizeP);
  ellipse(p42x, p42y, sizeP, sizeP);
  
  switch(line){
    
    case 1:
    
    x = firstX * pow(1-t, 3) + p11x * 3 * t * pow(1-t, 2) + p12x * 3 * pow(t, 2) * (1-t) + secondX * pow(t, 3);
    y = firstY * pow(1-t, 3) + p11y * 3 * t * pow(1-t, 2) + p12y * 3 * pow(t, 2) * (1-t) + secondY * pow(t, 3);
    
    break;
    
    case 2:
    
    x = secondX * pow(1-t, 3) + p21x * 3 * t * pow(1-t, 2) + p22x * 3 * pow(t, 2) * (1-t) + thirdX * pow(t, 3);
    y = secondY * pow(1-t, 3) + p21y * 3 * t * pow(1-t, 2) + p22y * 3 * pow(t, 2) * (1-t) + thirdY * pow(t, 3);
    
    break;
    
    case 3:
    
    x = thirdX * pow(1-t, 3) + p31x * 3 * t * pow(1-t, 2) + p32x * 3 * pow(t, 2) * (1-t) + fourthX * pow(t, 3);
    y = thirdY * pow(1-t, 3) + p31y * 3 * t * pow(1-t, 2) + p32y * 3 * pow(t, 2) * (1-t) + fourthY * pow(t, 3);
    
    break;
    
    case 4:
    
    x = fourthX * pow(1-t, 3) + p41x * 3 * t * pow(1-t, 2) + p42x * 3 * pow(t, 2) * (1-t) + firstX * pow(t, 3);
    y = fourthY * pow(1-t, 3) + p41y * 3 * t * pow(1-t, 2) + p42y * 3 * pow(t, 2) * (1-t) + firstY * pow(t, 3);
    
    break;
  }
  
  //////////////////////////////////////////////////1
  
  PLx1[0] = firstX;
  PLy1[0] = firstY;
  
  //ellipse(PLx1[0], PLy1[0], sizeP, sizeP);
  
  for(int i = 1; i < divLine; i++)
  {
      PLx1[i] = firstX * pow((1-((tMax/divLine) * i)), 3) + p11x * 3 * ((tMax/divLine) * i) * pow((1-((tMax/divLine) * i)), 2) + p12x * 3 * pow(((tMax/divLine) * i), 2) * (1-((tMax/divLine) * i)) + secondX * pow(((tMax/divLine) * i), 3);
      PLy1[i] = firstY * pow((1-((tMax/divLine) * i)), 3) + p11y * 3 * ((tMax/divLine) * i) * pow((1-((tMax/divLine) * i)), 2) + p12y * 3 * pow(((tMax/divLine) * i), 2) * (1-((tMax/divLine) * i)) + secondY * pow(((tMax/divLine) * i), 3);
      
      line(PLx1[i-1], PLy1[i-1], PLx1[i], PLy1[i]);  //quan linea curva, trobar molts punts i tirar les lines entre ells
      ellipse(PLx1[i], PLy1[i], 2, 2);
}
  
  line(PLx1[divLine - 1], PLy1[divLine - 1], secondX, secondY);
  //ellipse(secondX, secondY, sizeP, sizeP);
  
  //////////////////////////////////////////////////2
   
  PLx2[0] = secondX;
  PLy2[0] = secondY;
  
  //ellipse(PLx2[0], PLy2[0], sizeP, sizeP);
  
  for(int i = 1; i < divLine; i++)
  {
      PLx2[i] = secondX * pow((1-((tMax/divLine) * i)), 3) + p21x * 3 * ((tMax/divLine) * i) * pow((1-((tMax/divLine) * i)), 2) + p22x * 3 * pow(((tMax/divLine) * i), 2) * (1-((tMax/divLine) * i)) + thirdX * pow(((tMax/divLine) * i), 3);
      PLy2[i] = secondY * pow((1-((tMax/divLine) * i)), 3) + p21y * 3 * ((tMax/divLine) * i) * pow((1-((tMax/divLine) * i)), 2) + p22y * 3 * pow(((tMax/divLine) * i), 2) * (1-((tMax/divLine) * i)) + thirdY * pow(((tMax/divLine) * i), 3);
      
      line(PLx2[i-1], PLy2[i-1], PLx2[i], PLy2[i]);  //quan linea curva, trobar molts punts i tirar les lines entre ells
      ellipse(PLx2[i], PLy2[i], 2, 2);
}
  
  line(PLx2[divLine - 1], PLy2[divLine - 1], thirdX, thirdY);
  //ellipse(thirdX, thirdY, 2, 2);
   
  //////////////////////////////////////////////////3
    
  PLx3[0] = thirdX;
  PLy3[0] = thirdY;
  
  //ellipse(PLx3[0], PLy3[0], sizeP, sizeP);
  
  for(int i = 1; i < divLine; i++)
  {
      PLx3[i] = thirdX * pow((1-((tMax/divLine) * i)), 3) + p31x * 3 * ((tMax/divLine) * i) * pow((1-((tMax/divLine) * i)), 2) + p32x * 3 * pow(((tMax/divLine) * i), 2) * (1-((tMax/divLine) * i)) + fourthX * pow(((tMax/divLine) * i), 3);
      PLy3[i] = thirdY * pow((1-((tMax/divLine) * i)), 3) + p31y * 3 * ((tMax/divLine) * i) * pow((1-((tMax/divLine) * i)), 2) + p32y * 3 * pow(((tMax/divLine) * i), 2) * (1-((tMax/divLine) * i)) + fourthY * pow(((tMax/divLine) * i), 3);
      
      line(PLx3[i-1], PLy3[i-1], PLx3[i], PLy3[i]);  //quan linea curva, trobar molts punts i tirar les lines entre ells
      ellipse(PLx3[i], PLy3[i], 2, 2);
}
  
  line(PLx3[divLine - 1], PLy3[divLine - 1], fourthX, fourthY);
  //ellipse(fourthX, fourthY, sizeP, sizeP);
    
  //////////////////////////////////////////////////4
  
  PLx4[0] = fourthX;
  PLy4[0] = fourthY;
  
  //ellipse(PLx4[0], PLy4[0], sizeP, sizeP);
  
  for(int i = 1; i < divLine; i++)
  {
      PLx4[i] = fourthX * pow((1-((tMax/divLine) * i)), 3) + p41x * 3 * ((tMax/divLine) * i) * pow((1-((tMax/divLine) * i)), 2) + p42x * 3 * pow(((tMax/divLine) * i), 2) * (1-((tMax/divLine) * i)) + firstX * pow(((tMax/divLine) * i), 3);
      PLy4[i] = fourthY * pow((1-((tMax/divLine) * i)), 3) + p41y * 3 * ((tMax/divLine) * i) * pow((1-((tMax/divLine) * i)), 2) + p42y * 3 * pow(((tMax/divLine) * i), 2) * (1-((tMax/divLine) * i)) + firstY * pow(((tMax/divLine) * i), 3);
      
      line(PLx4[i-1], PLy4[i-1], PLx4[i], PLy4[i]);  //quan linea curva, trobar molts punts i tirar les lines entre ells
      ellipse(PLx4[i], PLy4[i], 2, 2);
}
  
  line(PLx4[divLine - 1], PLy4[divLine - 1], firstX, firstY);
 // ellipse(firstX, firstY, sizeP, sizeP);
    
  //////////////////////////////////////////////////
  
  if(dist(firstX, firstY, mouseX, mouseY) < 10)
    {
      ellipse(firstX, firstY, 20, 20);
      a = true;
    }
  else ellipse(firstX, firstY, sizeP * 2, sizeP * 2);
  
  if(dist(secondX, secondY, mouseX, mouseY) < 10) ellipse(secondX, secondY, 20, 20);
  else ellipse(secondX, secondY, sizeP * 2, sizeP * 2);
  
  if(dist(thirdX, thirdY, mouseX, mouseY) < 10) ellipse(thirdX, thirdY, 20, 20);
  else ellipse(thirdX, thirdY, sizeP * 2, sizeP * 2);
  
  if(dist(fourthX, fourthY, mouseX, mouseY) < 10) ellipse(fourthX, fourthY, 20, 20);
  else ellipse(fourthX, fourthY, sizeP * 2, sizeP * 2);
  
  //////////////////////////////////////////////////
  
  fill(255, 0, 0);
  ellipse(x, y, size, size);
  
  t += vel;
  
  if(t >= 1){
    
    t = 0;
    
    if(line == 4) line = 1;
    else          line++;
 
  }
  
  if(a)
  {
    firstX = mouseX;
    firstY = mouseY;
 }
}

/*void mouseClicked() {

  firstX = random(600);
  firstY = random(600);
  
  secondX = random(600);
  secondY = random(600);
  
  thirdX = random(600);
  thirdY = random(600);
  
  fourthX = random(600);
  fourthY = random(600);
  
  x = firstX;
  y = firstY;
  
  Ux1 = secondX - firstX;
  Uy1 = secondY - firstY;
  
  Ux2 = thirdX - secondX;
  Uy2 = thirdY - secondY;
  
  Ux3 = fourthX - thirdX;
  Uy3 = fourthY - thirdY;
  
  Ux4 = firstX - fourthX;
  Uy4 = firstY - fourthY;
}*/

/*void mouseCLicked() while mouse clicked
{
 if(a){
  firstX = mouseX;
  firstY = mouseY;
 }
}*/

/*void mouseClicked()
{
 a = true; 
}

void mouseReleased()
{
  a = false;
}*/
