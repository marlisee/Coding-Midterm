import ddf.minim.*; 
PImage foodlogo; 
PImage Idlenoeyes; 
PImage heart; 
PImage [] food; 
float x;
float y;
float easing = 0.05;
PVector circle = new PVector(573, 447);
PVector circle1 = new PVector(644, 449);
int radius = 20; 
boolean heart1 = false;
boolean foodPressed = false;
long lastTime;
long timeToWait = 800;
AudioPlayer bgm; 
Minim minim; 

void setup () {
  size (1280, 1080); 
  ellipseMode(RADIUS);
  background(197, 242, 229); 
  minim = new Minim (this); 
  bgm = minim.loadFile("9AM.mp3");
  bgm.play();
  bgm.loop();
  
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
}

void draw() {

  background(197, 242, 229); 
  image(foodlogo, 100, 95); 

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
  
  for (int i = 0; i < food.length; i++) {
    image(food[i], i + 100, i*200);
  }
  
  println (mouseX +"," + mouseY);
  if (heart1){
  image(heart, 451, 349); 
  if (millis() - lastTime > timeToWait)
    {
      heart1 = false;
      lastTime = millis();
    }
  }
  
  }
  
  void mousePressed() {
   if (mouseX > 524 && mouseX < 785 && mouseY > 364 && mouseY < 534) {
    heart1 = true;
   }
   if (mouseX > 144 && mouseX < 252 && mouseY > 117 && mouseY < 262) {
   foodPressed = true; 
   println("foodpressed"); 
   }
  }