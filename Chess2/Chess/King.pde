class King extends Piece{
  
  King(PImage image, int col, int row, boolean teamColor){
    super(image,col,row,teamColor);
  }
  
  public boolean isValidMove(int x, int y){
    return false;
  }
  
  
  public ArrayList<int[]> validMoves(){
    ArrayList<int[]> f = new ArrayList<int[]>();
    return f;
  }
  public boolean move(int newX, int newY){
    //action
    return isValidMove(newX,newY);
  }
}
