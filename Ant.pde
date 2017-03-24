// I LOVE EATING ANTS
// RunLittleFranz
class Ant{
  //Current Box 
  private Box currentBox;
  
  //Background Color
  private color bgColor = color(0);
  
  //Schema of moves
  private String[] movingSchema;
  
  //a simple reference System  
  private final String[] refSystem = new String[] { "N", "E", "S", "W"};
  
  // pointer of the Reference System
  private int currentRef = 0;
  
  //just for debugging
  private String raise; 
  
  public Ant(Box startingBox, color clr, String[] movingSchema){
    this.movingSchema = movingSchema;
    this.bgColor = clr;
    setBox(startingBox);
  }
  
  // GET: get the ant Box
  public Box getBox(){
   return this.currentBox; 
  }
  
  //SET: set the Box and the color
  public void setBox(Box box){
   this.currentBox = box; 
   this.currentBox.setColor(this.bgColor);
  }
    
   //load the boxes map and query the input
  public Box[][] move(Box[][] boxes){
    
    //Status of the box
   int boxStatus = this.currentBox.getStatus();
   
   //Status => Direction
   String moveDirection = movingSchema[boxStatus];
   
   try{
    switch(moveDirection){
      case "UP":
        moveUp();
        break;
      case "DOWN":
        moveDown();
        break;
      case "RIGHT":
        moveRight();
        break;        
      case "LEFT":
        moveLeft();
        break;
    }
   }
   catch(Exception ex){
     println(ex);
   }
   return moveQuery(boxes);
  }
  
  //moving the ant up
  private void moveUp(){
    try{
      //keep the state
    }
    catch(Exception ex){
      println(ex);
    }
  }
  
  //moving the ant down
  private void moveDown(){
    try{
      //180 degress
      currentRef += 2; 
      // raise the error
      raise = refSystem[currentRef]; 
    }
    catch(Exception ex){
      currentRef -= 6;
      moveDown();
    }
  }
  
  private void moveRight(){
    try{
      // 90 degress => RIGHT
      currentRef += 1;
      //raise the error
      raise = refSystem[currentRef];
    }
    catch(Exception ex){
      currentRef = 0;
    }    
    
  }
  
  private void moveLeft(){
    try{
      // 90 degress => LEFT
      currentRef -= 1;
      //raise the error
      raise = refSystem[currentRef];
    }
    catch(Exception ex){
      currentRef = 3;
    }     
  }
  
  // according with the reference system the program selects the patter of the ant
  private Box[][] moveQuery(Box[][] boxes){
    try{
      float[] points = this.currentBox.getPoints()[0];
      float size = this.currentBox.getSize();
      Box tempBox = boxes[int(points[0] / size)][int(points[1] / size)] = this.currentBox; // UPDATE THE MAP
      tempBox.update(); // UPDATE the box status 
      switch(refSystem[currentRef]){
        case "N":
            points[1] -= size; // UP
          break;
        case "E":
            points[0] += size; // RIGTH
          break;
        case "S":
            points[1] += size; // DOWN
          break;
        case "W":
            points[0] -= size; // LEFT
          break;
      }
      this.currentBox = boxes[int(points[0] / size)][int(points[1] / size)]; // Get the new box
      this.currentBox.setColor(bgColor); // set the color
      this.currentBox.display();
    }
    catch(Exception ex){
      println(ex);
    }
    return boxes;
  }
  
}