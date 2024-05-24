class King extends Piece{
  
  King(PImage image, int x, int y, boolean teamColor){
    super(image,x,y,teamColor);
  }
  
  public boolean isValidSquare(int x, int y){
    return false;
  }
  
  
  public int[][] validMoves(){
    return new int[0][0];
  }
  
  public boolean move(int newX, int newY){
    //action
    return isValidSquare(newX,newY);
  }
}
