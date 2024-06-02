class King extends Piece{
  
  King(PImage image, int col, int row, boolean teamColor){
    super(image,col,row,teamColor);
  }

  
  
 public ArrayList<int[]> validMoves() {
    ArrayList<int[]> f = new ArrayList<int[]>();

    boolean isWhite = this.getColor();

    int[][] directions = {{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1},  {1, 0},  {1, 1}};

    for (int[] dir : directions) {
        int newRow = this.getRow() + dir[0] * (isWhite ? 1 : -1);
        int newCol = this.getCol() + dir[1];

        if (newRow >= 0 && newRow < 8 && newCol >= 0 && newCol < 8) {
            Piece piece = b.get(newCol, newRow);

            if (piece == null || piece.getColor() != isWhite) {
                int[] move = {newCol, newRow};
                f.add(move);
            }
        }
    }

    return f;
}

}
