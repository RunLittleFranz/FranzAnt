// BOX FOR THE GRID
// RunLittleFranz
 class Box{
  
   //coordinates and size 
  private float x,y,s;
  
  //background color
  private color bgColor = color(0);
  
  //Color schema
  private color[] schema;
  
  //pointer of color schema
  private int currentStatus = 0;
  
  //constructor with positions
  public Box(float x, float y, float s ){
    this.x = x;
    this.y = y;
    this.s = s;
  }
  
   public Box(float s ){
      this(0,0,s);
   }
  
  //display the box
  public void display(float x, float y){
    fill(bgColor);
    rect(x, y, this.s, this.s);
    
  }
  
  //override of display
  public void display(){
    display(this.x,this.y);
  }
  
  //load Color schema
  public void loadSchema(color[] schema){
    this.schema = schema;
    setColor(schema[0]);

  }
  
  //update the status of the box
  public void update(){
    this.currentStatus += 1;
    setStatus(currentStatus);
    display();
  }
  
  //SET: set the backround color
  public void setColor(color clr){
    this.bgColor = clr;
  }
  
  //GET: get che background color
  public color getColor(){
    return bgColor; 
  }
  
  // SET: set the status of the box
  public void setStatus(int code){
    this.currentStatus = code;
    try{
      setColor(schema[code]);
    }
    catch(Exception ex){
      this.currentStatus = 0;
      setStatus(this.currentStatus);
      return;      
    }
  }
  
  //GET: get the box status
  public int getStatus() {
   return this.currentStatus; 
  }
  
  //GET: get the min and the max x,y
  public float[][] getPoints(){
    return new float[][] { {this.x, this.y}, {this.x + this.s, this.y + this.s} }; 
  }
  
  //SET: set the box pos
  public void setOrigin(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  //GET: get the box size
  public float getSize(){
   return this.s;
  }
  
  //SET: set the box size
  public void setSize(float s){
   this.s = s; 
  }
  
}