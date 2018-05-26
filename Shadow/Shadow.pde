PVector v1;
PVector v2;
PVector v3;
PVector v4;
PVector v5;

PVector v1_;
PVector v2_;
PVector v3_;
PVector v4_;
PVector v5_;

PVector v1_1;
PVector v2_1;
PVector v3_1;
PVector v4_1;
PVector v5_1;

float a;
float ang;

void setup()
{
  
 size(1080, 720, P3D);
 
 a = 1.5;
 ang = 0.01;
 
 v1 = new PVector(-100, -100, 300);
 v2 = new PVector( 100, -100, 300);
 v3 = new PVector(   0,    0, 400);
 v4 = new PVector( 100,  100, 300);
 v5 = new PVector(-100,  100, 300);
     
 v1_ = new PVector(v1.x, a*v1.y, 0);
 v2_ = new PVector(v2.x, a*v2.y, 0);
 v3_ = new PVector(v3.x, a*v3.y, 0);
 v4_ = new PVector(v4.x, a*v4.y, 0);
 v5_ = new PVector(v5.x, a*v5.y, 0);

 v1_1 = new PVector(v1.x + 2 * v1.y, 3 * v1.x + 2 * v1.y, 0);
 v2_1 = new PVector(v2.x + 2 * v2.y, 3 * v2.x + 2 * v2.y, 0);
 v3_1 = new PVector(v3.x + 2 * v3.y, 3 * v3.x + 2 * v3.y, 0);
 v4_1 = new PVector(v4.x + 2 * v4.y, 3 * v4.x + 2 * v4.y, 0);
 v5_1 = new PVector(v5.x + 2 * v5.y, 3 * v5.x + 2 * v5.y, 0);

}

void draw()
{
  background(255, 255, 0);
  camera(width/20.0, height/20.0, (height/2.0) / tan(PI*30.0 / 180.0), width, height/1.25, 0, -1, -1, -1);
  lights();
 
 /////////////////////////////////////////////////////////
 
 //ROT en Z
 
  v1 = new PVector(cos(ang) * v1.x - sin(ang) * v1.y, sin(ang) * v1.x + cos(ang) * v1.y, v1.z);
  v2 = new PVector(cos(ang) * v2.x - sin(ang) * v2.y, sin(ang) * v2.x + cos(ang) * v2.y, v2.z);
  v4 = new PVector(cos(ang) * v4.x - sin(ang) * v4.y, sin(ang) * v4.x + cos(ang) * v4.y, v4.z);
  v5 = new PVector(cos(ang) * v5.x - sin(ang) * v5.y, sin(ang) * v5.x + cos(ang) * v5.y, v5.z);
  
  ////////////////////////////////////////////////////////
  
  //ROT en X
  
  v1 = new PVector(v1.x, v1.y, v1.z - v3.z);
  v2 = new PVector(v2.x, v2.y, v2.z - v3.z);
  v4 = new PVector(v4.x, v4.y, v4.z - v3.z);
  v5 = new PVector(v5.x, v5.y, v5.z - v3.z);
  
  v1 = new PVector(v1.x, cos(ang) * v1.y - sin(ang) * v1.z, sin(ang) * v1.y + cos(ang) * v1.z);
  v2 = new PVector(v2.x, cos(ang) * v2.y - sin(ang) * v2.z, sin(ang) * v2.y + cos(ang) * v2.z);
  v4 = new PVector(v4.x, cos(ang) * v4.y - sin(ang) * v4.z, sin(ang) * v4.y + cos(ang) * v4.z);
  v5 = new PVector(v5.x, cos(ang) * v5.y - sin(ang) * v5.z, sin(ang) * v5.y + cos(ang) * v5.z);
  
  v1 = new PVector(v1.x, v1.y, v1.z + v3.z);
  v2 = new PVector(v2.x, v2.y, v2.z + v3.z);
  v4 = new PVector(v4.x, v4.y, v4.z + v3.z);
  v5 = new PVector(v5.x, v5.y, v5.z + v3.z);
  
  ///////////////////////////////////////////////////////////
  
  //UPDATE SHADOWS POINTS
  
  v1_ = new PVector(v1.x, a*v1.y, 0);
  v2_ = new PVector(v2.x, a*v2.y, 0);
  v3_ = new PVector(v3.x, a*v3.y, 0);
  v4_ = new PVector(v4.x, a*v4.y, 0);
  v5_ = new PVector(v5.x, a*v5.y, 0);

  v1_1 = new PVector(v1.x + 2* v1.y, 3* v1.x + 2 * v1.y, 0);
  v2_1 = new PVector(v2.x + 2* v2.y, 3* v2.x + 2 * v2.y, 0);
  v3_1 = new PVector(v3.x + 2* v3.y, 3* v3.x + 2 * v3.y, 0);
  v4_1 = new PVector(v4.x + 2* v4.y, 3* v4.x + 2 * v4.y, 0);
  v5_1 = new PVector(v5.x + 2* v5.y, 3* v5.x + 2 * v5.y, 0);
  
  ////////////////////////////////////////////////////////////
  
  //DRAW PYRAMID
  
  translate(width/2, height/2); //////ULL!!!!!!!!!!!!!!!!!!!!-> fer amb llibreria????????????
  stroke(0);
  fill(200, 255);
  
  beginShape();
   vertex(v1.x, v1.y, v1.z);
   vertex(v2.x, v2.y, v2.z);
   vertex(v3.x, v3.y, v3.z);
 endShape(CLOSE);
    
 beginShape();
   vertex(v2.x, v2.y, v2.z);
   vertex(v4.x, v4.y, v4.z);
   vertex(v3.x, v3.y, v3.z);
 endShape(CLOSE);
    
 beginShape();
   vertex(v4.x, v4.y, v4.z);
   vertex(v5.x, v5.y, v5.z);
   vertex(v3.x, v3.y, v3.z);
 endShape(CLOSE);
    
 beginShape();
   vertex(v5.x, v5.y, v5.z);
   vertex(v1.x, v1.y, v1.z);
   vertex(v3.x, v3.y, v3.z);
 endShape(CLOSE);
 
  beginShape();
   vertex(v1.x, v1.y, v1.z);
   vertex(v2.x, v2.y, v2.z);
   vertex(v4.x, v4.y, v4.z);
   vertex(v5.x, v5.y, v5.z);
 endShape(CLOSE);

////////////////////////////////////////////

//DRAW SHADOW 1

 fill(0);
 noStroke();

 beginShape();
   vertex(v1_.x, v1_.y, v1_.z);
   vertex(v2_.x, v2_.y, v2_.z);
   vertex(v3_.x, v3_.y, v3_.z);
 endShape(CLOSE);
    
 beginShape();
   vertex(v2_.x, v2_.y, v2_.z);
   vertex(v4_.x, v4_.y, v4_.z);
   vertex(v3_.x, v3_.y, v3_.z);
 endShape(CLOSE);
    
 beginShape();
   vertex(v4_.x, v4_.y, v4_.z);
   vertex(v5_.x, v5_.y, v5_.z);
   vertex(v3_.x, v3_.y, v3_.z);
 endShape(CLOSE);
    
 beginShape();
   vertex(v5_.x, v5_.y, v5_.z);
   vertex(v1_.x, v1_.y, v1_.z);
   vertex(v3_.x, v3_.y, v3_.z);
 endShape(CLOSE);
 
  beginShape();
   vertex(v1_.x, v1_.y, v1_.z);
   vertex(v2_.x, v2_.y, v2_.z);
   vertex(v4_.x, v4_.y, v4_.z);
   vertex(v5_.x, v5_.y, v5_.z);
 endShape(CLOSE);
 
 ////////////////////////////

//DRAW SHADOW 2

/*fill(30);

 beginShape();
    vertex(v1_1.x, v1_1.y, v1_1.z);
    vertex(v2_1.x, v2_1.y, v2_1.z);
    vertex(v3_1.x, v3_1.y, v3_1.z);
 endShape(CLOSE);
    
 beginShape();
    vertex(v2_1.x, v2_1.y, v2_1.z);
    vertex(v4_1.x, v4_1.y, v4_1.z);
    vertex(v3_1.x, v3_1.y, v3_1.z);
    endShape(CLOSE);
    
 beginShape();
    vertex(v4_1.x, v4_1.y, v4_1.z);
    vertex(v5_1.x, v5_1.y, v5_1.z);
    vertex(v3_1.x, v3_1.y, v3_1.z);
 endShape(CLOSE);
    
 beginShape();
    vertex(v5_1.x, v5_1.y, v5_1.z);
    vertex(v1_1.x, v1_1.y, v1_1.z);
    vertex(v3_1.x, v3_1.y, v3_1.z);
 endShape(CLOSE);
 
  beginShape();
    vertex(v1_1.x, v1_1.y, v1_1.z);
    vertex(v2_1.x, v2_1.y, v2_1.z);
    vertex(v4_1.x, v4_1.y, v4_1.z);
    vertex(v5_1.x, v5_1.y, v5_1.z);
 endShape(CLOSE);*/
  
  //////////////////////////////////////////////////
  
  //DRAW GROUND
  
  translate(200, 200, -300);  //////ULL!!!!!!!!!!!!!!!!!!!!-> fer amb llibreria????????????
  fill(208, 180, 160);
  box(1000, 1000, 100);
}
