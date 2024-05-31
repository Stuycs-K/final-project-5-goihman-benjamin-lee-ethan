class Bishop extends Piece{
  
  Bishop(PImage image, int col, int row, boolean teamColor){
    super(image,col,row,teamColor);
  }
  

  
  public ArrayList <int[]> validMoves(){
     ArrayList<int[]> endList = new ArrayList<int[]>();
    int col = this.getCol();
    int row = this.getRow();
    
    while (col > 0 && b.get(col-1,row-1)!=null){
      if (b.get(col-1,row-1).getColor() != this.getColor()){
        int[] f = {col-1,row-1};
        endList.add(f);
      }
      col--;
    }
    col = this.getCol();
    row = this.getRow();
    while (col < 8 && b.get(col+1,row+1)!=null){
      if (b.get(col+1,row+1).getColor() != this.getColor()){
        int[] f = {col+1,row+1};
        endList.add(f);

      }
      col++;
    }
    col = this.getCol();
    row = this.getRow();
    while (row > 0 && b.get(col+1,row-1) != null){
      if (b.get(col+1,row-1).getColor() != this.getColor()){
        int[] f = {col,row-1};
        endList.add(f);
      }
      row--;
    }

    col = this.getCol();
    row = this.getRow();
    while (row < 8 && b.get(col-1,row+1) != null){
      if (b.get(col-1,row+1).getColor() != this.getColor()){
        int[] f = {col-1,row+1};
        endList.add(f);
      }
      row++;
    }
    
    return endList;
  }
  
  
  public boolean move(int newX, int newY){
    //action
    return isValidMove(newX,newY);
  }
}
