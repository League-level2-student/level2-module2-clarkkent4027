//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment{
//Add x and y member variables. They will hold the corner location of each segment of the snake.
int x;
int y;
// Add a constructor with parameters to initialize each variable.
Segment(int x, int y){
this.x=x;
this.y=y;
}
}

//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
int foodX;
int foodY;
int direction = (UP);
int piecesOfFood;
ArrayList<Segment> tail = new ArrayList<Segment>();
//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*
Segment head;
void setup() {
size(500, 500);
head = new Segment(250, 250);
frameRate(20);
dropFood();
}
void dropFood() {
  //Set the food in a new random location
foodX = ((int)random(10)*50);
foodY = ((int)random(10)*50);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
 background(255, 255, 255); 
drawFood();
move();
drawSnake();
eat();
}

void drawFood() {
  //Draw the food
fill(255, 0, 0);
rect(foodX, foodY, 10, 10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
fill(0, 255, 0);
rect(head.x, head.y, 10, 10);
manageTail();
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail
  for (int i = 0; i < tail.size(); i++) {
  Segment s = tail.get(i);  
rect(s.x,s.y, 10, 10);
}
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  checkTailCollision();
  drawTail();
Segment e = new Segment(head.x, head.y);
tail.add(e);
tail.remove(0);
}
void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
   for (int i = 0; i < tail.size(); i++) {
  if(head.x == tail.get(i).x && head.y == tail.get(i).y){
  piecesOfFood = 0;
  Segment g = new Segment(head.x, head.y);
  tail.add(g);
   }
   }
}
//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void move() {
  //Change the location of the Snake head based on the direction it is moving.
    
  switch(direction) {
  case UP:
    if(direction != DOWN ){
      head.y -=10;
    }
    break;
  case DOWN:
   if(direction != UP ){
      head.y +=10;
   }
    break;
  case LEFT:
   if(direction != RIGHT){
     head.x -=10;
   }
    break;
  case RIGHT:
   if(direction != LEFT){
     head.x +=10;
   }
    break;
  }
    checkBoundaries(); 
}

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
   if(keyCode == UP && direction != DOWN){
    direction = UP; 
   }else if(keyCode == DOWN && direction != UP){
    direction = DOWN; 
    }else if(keyCode == LEFT && direction != RIGHT){
    direction = LEFT; 
    }else if(keyCode == RIGHT && direction != LEFT){
    direction = RIGHT; 
   }
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if(head.x >= width){
   head.x = 0;
}else if(head.y >= height){
 head.y = 0; 
}else if(head.x <= 0){
 head.x = width; 
}else if(head.y <= 0){
 head.y = height; }
}
void eat() {
  //When the snake eats the food, its tail should grow and more food appear
if(head.x == foodX && head.y == foodY){
piecesOfFood += 1;
drawFood();
dropFood();
}
   if(piecesOfFood += 1){
Segment m = new Segment(head.x, head.y);
tail.add(m);
}
}
