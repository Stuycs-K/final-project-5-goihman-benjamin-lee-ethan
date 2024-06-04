class King extends Piece{
  
  King(PImage image, int col, int row, boolean teamColor){
    super(image,col,row,teamColor);
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
