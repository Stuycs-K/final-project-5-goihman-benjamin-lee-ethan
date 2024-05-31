class Bishop extends Piece{
  
  Bishop(PImage image, int col, int row, boolean teamColor){
    super(image,col,row,teamColor);
  }
  

  
  public ArrayList <int[]> validMoves(){
     ArrayList<int[]> endList = new ArrayList<int[]>();
    int col = this.getCol();
    int row = this.getRow();
    
    while (col > 0 && row>0|| b.get(col,row)!=null){
      if (b.get(col,row) != null && b.get(col,row)==null||b.get(col,row).getColor() != this.getColor()){
        int[] f = {col,row};
        endList.add(f);
      }
      if (b.get(col,row)==null){
        int[] f = {col,row};
        endList.add(f);
      }
      col--;
      row--;
    }
    col = this.getCol();
    row = this.getRow();
    while (col < 8 && row<8|| b.get(col+1,row+1)!=null){
      //if (b.get(col+1,row+1)==null){
      //  int[] f = {col+1,row+1};
      //  endList.add(f);
      //}
      if (b.get(col+1,row+1) != null && b.get(col+1,row+1).getColor() != this.getColor()){
        int[] f = {col+1,row+1};
        endList.add(f); 
      }
      if (b.get(col-1,row+1)==null){
        int[] f = {col+1,row+1};
        endList.add(f);
      }
      col++;
      row++;
    }
    col = this.getCol();
    row = this.getRow();
    while (row > 0 && col < 8|| b.get(col+1,row-1) != null){
      if (b.get(col+1,row-1) != null && b.get(col+1,row-1).getColor() != this.getColor()){
        int[] f = {col+1,row-1};
        endList.add(f);
      }
      if (b.get(col+1,row-1)==null){
        int[] f = {col-1,row+1};
        endList.add(f);
      }
      col++;
      row--;
    }

    col = this.getCol();
    row = this.getRow();
    while (b.get(col-1,row+1) != null && row < 8 && col >0|| b.get(col-1,row+1) != null){
      if (b.get(col-1,row+1)==null||b.get(col-1,row+1).getColor() != this.getColor()){
        int[] f = {col-1,row+1};
        endList.add(f);
      }
      if (b.get(col-1,row+1)==null){
        int[] f = {col-1,row+1};
        endList.add(f);
      }
      col--;
      row++;
    }
    
    return endList;
  }
  
  
  public boolean move(int newX, int newY){
    //action
    return false;
  }
}
