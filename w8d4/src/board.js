// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  var Piece = require("./piece");
}
// DON'T TOUCH THIS CODE

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let rows = new Array(8);
  for (let i = 0; i < rows.length; i++) {
    rows[i] = new Array(8);
    rows[i].fill(undefined);
  }
  rows[3][4] = new Piece('black');
  rows[4][3] = new Piece('black');
  rows[3][3] = new Piece('white');
  rows[4][4] = new Piece('white');
  return rows;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  return pos[0] >= 0 && pos[0] < 8 && pos[1] >= 0 && pos[1] < 8; 
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if(!this.isValidPos(pos)) {
    throw new Error('Not valid pos!');
  }
  return this.grid[pos[0]][pos[1]];
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let piece = this.getPiece(pos)
  return piece ? piece.color === color : undefined;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return !!this.getPiece(pos);
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip=[]){
  let newPos = [pos[0] + dir[0], pos[1] + dir[1]];
  if (!this.isValidPos(newPos)) {
    return [];
  }
  let nextPiece = this.getPiece(newPos);
  if (!nextPiece) {
    return [];
  }
  else if (nextPiece.color === color) {
    return piecesToFlip;
  }
  else {
    return this._positionsToFlip(newPos, color, dir, piecesToFlip.concat([newPos]))
  }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if(this.isOccupied(pos)) {
    return false;
  }
  let flips = Board.DIRS.map(dir => this._positionsToFlip(pos,color,dir));
  for(let i = 0; i < flips.length; i++) {
    if(flips[i].length > 0) {
      return true;
    }
  }
  return false;
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if(!this.validMove(pos,color)) {
    throw new Error("Invalid move!");
  }
  let flips = [];
  for(let i = 0; i < Board.DIRS.length; i++) {
    let flipPositions = this._positionsToFlip(pos,color,Board.DIRS[i]);
    flipPositions.forEach(pos => flips.push(pos));
  }
  this.grid[pos[0]][pos[1]] = new Piece(color);
  for(let j = 0; j < flips.length; j++) {
    this.getPiece(flips[j]).flip();
  }
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  const validMoves = [];

  for (let i = 0; i < this.grid.length; i++) {
    for (let j = 0; j < this.grid[0].length; j++) {
      if (this.validMove([i,j], color)) {
        validMoves.push([i,j]);
      }
    }
  }
  return validMoves;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return this.validMoves(color).length !== 0;
};


/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return this.validMoves('white').length === 0 && this.validMoves('black').length === 0;
};


/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  // this.validMoves()
  for (let i = 0; i < this.grid.length; i++) {
    console.log(this.grid[i].map(el => el ? el.toString() : "#").join(""));
  }

};


// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  module.exports = Board;
}
// DON'T TOUCH THIS CODE