class King extends Piece{
  
  King(PImage image, int col, int row, boolean teamColor){
    super(image,col,row,teamColor);
  }

  public boolean isInCheck(){
    ArrayList<int[]> endList = new ArrayList<int[]>();
    int col = this.getCol();
    int row = this.getRow();
    boolean works;
    int[][] directions = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}, {-1, -1}, {1, 1}, {1, -1}, {-1, 1}};
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
    int[][] directions1 = {{1, 2}, {1, -2}, {2, 1}, {2, -1}, {-1, 2}, {-1, -2}, {-2, 1}, {-2, -1}};
    for (int[] dir : directions1) {
        int newRow = this.getRow() + dir[0] * (isWhite ? 1 : -1);
        int newCol = this.getCol() + dir[1];

        if (newRow >= 0 && newRow < 8 && newCol >= 0 && newCol < 8) {
            Piece piece = b.get(newCol, newRow);

            if (piece == null || piece.getColor() != isWhite) {
                int[] move = {newCol, newRow};
                endList.add(move);
            }
        }
  }
  
 public ArrayList<int[]> validMoves() {
    ArrayList<int[]> moves = new ArrayList<int[]>();

    boolean isWhite = this.getColor();

    int[][] directions = {{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1},  {1, 0},  {1, 1}};

    for (int[] dir : directions) {
        int newRow = this.getRow() + dir[0] * (isWhite ? 1 : -1);
        int newCol = this.getCol() + dir[1];

        if (newRow >= 0 && newRow < 8 && newCol >= 0 && newCol < 8) {
            Piece piece = b.get(newCol, newRow);

            if (piece == null || piece.getColor() != isWhite) {
                int[] move = {newCol, newRow};
                moves.add(move);
            }
        }
    }
    if(!hasMoved){
    boolean works;
    directions = new int[][]{{-1, 0}, {1, 0}};
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
          
          if (b.get(currentCol, currentRow)!= null && b.get(currentCol,currentRow).getClass().getSimpleName().equals("Rook")&&!b.get(currentCol,currentRow).hasMoved) {
            int[] move = {currentCol, currentRow};
            moves.add(move);
            works=false; //end loop early b/c only one per direction
          } else if(b.get(currentCol,currentRow)!=null){
            works=false;
          }
        }
      }
    }}

    return moves;
}

}
