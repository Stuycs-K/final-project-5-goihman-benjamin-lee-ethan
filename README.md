[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/syDSSnTt)
# APCS2 Final Project
THIS DOCUMENT IS REQUIRED
## Group Info
Ben Goihman and Ethan Lee
## Overview
This will be a normal chess game, MVP - Will have a working chess board with valid moves, although check or checkmate may not be done. For the full game we will have check and checkmate working, and if going well on hte sides where we reserved space we can add what pieces are taken and a timer
## Instructions
First select the piece you want to move. Then all avalaible moves will be shown, identifiable with a bright green circle.
Click again one of the squares containing a green circle to move or capture pieces.
To unselect a piece, click on that piece.
To select another piece, click on the desired piece.
To promote a pawn, move that pawn to the end of the board. After doing so, you are presented with the four different pieces that you can click on. Click on the desired piece and the square where the pawn once was will now be the piece that you clicked. The turn advances.
To give 30 seconds of time to the other player simply click your minus symbol located under the timer. If you have less than 30 seconds left nothing will happen if you click it. This is to allow your opponent more time to think so the game does not abruptly end.
Shortcuts:
- click c to show check works
- click m to show checkmate works
- click l to show castling works
- click p to show promotion works
- click r to reset the board and timer
## Major-ish changes to prototype
- isInCheck moved to king class, as it is depedent on the color of the king and the king peice more than the board class
- All isValidMove methods were removed as the validMoves method can be used instead
- Added different game states and a winner so that if the gameover screen is displayed the game won't reset until you click on the restart box
