class Queen extends Piece{
  
  Queen(PImage image, int x, int y, boolean teamColor){
    super(image,x,y,teamColor);
  }
  
  public boolean isValidMove(int x, int y){
    return false;
  }
  
  
  public int[][] validMoves(){
    int myX = this.getX();
    int myY = this.getY();
    
    while (myX > 0 && b.get(myX-1,y)!=null){
      if (b.get(myX-1,y).getColor() != this.getColor()){
        //ADD to validMovesList
      }
      myX--;
    }
    myX = this.getX();
    while (myX < 8 && b.get(myX+1,y)!=null){
      if (b.get(myX+1,y).getColor() != this.getColor()){
        //ADD to validMovesList
      }
      myX++;
    }
    myX = this.getX();
    while (myY > 0 && b.get(myX,myY-1) != null){
      if (b.get(myX,myY-1).getColor() != this.getColor()){
        //ADD to validMovesList
      }
    }
    myY = this.getY();
    while (myY < 8 && b.get(myX,myY+1) != null){
      if (b.get(myX,myY+1).getColor() != this.getColor()){
        //ADD to validMovesList
      }
    }
    myY = this.getY();
    
    return new int[0][0];
  }
  
  public boolean move(int newX, int newY){
    //action
    return isValidMove(newX,newY);
  }
}
