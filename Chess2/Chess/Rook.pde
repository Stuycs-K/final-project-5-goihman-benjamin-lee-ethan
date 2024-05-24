class Rook extends Piece{
  
  Rook(PImage image, int x, int y, boolean teamColor){
    super(image,x,y,teamColor);
  }
  
  public boolean isValidSquare(int x, int y){
    int myX = this.getX();
    int myY = this.getY();
    if ((myX == x || myY == y) && (myX != x && myY !=y)){
      return true;
    }
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
