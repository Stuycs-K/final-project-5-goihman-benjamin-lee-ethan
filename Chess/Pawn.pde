class Pawn extends Piece {
  Pawn(PImage image, int col, int row, boolean teamColor) {
    super(image, col, row, teamColor);
  }

  public boolean promote(int col, int row) {
    return true;
  }

  public String getName() {
    return "Pawn";
  }

  public ArrayList<int[]> validMoves() {
    ArrayList<int[]> f = new ArrayList<int[]>();
    if (!teamColor) {
      if (b.get(this.getCol() + 1, this.getRow() + 1) != null
          && b.get(this.getCol() + 1, this.getRow() + 1).getColor()
              != this.getColor()
          && tryMove(this.getCol() + 1, this.getRow() + 1,teamColor)) {
        int[] coord = new int[] {this.getCol() + 1, this.getRow() + 1};
        f.add(coord);
      }
      // check diag right capture
      if (b.get(this.getCol() - 1, this.getRow() + 1) != null
          && b.get(this.getCol() - 1, this.getRow() + 1).getColor()
              != this.getColor()
          && tryMove(this.getCol() - 1, this.getRow() + 1,teamColor)) {
        int[] coord = new int[] {this.getCol() - 1, this.getRow() + 1};
        f.add(coord);
      }
      // check diag left capture
      if (hasMoved != true) {
        if (b.get(this.getCol(), this.getRow() + 1) == null
            && b.get(this.getCol(), this.getRow() + 2) == null
            && tryMove(this.getCol(), this.getRow() + 2,teamColor)) {
          int[] coord = new int[] {this.getCol(), this.getRow() + 2};
          f.add(coord);
        }
        if (b.get(this.getCol(), this.getRow() + 1) == null
            && tryMove(this.getCol(), this.getRow() + 1,teamColor)) {
          int[] coord = new int[] {this.getCol(), this.getRow() + 1};
          f.add(coord);
        }

      } // check first move double jump
      if (b.get(this.getCol(), this.getRow() + 1) == null
          && tryMove(this.getCol(), this.getRow() + 1,teamColor)) {
        int[] coord = new int[] {this.getCol(), this.getRow() + 1};
        f.add(coord);
      }
      return f;
    } else {
      if (b.get(this.getCol() - 1, this.getRow() - 1) != null
          && b.get(this.getCol() - 1, this.getRow() - 1).getColor()
              != this.getColor()
          && tryMove(this.getCol() - 1, this.getRow() - 1,teamColor)) {
        int[] coord = new int[] {this.getCol() - 1, this.getRow() - 1};
        f.add(coord);
      }
      // check diag right capture
      if (b.get(this.getCol() + 1, this.getRow() - 1) != null
          && b.get(this.getCol() + 1, this.getRow() - 1).getColor()
              != this.getColor()
          && tryMove(this.getCol() + 1, this.getRow() - 1,teamColor)) {
        int[] coord = new int[] {this.getCol() + 1, this.getRow() - 1};
        f.add(coord);
      }
      // check diag left capture
      if (hasMoved != true) {
        if (b.get(this.getCol(), this.getRow() - 1) == null
            && b.get(this.getCol(), this.getRow() - 2) == null
            && tryMove(this.getCol(), this.getRow() - 2,teamColor)) {
          int[] coord = new int[] {this.getCol(), this.getRow() - 2};
          f.add(coord);
        }
        if (b.get(this.getCol(), this.getRow() - 1) == null
            && tryMove(this.getCol(), this.getRow() - 1,teamColor)) {
          int[] coord = new int[] {this.getCol(), this.getRow() - 1};
          f.add(coord);
        }

      } // check first move double jump
      if (b.get(this.getCol(), this.getRow() - 1) == null
          && tryMove(this.getCol(), this.getRow() - 1,teamColor)) {
        int[] coord = new int[] {this.getCol(), this.getRow() - 1};
        f.add(coord);
      }
      return f;
    }
  }

}
