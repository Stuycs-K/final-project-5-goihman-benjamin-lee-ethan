class Queen extends Piece{
  
  Queen(PImage image, int col, int row, boolean teamColor){
    super(image,col,row,teamColor);
  }
  
 
  
  public ArrayList<int[]> validMoves(){
     ArrayList<int[]> endList = new ArrayList<int[]>();
    return endList;
  }
  
  
  public boolean move(int newX, int newY){
    //action
    return isValidMove(newX,newY);
  }
}
