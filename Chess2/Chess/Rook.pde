class Rook extends Piece{
  
  Rook(PImage image, int col, int row, boolean teamColor){
    super(image,col,row,teamColor);
  }
  
  public boolean isValidMove(int col, int row){  
    return validMoves().contains(new int[]{col,row});
  }
  
  
  public ArrayList<int[]> validMoves(){
     ArrayList<int[]> endList = new ArrayList<int[]>();
    int col = this.getCol();
    int row = this.getRow();
    
    while (col > 0 && b.get(col-1,row)!=null){
      if (b.get(col-1,row).getColor() != this.getColor()){
        int[] f = {col-1,row};
        endList.add(f);
      }
      col--;
    }
    col = this.getCol();
    while (col < 8 && b.get(col+1,row)!=null){
      if (b.get(col+1,row).getColor() != this.getColor()){
        int[] f = {col+1,row};
        endList.add(f);

      }
      col++;
    }
    col = this.getCol();
    while (row > 0 && b.get(col,row-1) != null){
      if (b.get(col,row-1).getColor() != this.getColor()){
        int[] f = {col,row-1};
        endList.add(f);
      }
      row--;
    }
    row = this.getRow();
    while (row < 8 && b.get(col,row+1) != null){
      if (b.get(col,row+1).getColor() != this.getColor()){
        int[] f = {col,row+1};
        endList.add(f);
      }
      row++;
    }
    
    return endList;
  }
  
  public boolean move(int newX, int newY){
    //action
    return false;
  }
}
