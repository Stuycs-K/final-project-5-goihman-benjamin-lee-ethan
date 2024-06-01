class Bishop extends Piece{
  
  Bishop(PImage image, int col, int row, boolean teamColor){
    super(image,col,row,teamColor);
  }
  

  
  public ArrayList <int[]> validMoves(){
     ArrayList<int[]> endList = new ArrayList<int[]>();
    int col = this.getCol();
    int row = this.getRow();
    boolean works = true;
    
    while (col >= 0 && row >=0 &&works){
      if (b.get(col,row)==null||(b.get(col,row) != null && b.get(col,row)==null||b.get(col,row).getColor() != this.getColor())){
        int[] f = {col,row};
        endList.add(f);
      }
      if (b.get(row,col) != null){
        works = false;
        }
      col--;
      row--;
    }
    col = this.getCol();
    row = this.getRow();
    works = true;
    while (col < 8 && row < 8){
      if (b.get(col,row)==null||(b.get(col,row) != null && b.get(col,row)==null||b.get(col,row).getColor() != this.getColor())){
        int[] f = {col,row};
        endList.add(f);
      }
      if (b.get(row,col) != null){
        works = false;
        }
      col++;
      row++;
    }
    col = this.getCol();
    row = this.getRow();
    works = true;
    while (row >= 0 && col < 8){
      if (b.get(col,row)==null||(b.get(col,row) != null && b.get(col,row)==null||b.get(col,row).getColor() != this.getColor())){
        int[] f = {col,row};
        endList.add(f);
      }
      if (b.get(row,col) != null){
        works = false;
        }
      col++;
      row--;
    }

    col = this.getCol();
    row = this.getRow();
    works = true;
    while (row < 8 && col >= 0){
      if (b.get(col,row)==null||(b.get(col,row) != null && b.get(col,row)==null||b.get(col,row).getColor() != this.getColor())){
        int[] f = {col,row};
        endList.add(f);
      }
      if (b.get(row,col) != null){
        works = false;
      }
      col--;
      row++;
    }
    
    return endList;
  }
  
  
  public boolean move(int newX, int newY){
    
    return false;
  }
}
