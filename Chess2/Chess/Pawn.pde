class Pawn extends Piece{
  
  Pawn(PImage image, int x, int y, boolean teamColor){
    super(image,x,y,teamColor);
  }
  
  public boolean isValidMove(int x, int y){
    return false;
  }
  public int[][] validMoves(){
    return new int[0][0];
  }
  public boolean move(int newX, int newY){
    if (isValidMove(x,y)){
      //action
      return true;
    }
    return false;
  }
}
