class Queen extends Piece{
  
  Queen(PImage image, int x, int y, boolean teamColor){
    super(image,x,y,teamColor);
  }
  
  public boolean isValidMove(){
    return false;
  }
  public int[][] validMoves(){
    return new int[0][0];
  }
}
