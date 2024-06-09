class King extends Piece {
  King(PImage image, int col, int row, boolean teamColor) {
    super(image, col, row, teamColor);
  }
  public String getName() {
    return "King";
  }

  public boolean isInCheck() {
    int col = this.getCol();
    int row = this.getRow();
    boolean isWhite = this.getColor();

    // Check for bishop and queen attacks
    int[][] directions0 = {{-1, -1}, {1, 1}, {1, -1}, {-1, 1}};
    for (int[] direction : directions0) {
      int dCol = direction[0];
      int dRow = direction[1];
      int currentCol = col + dCol;
      int currentRow = row + dRow;
      while (currentCol >= 0 && currentCol < 8 && currentRow >= 0 && currentRow < 8) {
        Piece piece = b.get(currentCol, currentRow);
        if (piece != null) {
          if (piece.getColor() != isWhite && (piece.getName().equals("Bishop") || piece.getName().equals("Queen"))) {
            return true;
          }
          break; // Stop if there's a piece in the way
        }
        currentCol += dCol;
        currentRow += dRow;
      }
    }

    // Check for knight attacks
    int[][] directions1 = {{1, 2}, {1, -2}, {2, 1}, {2, -1}, {-1, 2}, {-1, -2}, {-2, 1}, {-2, -1}};
    for (int[] dir : directions1) {
      int newCol = col + dir[1];
      int newRow = row + dir[0];
      if (newRow >= 0 && newRow < 8 && newCol >= 0 && newCol < 8) {
        Piece piece = b.get(newCol, newRow);
        if (piece != null) {
          if (piece.getColor() != isWhite && piece.getName().equals("Knight")) {
            return true;
          }
        }
      }
    }

    // Check for queen and rook attacks
    int[][] directions2 = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
    for (int[] direction : directions2) {
      int dCol = direction[0];
      int dRow = direction[1];
      int currentCol = col + dCol;
      int currentRow = row + dRow;
      while (currentCol >= 0 && currentCol < 8 && currentRow >= 0 && currentRow < 8) {
        Piece piece = b.get(currentCol, currentRow);
        if (piece != null) {
          if (piece.getColor() != isWhite && (piece.getName().equals("Queen") || piece.getName().equals("Rook"))) {
            return true;
          }
          break; // Stop if there's a piece in the way
        }
        currentCol += dCol;
        currentRow += dRow;
      }
    }

    // Check for pawn attacks
    int pawnRow = isWhite ? row - 1 : row + 1; // Pawns attack diagonally forward
    int[] pawnCols = {col - 1, col + 1};
    for (int pawnCol : pawnCols) {
      if (pawnCol >= 0 && pawnCol < 8) {
        Piece piece = b.get(pawnCol, pawnRow);
        if (piece != null) {
          if (piece.getColor() != isWhite && piece.getName().equals("Pawn")) {
            return true;
          }
        }
      }
    }

    // Check for king attacks
    int[][] kingDirections = {{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1}};
    for (int[] dir : kingDirections) {
      int newCol = col + dir[1];
      int newRow = row + dir[0];
      if (newRow >= 0 && newRow < 8 && newCol >= 0 && newCol < 8) {
        Piece piece = b.get(newCol, newRow);
        if (piece != null) {
          if (piece.getColor() != isWhite && piece.getName().equals("King")) {
            return true;
          }
        }
      }
    }

    return false;
  }

  public ArrayList<int[]> validMoves() {
    ArrayList<int[]> moves = new ArrayList<int[]>();

    boolean isWhite = this.getColor();

    int[][] directions = {{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1}};

    for (int[] dir : directions) {
      int newRow = this.getRow() + dir[0] * (isWhite ? 1 : -1);
      int newCol = this.getCol() + dir[1];

      if (newRow >= 0 && newRow < 8 && newCol >= 0 && newCol < 8) {
        Piece piece = b.get(newCol, newRow);

        if (piece == null || piece.getColor() != isWhite) {
          if (tryMove(newCol, newRow,teamColor)) {
            int[] move = {newCol, newRow};
            moves.add(move);
          }
        }
      }
    }
    if (!hasMoved && isInCheck() == false) {
      if (b.get(7, row) != null && b.get(7, row).getClass().getSimpleName().equals("Rook") && !b.get(7, row).hasMoved) {
        boolean canCastle = true;
        for (int c = 5; c <= 6; c++) {
          if (b.get(c, row) != null) {
            canCastle = false;
            break;
          }
        }
        if (canCastle) {
          if (tryMove(5,row,teamColor) && tryMove(6, row, teamColor)) {
            int[] move = {6, row};
            moves.add(move);
          }
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
          if (tryMove(2, row, teamColor) && tryMove(3,row,teamColor)) {
            int[] move = {2, row};
            moves.add(move);
          }
        }
      }
    }

    return moves;
  }
}
