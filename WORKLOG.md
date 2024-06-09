# Work Log

## Ben Goihman

### 5/22/2024
- Changed prototype to include selected piece, as well as fixed typo (color is boolean not string)
- Made the board class main methods, select, get, and load all the pieces with images and to their correct location.

### 5/23/2024

- Fixed board iniitnilziation correct params and true or false for black. 
- Reorganized file struc
- Made plain board appear

### 5/27/2024
- Load in plainboard with pieces and reorganize the draw class
- Reorganize file struc of the directory"
- Added ability to select pieces and then unselect as well.

### 5/28/2024
- Add logic to know when selecting a new piece or moving
- Implement move func and better select

### 5/29/2024
- Allow user to move pieces and it deletes the old piece
- Fix some errors in loop and make skeleton code
- Add better checks for nulls and other more edge cases as well as format Chess

### 5/30/2024

- Redo the board class and the main to use row, col to improve simplicty
- Redo the internal board so that it starts with white.
- Redo whole main class to row and col to reduce unneeded complexity
- Change how move works, so draw circles to show valid moves nad allow moves in that location.
### 5/31/2024

- Filled out the readme
- Made pieces move and fully display
- Show all valid moves for a selected piece
- Let pieces know they've been moved

### 6/1/2024
- Fix errors in how I let pieces know their move.
- Fix error where pawn wouldn't realize it can attack on first move. 
- Fixed move pieces so that onyl allowed moves are used
- Redid bishop validMoves so that it doesn't jump over pieces
- Redid valid moves for rook and queen in the same way doen for bishop
- Add move for king

### 6/2/2024
- Castling moves show but do not work, like you can see valid move but if doesnt castle just selects the other piece (b/c same color)
- Add text to see who's turn it is

### 6/4/2024
- Fixed castling rooks no longer show it only kings.
- Formatted Main and Board.

### 6/5/2024
- Fix check (in some scenaiors)
- Add check for check in all pieces + format them

### 6/6/2024
- Fix check checking for rook and bishop get rid of null error

### 6/8/2024
- Move directory to correct spot
- Add checkmate
- Make pieces able to sacrfice themselves more than one spot
- Add gameover screen
- Add promotion
- Add timer
## Ethan Lee

### 5/22/2024
- Created abstract piece class with constructors, instance variables, and both public/abstract methods

### 5/23/2024
Created skeleton for other pieces

### 5/24/2024
- Changed method isValidMove(int x, int y) to isValidSquare

### 5/27/2024
- Changed isValidSquare back to isValidMove()
- started basic code for checking for pawn starting moves.

### 5/28/2024
- Created parameters + finished isValidMove for Knight Pieces
- Finished pawn valid moves excluding en passant
- Altered both to check for null and no jumping over pieces (unless Knight)


### 5/29/2024
- Changed to arraylist for validmoves 
- Rook check horizontal and vertical


### 5/30/2024
- converted x y to col row for the pieces
	- including getRow() and getCol()
- fixed pawn validMoves()

### 5/31/2024
- did rook validMoves()
- did queen validMoves()

### 6/3/2024
- started king inCheck()

### 6/4/2024 
- worked on king isInCheck()
  	- incorporated arraylist to check when another piece sees it
  	- Needs to be added to move

### 6/8/20224
- Fixed castling through and in check
- Stalemate included and impelemented in winner display after game end
- Swapped black and white pieces so that white is on the bottom and that the pieces are in proper spot
	- dependant on square colors too
