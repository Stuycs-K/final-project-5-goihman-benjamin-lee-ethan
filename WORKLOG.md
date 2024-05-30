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

## Ethan Lee

### 5/22/2024
Created abstract piece class with constructors, instance variables, and both public/abstract methods

### 5/23/2024
Created skeleton for other pieces

### 5/24/2024
(According to commit history) Changed method isValidMove(int x, int y) to isValidSquare

### 5/27/2024
Changed isValidSquare back to isValidMove(), started basic code for checking for pawn starting moves.

### 5/28/2024
- Created parameters + finished isValidMove for Knight Pieces
- Finished pawn valid moves excluding en passant
- Altered both to check for null and no jumping over pieces (unless Knight)


### 5/29/2024
- Changed to arraylist for validmoves 
- Rook check horizontal and vertical
