import ddf.minim.*; 
PImage foodlogo; 
PImage Idlenoeyes; 
PImage heart; 
PImage [] food; 
float x;
float y;
float easing = 0.05;
int time;
PVector circle = new PVector(573, 447);
PVector circle1 = new PVector(644, 449);
int radius = 20; 
int loveLevel; 
boolean heart1 = false;
boolean foodPressed = false;
boolean SpaghettiPressed = false; 
boolean BurgerPressed = false; 
boolean ChickenPressed = false; 
boolean DonutPressed = false; 
boolean SushiPressed = false; 
long lastTime;
long timeToWait = 800;
long FoodPressedWait = 5000; 
AudioPlayer bgm; 
Minim minim; 

void setup () {
  background(245, 207, 182); 
  size (1280, 1080); 
  ellipseMode(RADIUS);
  minim = new Minim (this); 
  bgm = minim.loadFile("9AM.mp3");
  bgm.play();
  bgm.loop();
  loveLevel = 0; 
  
  heart = loadImage ("heart.png");
  heart.resize(80, 80); 
  
  food = new PImage[5];
  for (int i = 0; i < 5; i++) {
    food[i] = loadImage("food_" + int(i + 1) + ".png"); 
  }
  
  foodlogo = loadImage ("foodlogo.png"); 
  foodlogo.resize(200, 200); 
  
  Idlenoeyes = loadImage ("Idlenoeye.png"); 
  Idlenoeyes.resize(400, 300); 
  tint(255, 255); 

  smooth();
  
  lastTime = millis();
  
  background(245, 207, 182); 
}

void draw() {

  background(245, 207, 182); 
  image(foodlogo, 50, 95); 

  //Idle 
  image (Idlenoeyes, 450, 300);
  
  PVector m = new PVector(mouseX, mouseY);
  if (dist(m.x, m.y, circle.x, circle.y) > radius/2) {
    m.sub(circle);
    m.normalize();
    m.mult(radius/2);
    m.add(circle);
  }
  fill(1);
  ellipse(m.x, m.y, 13, 15);
 
   PVector m1 = new PVector(mouseX, mouseY);
  if (dist(m1.x, m1.y, circle1.x, circle1.y) > radius/2) {
    m1.sub(circle1);
    m1.normalize();
    m1.mult(radius/2);
    m1.add(circle1);
  }
  fill(1);
  ellipse(m1.x, m1.y, 13, 15);
  
  x = x + (m.x - x) * easing;
  y = y + (m.y - y) * easing;
 
  //println (mouseX +"," + mouseY);
  
  if (heart1){
  image(heart, 451, 349); 
  if (millis() - lastTime > timeToWait)
    {
      heart1 = false;
      lastTime = millis();
    }
  }
  if(foodPressed){
      for (int i = 0; i < food.length; i++) {
        image(food[i], i* 200 + 200, i +150);   
      }
   }
}

  
  void mousePressed() {
   if (mouseX > 524 && mouseX < 785 && mouseY > 364 && mouseY < 534) {
    heart1 = true;
   }
   if (mouseX > 100 && mouseX < 200 && mouseY > 100 && mouseY < 250) {
    foodPressed = true; 
    //if(mousePressed){
    // foodPressed = false;  
      }
  if(mouseX>264 && mouseX < 414 && mouseY > 210 && mouseY < 266) {
    SpaghettiPressed = true; 
    loveLevel = loveLevel + 10; 
  }
  if(mouseX > 490 && mouseX < 600 && mouseY > 184 && mouseY < 277) {
    BurgerPressed = true; 
    loveLevel = loveLevel + 20; 
    }
  if(mouseX > 710 && mouseX < 787 && mouseY > 163 && mouseY < 301) {
    ChickenPressed = true; 
       loveLevel = loveLevel - 10; 
  }
  if(mouseX > 900 && mouseX < 997 && mouseY > 183 && mouseY < 277) {
    DonutPressed = true; 
    loveLevel = loveLevel + 35; 
  } 
  if(mouseX > 1084 && mouseX < 1204 && mouseY > 212 && mouseY < 255) {
    SushiPressed = true; 
    loveLevel = loveLevel + 30; 
  }
     if (loveLevel > 100) {
     println("feeling loved!");
   }
   
 }
    
    
   
  
 