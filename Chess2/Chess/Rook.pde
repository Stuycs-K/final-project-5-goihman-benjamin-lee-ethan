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
    boolean works;
    int[][] directions = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
    for (int[] direction : directions) {
      int dCol = direction[0];
      int dRow = direction[1];
      int currentCol = col;
      int currentRow = row;
      works = true;
      while (currentCol >= 0 && currentCol < 8 && currentRow >= 0 && currentRow < 8 && works) {
        currentCol += dCol;
        currentRow += dRow;
        if (currentCol >= 0 && currentCol < 8 && currentRow >= 0 && currentRow < 8) {
          if (b.get(currentCol, currentRow) == null) {
            int[] move = {currentCol, currentRow};
            endList.add(move);
          } else {
            if (b.get(currentCol, currentRow).getColor() != this.getColor()) {
              int[] move = {currentCol, currentRow};
              endList.add(move);
            }
            works = false; // Stop if there's a piece in the way
          }
        }
      }
    }

    return endList;
  }
  

}
