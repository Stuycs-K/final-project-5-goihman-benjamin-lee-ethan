public class Board {
    Piece[][] board;
    Piece selected;
    int turn;
    boolean checkTest = false;
    int state;
    King wKing = null;
    King bKing = null;
    public Board() {
        resetBoard();
    }
    public void shuffle() {};
    public void flip() {};

    public boolean isInCheckMate(boolean col) {
      boolean cM = true;
      for(Piece[] r : board){
             for(Piece p: r){
               if(p!=null && p.getColor() == col){
                   cM = p.validMoves().size() != 0 ? false : cM;
             }
           }
         }
      return cM;
    }
    public boolean isStaleMate() {
         return false;
    }
    
    
    public Piece get(int col, int row) {
        if (0 > col || col >= board.length || row < 0 || row >= board.length) {
            return null;
        }
        return board[row][col];
    }
    public King getKing(boolean col){
       return col ? wKing : bKing; 
    }
    boolean move(int col, int row) {
        if (col < 0 || col >= 8 || row < 0 || row >= 8) {
            return false;
        }
        if (selected == null) {
            return false;
        }
        if (selected.getClass().getSimpleName().equals("King") && !selected.hasMoved) {
            if (col == 6 && selected.getCol() == 4) {
                if (board[row][7] != null && board[row][7].getClass().getSimpleName().equals("Rook") && !board[row][7].hasMoved) {
                    boolean canCastle = true;
                    for (int c = 5; c <= 6; c++) {
                        if (board[row][c] != null) {
                            canCastle = false;
                            break;
                        }
                    }
                    if (canCastle) {
                        board[row][5] = board[row][7];
                        board[row][7] = null;
                        board[row][5].move(5, row);
                        board[row][6] = selected;
                        board[selected.getRow()][selected.getCol()] = null;
                        selected.move(6, row);
                        selected = null;
                        turn++;
                        return true;
                    }
                }
            } else if (col == 2 && selected.getCol() == 4) {
                if (board[row][0] != null && board[row][0].getClass().getSimpleName().equals("Rook") && !board[row][0].hasMoved) {
                    boolean canCastle = true;
                    for (int c = 1; c <= 3; c++) {
                        if (board[row][c] != null) {
                            canCastle = false;
                            break;
                        }
                    }
                    if (canCastle) {
                        board[row][3] = board[row][0];
                        board[row][0] = null;
                        board[row][3].move(3, row);
                        board[row][2] = selected;
                        board[selected.getRow()][selected.getCol()] = null;
                        selected.move(2, row);
                        selected = null;
                        turn++;
                        return true;
                    }
                }
            }
        }
        board[selected.getRow()][selected.getCol()] = null;
        board[row][col] = selected;
        selected.move(col, row);
        selected = null;
        turn++;
        return true;
    }

    public void resetBoard() {
        this.turn = 0;
        this.selected = null;
        board = new Piece[8][8];
        
    if(!checkTest){
        // Initialize white pieces
        board[0][0] = new Rook(loadImage("pieces/black-rook.png"), 0, 0, false);
        board[0][1] = new Knight(loadImage("pieces/black-knight.png"), 1, 0, false);
        board[0][2] = new Bishop(loadImage("pieces/black-bishop.png"), 2, 0, false);
        board[0][3] = new Queen(loadImage("pieces/black-queen.png"), 3, 0, false);
        board[0][4] = new King(loadImage("pieces/black-king.png"), 4, 0, false);
        board[0][5] = new Bishop(loadImage("pieces/black-bishop.png"), 5, 0, false);
        board[0][6] = new Knight(loadImage("pieces/black-knight.png"), 6, 0, false);
        board[0][7] = new Rook(loadImage("pieces/black-rook.png"), 7, 0, false);
        bKing = (King) board[0][4];
        
          for (int col = 0; col < 8; col++) {
            board[1][col] = new Pawn(loadImage("pieces/black-pawn.png"), col, 1, false);
        }
        

        // Initialize black pieces
        board[7][0] = new Rook(loadImage("pieces/white-rook.png"), 0, 7, true);
        board[7][1] = new Knight(loadImage("pieces/white-knight.png"), 1, 7, true);
        board[7][2] = new Bishop(loadImage("pieces/white-bishop.png"), 2, 7, true);
        board[7][3] = new Queen(loadImage("pieces/white-queen.png"), 3, 7, true);
        board[7][4] = new King(loadImage("pieces/white-king.png"), 4, 7, true);
        board[7][5] = new Bishop(loadImage("pieces/white-bishop.png"), 5, 7, true);
        board[7][6] = new Knight(loadImage("pieces/white-knight.png"), 6, 7, true);
        board[7][7] = new Rook(loadImage("pieces/white-rook.png"), 7, 7, true);
          wKing = (King) board[7][4];

            for (int col = 0; col < 8; col++) {
              board[6][col] = new Pawn(loadImage("pieces/white-pawn.png"), col, 6, true);
          

        }



        // Initialize empty squares
        for (int row = 2; row < 6; row++) {
            for (int col = 0; col < 8; col++) {
                board[row][col] = null;
            }
        }
    }
    else{
        board[0][4] = new King(loadImage("pieces/white-king.png"), 4, 0, true);
        board[7][0] = new Rook(loadImage("pieces/black-rook.png"), 0, 7, false);
        board[7][1] = new Knight(loadImage("pieces/black-knight.png"), 1, 7, false);
        board[7][2] = new Bishop(loadImage("pieces/black-bishop.png"), 2, 7, false);
        board[7][3] = new Queen(loadImage("pieces/black-queen.png"), 3, 7, false);
        board[7][4] = new King(loadImage("pieces/black-king.png"), 4, 7, false);
        board[7][5] = new Bishop(loadImage("pieces/black-bishop.png"), 5, 7, false);
        board[7][6] = new Knight(loadImage("pieces/black-knight.png"), 6, 7, false);
        board[7][7] = new Rook(loadImage("pieces/black-rook.png"), 7, 7, false);

      
    }
    

    }
    public boolean select(int col, int row) {
        Piece piece = get(col, row);
        if (piece == null) {
            return false;
        }

        if (piece == selected) {
            selected = null;
            return true;
        }

        if (piece.getColor() == (turn % 2 == 0)) {
            selected = piece;
            return true;
        }
        return false;
    }


}
