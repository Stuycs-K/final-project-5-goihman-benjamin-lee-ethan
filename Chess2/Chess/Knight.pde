class Knight extends Piece{
  
  Knight(PImage image, int col, int row, boolean teamColor){
    super(image,col,row,teamColor);
  }
  
  //public boolean isValidMove(int x, int y){
  //  //if (x < 8 && x > 0 && y > 0 && y <7){
  //  //  return (x-2 == this.getX() && (y == this.getY() +1 || y==this.getY()-1) || (x+2 == this.getX() && (y == this.getY() +1 || y==this.getY()-1)) || (y-2 == this.getY() && (x == this.getX() +1 || x==this.getX()-1))|| (y+2 == this.getX() && (x == this.getX() +1 || x==this.getX()-1)))&&(b.get(x,y)== null || b.get(x,y).getColor() != this.getColor());
  //  //}
  //  return false;
  //}
  
    public String getName(){
    return "Knight";  
  }
 public ArrayList<int[]> validMoves() {
    ArrayList<int[]> f = new ArrayList<int[]>();

    boolean isWhite = this.getColor();

    int[][] directions = {{1, 2}, {1, -2}, {2, 1}, {2, -1}, {-1, 2}, {-1, -2}, {-2, 1}, {-2, -1}};
    for (int[] dir : directions) {
        int newRow = this.getRow() + dir[0] * (isWhite ? 1 : -1);
        int newCol = this.getCol() + dir[1];

        if (newRow >= 0 && newRow < 8 && newCol >= 0 && newCol < 8) {
            Piece piece = b.get(newCol, newRow);

            if (piece == null || piece.getColor() != isWhite) {
                int[] move = {newCol, newRow};
                Piece old = b.board[newRow][newCol];
                b.board[newRow][newCol] = b.board[row][col];
                b.board[row][col] = null;
                if (!b.getKing(teamColor).isInCheck()){
                f.add(move);
              }
              b.board[row][col] = b.board[newRow][newCol];
              b.board[newRow][newCol] = old;
              
            }
        }
    }

    return f;
}
  
}
