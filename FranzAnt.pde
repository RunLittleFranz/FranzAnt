/*
Made in RunLittleFranz
C# > Java
DELUK's ANT or Langton's ANT
better Deluk



Rip
*/


// Side of Boxes
int boxSide;


//Map of Boxes => Box.pde
Box[][] boxes;


//Schema of color related with Moving Schema
color[] colorSchema = new color[] {color(0) ,color(0,255,0), color(0,0,255),color(255,255,0)};  //<>//
// Moving Schema Related With Color Schema                                      
//BLACK => LEFT; GREEN => RIGHT; BLUE => UP; YELLOW => DOWN; :^
String[] movingSchema = new String[] {"LEFT", "RIGHT","UP","DOWN" };


//Our Ant
Ant ant;


// Controll if the user started the Ant
boolean selected = false;


void setup() {
  frameRate(30);
  size(800,600);
  
  //Setting Side of the Box
  //TODO: setting function
  boxSide = 5; //<>// //<>//
  
  //loading the boxes map
  boxes = loadBoxes(colorSchema, boxSide);
  
  //display the boxes as background
  displayBoxes(boxes);
}

void draw(){
  if(selected){
    //Main point of the program
      boxes = ant.move(boxes);
      //delay(1500);
  }
}

// the user can choose the starting point of the ant
void mousePressed(){
  try{
    if(!selected && boxes != null){
      
      //get the box clicked
      Box box = getClickedBox(mouseX, mouseY, boxes);
      
      //setting the ant and display the position color => RED
      ant = new Ant(box, color(255,0,0), movingSchema);
      ant.getBox().display();
      
      //start Main 
      selected = true;
    }
  } 
  catch(Exception ex){
   println(ex);
   selected = false;
 }
}


//load the boxes array
Box[][] loadBoxes(color[] schema, float boxS){
  // width / boxS(the size of the box) returns the number of total boxes on the X
  Box[][] tempBoxes = new Box[int(width/boxS)][int(height/boxS)];
  for(int i = 0; i < width/boxS; i++){
   for(int j = 0; j < height/boxS; j++){
      tempBoxes[i][j] = new Box(i*boxS, j*boxS, boxS);
      tempBoxes[i][j].loadSchema(schema);
   }
  }
  return tempBoxes;
}

//display all boxes 
void displayBoxes(Box[][] boxes){
 for(Box[] boxs : boxes){
  for(Box box : boxs){
    box.display();
  }
 }
}

//get the clicked Box
Box getClickedBox(float x, float y, Box[][] boxes){ // 
 for(Box[] boxs : boxes){
  for(Box box : boxs){
     float[][] area = box.getPoints();
     float[] point = new float[]{x,y};
     if(isContained(area, point)){
       println(box.getColor());
       return box;
     }
  }
 }
 return null;
}

//check if a point is contained in an area
boolean isContained(float[][] area, float[] point){
  return(area[0][0] <= point[0] && point[0] < area[1][0] && area[0][1] <= point[1] && point[1] < area[1][1]);
} // { {this.x, this.y}, {this.x + this.w, this.y + this.h} }; 