//https://forum.processing.org/one/topic/3d-box-vertices.html

PShape cabin;
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

void setup()
{
 size(1040, 860, P3D); 
 
 //cabin = loadShape("Cabin.obj");
 
 v1 = new PVector(-100, -100, 300);
  v2 = new PVector(100, -100, 300);
   v3 = new PVector(0,    0,  400);
    v4 = new PVector(100,  100, 300);
     v5 = new PVector(-100, 100, 300);
     
a = 2;

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
}

void draw()
{
  background(255, 255, 0);
  camera(width/8.0, height/6.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  lights();
  
  translate(width/2, height/2);
  stroke(0);
  //fill(127);
  noFill();
  //rotateY(45);
  rotateX(45);
  
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

 fill(180);

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

fill(30);

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
 endShape(CLOSE);

 
  /*translate(width/2, height/2);
  scale(0.1, 0.1, 0.1);
  rotateY(10);
  rotateX(5);*/
  
  //cabin = cabin * 3;
  
  //shape(cabin, 0, 0);
  /*
  translate(width/2, height/2, 0);
  stroke(0);
  rotateX(PI/2);
  rotateZ(-PI/6);
  fill(15);
  
  
  beginShape();
    vertex(-100, -100, -100);
    vertex( 100, -100, -100);
    vertex(   0,    0,  100);
    
    
    vertex( 100, -100, -100);
    vertex( 100,  100, -100);
    vertex(   0,    0,  100);
    
    vertex( 100, 100, -100);
    vertex(-100, 100, -100);
    vertex(   0,   0,  100);
    
    vertex(-100,  100, -100);
    vertex(-100, -100, -100);
    vertex(   0,    0,  100);
endShape(CLOSE);*/
  
  //translate();
  //scale(1, 0.0001, 1);
  //shape(cabin, 0, 0);
}
