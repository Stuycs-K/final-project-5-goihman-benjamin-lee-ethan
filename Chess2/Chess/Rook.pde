class Rook extends Piece{
  
  Rook(PImage image, int col, int row, boolean teamColor){
    super(image,col,row,teamColor);
  }
  
  public boolean isValidMove(int col, int row){  
    return validMoves().contains(new int[]{col,row});
  }
  
  
  public ArrayList <int[]> validMoves(){
     ArrayList<int[]> endList = new ArrayList<int[]>();
    int col = this.getCol();
    int row = this.getRow();
    
    while (col > 0 && row>0|| b.get(col,row)!=null){
      if (b.get(col,row)==null||(b.get(col,row) != null && b.get(col,row)==null||b.get(col,row).getColor() != this.getColor())){
        int[] f = {col,row};
        endList.add(f);
      }
      col--;
    }
    col = this.getCol();
    row = this.getRow();
    while (col < 8 && row<8|| b.get(col,row)!=null){

      if (b.get(col,row)==null||(b.get(col,row) != null && b.get(col,row)==null||b.get(col,row).getColor() != this.getColor())){
        int[] f = {col,row};
        endList.add(f);
      }
      col++;
    }
    col = this.getCol();
    row = this.getRow();
    while (row > 0 && col < 8|| b.get(col,row) != null){
      if (b.get(col,row)==null||(b.get(col,row) != null && b.get(col,row)==null||b.get(col,row).getColor() != this.getColor())){
        int[] f = {col,row};
        endList.add(f);
      }
      row--;
    }

    col = this.getCol();
    row = this.getRow();
    while (b.get(col,row) != null && row < 8 && col >0|| b.get(col,row) != null){
      if (b.get(col,row)==null||(b.get(col,row) != null && b.get(col,row)==null||b.get(col,row).getColor() != this.getColor())){
        int[] f = {col,row};
        endList.add(f);
      }
      row++;
    }
    
    return endList;
  }
  

}
