float Ix, Iy;        //punt inicial
float Fx, Fy;        //punt final
float Mx, My;        //tercer punt
float Nx, Ny;        //tercer punt

float Ux1, Uy1;      //vector linea 1
float Ux2, Uy2;      //vector linea 2
float Ux3, Uy3;      //vector linea 3
float Ux4, Uy4;      //vector linea 4

float x, y;          //punt de la recta
float t;            //t
float tMax = 1;    //com a minim en linees rectes i tal com esta fet el vector, = 1

int line;     //determina quina linea recorre el punt

int divLine = 10;   //divisions line

float[] PLx1 = new float [divLine];     //punts linea, 10 divisions
float[] PLy1 = new float [divLine]; 

float[] PLx2 = new float [divLine];
float[] PLy2 = new float [divLine]; 

float[] PLx3 = new float [divLine];
float[] PLy3 = new float [divLine]; 

float[] PLx4 = new float [divLine];
float[] PLy4 = new float [divLine]; 

void setup() {
  size(300, 300);
  
  line = 1;
  
  Ix = random(300);
  Iy = random(300);
  
  Fx = random(300);
  Fy = random(300);
  
  Mx = random(300);
  My = random(300);
  
  Nx = random(300);
  Ny = random(300);
  
  x = Ix;
  y = Iy;
  
  Ux1 = Fx - Ix;
  Uy1 = Fy - Iy;
  
  Ux2 = Mx - Fx;
  Uy2 = My - Fy;
  
  Ux3 = Nx - Mx;
  Uy3 = Ny - My;
  
  Ux4 = Ix - Nx;
  Uy4 = Iy - Ny;
  
  t = 0;
}

void draw() {
  background(255, 204, 0);
  
  switch(line){
    
    case 1:
    x = Ix + t * Ux1;
    y = Iy + t * Uy1;
    break;
    
    case 2:
    x = Fx + t * Ux2;
    y = Fy + t * Uy2;
    break;
    
    case 3:
    x = Mx + t * Ux3;
    y = My + t * Uy3;
    break;
    
    case 4:
    x = Nx + t * Ux4;
    y = Ny + t * Uy4;
    break;
  }
  
  //////////////////////////////////////////////////1
  
  PLx1[0] = Ix;
  PLy1[0] = Iy;
  
  ellipse(PLx1[0], PLy1[0], 2, 2);
  
  for(int i = 1; i < divLine; i++)
  {
      PLx1[i] = Ix + (i * (tMax/divLine)) * Ux1;
      PLy1[i] = Iy + (i * (tMax/divLine)) * Uy1;
      
      line(PLx1[i-1], PLy1[i-1], PLx1[i], PLy1[i]);  //quan linea curva, trobar molts punts i tirar les lines entre ells
      ellipse(PLx1[i], PLy1[i], 2, 2);
}
  
  line(PLx1[divLine - 1], PLy1[divLine - 1], Fx, Fy);
  ellipse(Fx, Fy, 2, 2);
  
  //////////////////////////////////////////////////2
   
  PLx2[0] = Fx;
  PLy2[0] = Fy;
  
  ellipse(PLx2[0], PLy2[0], 2, 2);
  
  for(int i = 1; i < divLine; i++)
  {
      PLx2[i] = Fx + (i * (tMax/divLine)) * Ux2;
      PLy2[i] = Fy + (i * (tMax/divLine)) * Uy2;
      
      line(PLx2[i-1], PLy2[i-1], PLx2[i], PLy2[i]);  //quan linea curva, trobar molts punts i tirar les lines entre ells
      ellipse(PLx2[i], PLy2[i], 2, 2);
}
  
  line(PLx2[divLine - 1], PLy2[divLine - 1], Mx, My);
  ellipse(Mx, My, 2, 2);
   
  //////////////////////////////////////////////////3
    
  PLx3[0] = Mx;
  PLy3[0] = My;
  
  ellipse(PLx3[0], PLy3[0], 2, 2);
  
  for(int i = 1; i < divLine; i++)
  {
      PLx3[i] = Mx + (i * (tMax/divLine)) * Ux3;
      PLy3[i] = My + (i * (tMax/divLine)) * Uy3;
      
      line(PLx3[i-1], PLy3[i-1], PLx3[i], PLy3[i]);  //quan linea curva, trobar molts punts i tirar les lines entre ells
      ellipse(PLx3[i], PLy3[i], 2, 2);
}
  
  line(PLx3[divLine - 1], PLy3[divLine - 1], Nx, Ny);
  ellipse(Nx, Ny, 2, 2);
    
  //////////////////////////////////////////////////4
  
  PLx4[0] = Nx;
  PLy4[0] = Ny;
  
  ellipse(PLx4[0], PLy4[0], 2, 2);
  
  for(int i = 1; i < divLine; i++)
  {
      PLx4[i] = Nx + (i * (tMax/divLine)) * Ux4;
      PLy4[i] = Ny + (i * (tMax/divLine)) * Uy4;
      
      line(PLx4[i-1], PLy4[i-1], PLx4[i], PLy4[i]);  //quan linea curva, trobar molts punts i tirar les lines entre ells
      ellipse(PLx4[i], PLy4[i], 2, 2);
}
  
  line(PLx4[divLine - 1], PLy4[divLine - 1], Ix, Iy);
  ellipse(Ix, Iy, 2, 2);
    
  //////////////////////////////////////////////////
  
  ellipse(x, y, 5, 5);
  
  t += 0.005;
  
  switch(line){
    
    case 1:
 
     if(Ux1 > 0){
        if(x > Fx){
          t = 0;
          line = 2;
        }
      }
      else if (Ux1 < 0){
        if(x < Fx){
          t = 0;
          line = 2;
        }
      }
      else{
          t = 0;
          line = 2;
        }
      
      if(Uy1 > 0){
        if(y > Fy){
          t = 0;
          line = 2;
        }
      }
      else if (Uy1 < 0){
        if(y < Fy){
          t = 0;
          line = 2;
        }
      }
      else{
          t = 0;
          line = 2;
        }
 
    break;
    
    case 2:
    
      if(Ux2 > 0){
          if(x > Mx){
            t = 0;
            line = 3;
          }
        }
        else if (Ux2 < 0){
          if(x < Mx){
            t = 0;
            line = 3;
          }
        }
        else{
            t = 0;
            line = 3;
          }
        
        if(Uy2 > 0){
          if(y > My){
            t = 0;
            line = 3;
          }
        }
        else if (Uy2 < 0){
          if(y < My){
            t = 0;
            line = 3;
          }
        }
        else{
            t = 0;
            line = 3;
          }

    break;
    
    case 3:

        if(Ux3 > 0){
          if(x > Nx){
            t = 0;
            line = 4;
          }
        }
        else if (Ux3 < 0){
          if(x < Nx){
            t = 0;
            line = 4;
          }
        }
        else{
            t = 0;
            line = 4;
          }
        
        if(Uy3 > 0){
          if(y > Ny){
            t = 0;
            line = 4;
          }
        }
        else if (Uy3 < 0){
          if(y < Ny){
            t = 0;
            line = 4;
          }
        }
        else{
            t = 0;
            line = 4;
          }

    break;
    
    case 4:

        if(Ux4 > 0){
          if(x > Ix){
            t = 0;
            line = 1;
          }
        }
        else if (Ux4 < 0){
          if(x < Ix){
            t = 0;
            line = 1;
          }
        }
        else{
            t = 0;
            line = 1;
          }
        
        if(Uy4 > 0){
          if(y > Iy){
            t = 0;
            line = 1;
          }
        }
        else if (Uy4 < 0){
          if(y < Iy){
            t = 0;
            line = 1;
          }
        }
        else{
            t = 0;
            line = 1;
          }

    break;
    
  }
}

void mouseClicked() {

  Ix = random(300);
  Iy = random(300);
  
  Fx = random(300);
  Fy = random(300);
  
  Mx = random(300);
  My = random(300);
  
  Nx = random(300);
  Ny = random(300);
  
  x = Ix;
  y = Iy;
  
  Ux1 = Fx - Ix;
  Uy1 = Fy - Iy;
  
  Ux2 = Mx - Fx;
  Uy2 = My - Fy;
  
  Ux3 = Nx - Mx;
  Uy3 = Ny - My;
  
  Ux4 = Ix - Nx;
  Uy4 = Iy - Ny;
}
