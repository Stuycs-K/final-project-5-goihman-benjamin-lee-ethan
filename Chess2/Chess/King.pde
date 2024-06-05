class King extends Piece{
  
  King(PImage image, int col, int row, boolean teamColor){
    super(image,col,row,teamColor);
  }
  public String getName(){
    return "King";  
  }

  public boolean isInCheck(){
    boolean isWhite = this.getColor();
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
            if (b.get(currentCol, currentRow).getColor() != this.getColor() && (this.getName().equals("Rook") || this.getName().equals("Queen"))) {
              int[] move = {currentCol, currentRow};
              endList.add(move);
            works = false; // Stop if there's a piece in the way
          }
        }
      }
    }
    
    int[][] directions0 = {{-1, -1}, {1, 1}, {1, -1}, {-1, 1}};
    for (int[] direction : directions0) {
      int dCol = direction[0];
      int dRow = direction[1];
      int currentCol = col;
      int currentRow = row;
      works = true;
      while (currentCol >= 0 && currentCol < 8 && currentRow >= 0 && currentRow < 8 && works) {
        currentCol += dCol;
        currentRow += dRow;
        if (currentCol >= 0 && currentCol < 8 && currentRow >= 0 && currentRow < 8) {
            if (b.get(currentCol, currentRow).getColor() != this.getColor() && (this.getName().equals("Bishop") || this.getName().equals("Queen"))) {
              int[] move = {currentCol, currentRow};
              endList.add(move);
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

            if (piece.getColor() != isWhite && piece.getName().equals("Knight")) {
                int[] move = {newCol, newRow};
                endList.add(move);
            }
        }
  }
  return endList.isEmpty();
  
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
    if (!hasMoved) {
        if (b.get(7, row) != null && b.get(7, row).getClass().getSimpleName().equals("Rook") && !b.get(7, row).hasMoved) {
            boolean canCastle = true;
            for (int c = 5; c <= 6; c++) {
                if (b.get(c, row) != null) {
                    canCastle = false;
                    break;
                }
            }
            if (canCastle) {
                int[] move = {6, row};
                moves.add(move);
            }
        }
   if (b.get(0, row) != null && b.get(0, row).getClass().getSimpleName().equals("Rook") && !b.get(0, row).hasMoved) {
            boolean canCastle = true;
            for (int c = 1; c <= 3; c++) {
                if (b.get(c, row) != null) {
                    canCastle = false;
                    break;
                }
            }
            if (canCastle) {
                int[] move = {2, row};
                moves.add(move);
            }
        }
    }


    return moves;
}

}
