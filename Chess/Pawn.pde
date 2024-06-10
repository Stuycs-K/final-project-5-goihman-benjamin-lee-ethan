
class Pawn extends Piece {
  Pawn(PImage image, int col, int row, boolean teamColor) {
    super(image, col, row, teamColor);
  }


  public String getName() {
    return "Pawn";
  }

  public ArrayList<int[]> validMoves() {
    ArrayList<int[]> f = new ArrayList<int[]>();
    if (!teamColor) {
      if (this.getCol() + 1 < 8 && this.getRow() + 1 < 8 && b.get(this.getCol() + 1, this.getRow() + 1) != null && b.get(this.getCol() + 1, this.getRow() + 1).getColor() != this.getColor() && tryMove(this.getCol() + 1, this.getRow() + 1, teamColor)) {
        int[] coord = new int[] {this.getCol() + 1, this.getRow() + 1};
        f.add(coord);
      }
      // check diag right capture
      if (this.getCol() - 1 >= 0 && this.getRow() + 1 < 8 && b.get(this.getCol() - 1, this.getRow() + 1) != null && b.get(this.getCol() - 1, this.getRow() + 1).getColor() != this.getColor() && tryMove(this.getCol() - 1, this.getRow() + 1, teamColor)) {
        int[] coord = new int[] {this.getCol() - 1, this.getRow() + 1};
        f.add(coord);
      }
      // check diag left capture
      if (!hasMoved) {
        if (this.getRow() + 2 < 8 && b.get(this.getCol(), this.getRow() + 1) == null && b.get(this.getCol(), this.getRow() + 2) == null && tryMove(this.getCol(), this.getRow() + 2, teamColor)) {
          int[] coord = new int[] {this.getCol(), this.getRow() + 2};
          f.add(coord);
        }
        if (this.getRow() + 1 < 8 && b.get(this.getCol(), this.getRow() + 1) == null && tryMove(this.getCol(), this.getRow() + 1, teamColor)) {
          int[] coord = new int[] {this.getCol(), this.getRow() + 1};
          f.add(coord);
        }
      } // check first move double jump
      if (this.getRow() + 1 < 8 && b.get(this.getCol(), this.getRow() + 1) == null && tryMove(this.getCol(), this.getRow() + 1, teamColor)) {
        int[] coord = new int[] {this.getCol(), this.getRow() + 1};
        f.add(coord);
      }
      return f;
    } else {
      if (this.getCol() - 1 >= 0 && this.getRow() - 1 >= 0 && b.get(this.getCol() - 1, this.getRow() - 1) != null && b.get(this.getCol() - 1, this.getRow() - 1).getColor() != this.getColor() && tryMove(this.getCol() - 1, this.getRow() - 1, teamColor)) {
        int[] coord = new int[] {this.getCol() - 1, this.getRow() - 1};
        f.add(coord);
      }
      // check diag right capture
      if (this.getCol() + 1 < 8 && this.getRow() - 1 >= 0 && b.get(this.getCol() + 1, this.getRow() - 1) != null && b.get(this.getCol() + 1, this.getRow() - 1).getColor() != this.getColor() && tryMove(this.getCol() + 1, this.getRow() - 1, teamColor)) {
        int[] coord = new int[] {this.getCol() + 1, this.getRow() - 1};
        f.add(coord);
      }
      // check diag left capture
      if (!hasMoved) {
        if (this.getRow() - 2 >= 0 && b.get(this.getCol(), this.getRow() - 1) == null && b.get(this.getCol(), this.getRow() - 2) == null && tryMove(this.getCol(), this.getRow() - 2, teamColor)) {
          int[] coord = new int[] {this.getCol(), this.getRow() - 2};
          f.add(coord);
        }
        if (this.getRow() - 1 >= 0 && b.get(this.getCol(), this.getRow() - 1) == null && tryMove(this.getCol(), this.getRow() - 1, teamColor)) {
          int[] coord = new int[] {this.getCol(), this.getRow() - 1};
          f.add(coord);
        }
      } // check first move double jump
      if (this.getRow() - 1 >= 0 && b.get(this.getCol(), this.getRow() - 1) == null && tryMove(this.getCol(), this.getRow() - 1, teamColor)) {
        int[] coord = new int[] {this.getCol(), this.getRow() - 1};
        f.add(coord);
      }
      return f;
    }
  }
}
