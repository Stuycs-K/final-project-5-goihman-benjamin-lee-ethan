public class Board {
    Piece[][] board;
    Piece selected;
    int turn;
    boolean checkTest = false;
    King wKing = null;
    King bKing = null;
    int fiftyMoves = 0;
    public Board() {
        resetBoard();
    }

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
    ArrayList<Piece> wPieces = new ArrayList<>();
    ArrayList<Piece> bPieces = new ArrayList<>();
    
    for (Piece[] r : board) {
        for (Piece p : r) {
            if (p != null) {
                if (p.getColor()) {
                    wPieces.add(p);
                } else {
                    bPieces.add(p);
                }
            }
        }
    }

    if (wPieces.size() == 1 && bPieces.size() == 1) {
        return true;
    }

    if (wPieces.size() == 2 && bPieces.size() == 1) {
        for (Piece p : wPieces) {
            if (p.getName().equals("Bishop") || p.getName().equals("Knight")) {
                return true;
            }
        }
    }
    if (bPieces.size() == 2 && wPieces.size() == 1) {
        for (Piece p : bPieces) {
            if (p.getName().equals("Bishop") || p.getName().equals("Knight")) {
                return true;
            }
        }
    }

    if (wPieces.size() == 2 && bPieces.size() == 2) {
        boolean wHasBishop = false;
        boolean bHasBishop = false;
        boolean wBishopColor = false;
        boolean bBishopColor = false;

        for (Piece p : wPieces) {
            if (p.getName().equals("Bishop")) {
                wHasBishop = true;
                wBishopColor = (p.getCol() + p.getRow()) % 2 == 0;
            }
        }
        for (Piece p : bPieces) {
            if (p.getName().equals("Bishop")) {
                bHasBishop = true;
                bBishopColor = (p.getCol() + p.getRow()) % 2 == 0;
            }
        }
        if (wHasBishop && bHasBishop && wBishopColor == bBishopColor) {
            return true;
        }
    }

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
        if(selected.getName().equals("Pawn") && (row == 0 || row==7)){
          state=2;
          board[selected.getRow()][selected.getCol()] = null;
          board[row][col] = selected;
          selected = board[row][col];
          selected.move(col, row);
          int squareSize = min(width, height) / 8;
          if(selected.getColor()){
            PImage[] imgs = {loadImage("pieces/white-queen.png"),loadImage("pieces/white-rook.png"),loadImage("pieces/white-knight.png"),loadImage("pieces/white-bishop.png")};
            for(int i = 0; i < imgs.length; i++){
              image(imgs[i], 74, 144 + i*103, squareSize, squareSize);
            }
          }
          else{
            PImage[] imgs = {loadImage("pieces/black-queen.png"),loadImage("pieces/black-rook.png"),loadImage("pieces/black-knight.png"),loadImage("pieces/black-bishop.png")};
            for(int i = 0; i < imgs.length; i++){
              image(imgs[i], 1080, 144 + i*103, squareSize, squareSize);
            }
          }
          return true;
        }
        
        if (selected.getName().equals("King") && !selected.hasMoved) {
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
        if (selected.getName().equals("Pawn") || board[row][col] != null){
          fiftyMoves = 0;
          println("reset counter");
        } else{
          fiftyMoves ++;
          println("one move closer to draw");
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
    this.fiftyMoves=0;
    this.selected = null;
    board = new Piece[8][8];
  
    switch(test) {
        case 1: // Easy check testing
            board[0][4] = new King(loadImage("pieces/black-king.png"), 4, 0, false);
            bKing = (King) board[0][4];
            board[7][4] = new King(loadImage("pieces/white-king.png"), 4, 7, true);
            wKing = (King) board[7][4];
            board[6][3] = new Queen(loadImage("pieces/black-queen.png"), 3, 6, false);
            break;
        
        case 2: // Easy checkmate testing
            board[0][4] = new King(loadImage("pieces/black-king.png"), 4, 0, false);
            bKing = (King) board[0][4];
            board[7][4] = new King(loadImage("pieces/white-king.png"), 4, 7, true);
            wKing = (King) board[7][4];
            board[2][3] = new Queen(loadImage("pieces/white-queen.png"), 3, 2, true);
            board[2][5] = new Rook(loadImage("pieces/white-rook.png"), 5, 2, true);
            break;
        
        case 3: // Easy castling tester
            board[0][4] = new King(loadImage("pieces/black-king.png"), 4, 0, false);
            bKing = (King) board[0][4];
            board[0][0] = new Rook(loadImage("pieces/black-rook.png"), 0, 0, false);
            board[0][7] = new Rook(loadImage("pieces/black-rook.png"), 7, 0, false);
            board[7][4] = new King(loadImage("pieces/white-king.png"), 4, 7, true);
            wKing = (King) board[7][4];
            board[7][0] = new Rook(loadImage("pieces/white-rook.png"), 0, 7, true);
            board[7][7] = new Rook(loadImage("pieces/white-rook.png"), 7, 7, true);
            break;
        
        case 4: // Easy promotion testing
            board[0][4] = new King(loadImage("pieces/black-king.png"), 4, 0, false);
            bKing = (King) board[0][4];
            board[7][4] = new King(loadImage("pieces/white-king.png"), 4, 7, true);
            wKing = (King) board[7][4];
            board[1][0] = new Pawn(loadImage("pieces/white-pawn.png"), 0, 1, true);
            board[6][7] = new Pawn(loadImage("pieces/black-pawn.png"), 7, 6, false);
            break;

        default: // Normal setup
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
            break;
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
