const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Util = require("./util.js");
// const GameView = require("./game_view");

function Game() {
  this.asteroids = [];
  this.addAsteroids();
}

Game.DIM_X = 1000;
Game.DIM_Y = 1000;
Game.NUM_ASTEROIDS = 10;

Game.prototype.randomPosition = function () {
  let x = Math.floor(Math.random() * Game.DIM_X);
  let y = Math.floor(Math.random() * Game.DIM_Y);
  return [x, y];
};

Game.prototype.addAsteroids = function () {
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
    let newAst = new Asteroid({
      pos: this.randomPosition(),
      game: this
    });
    this.asteroids.push(newAst);
  }
};

Game.prototype.draw = function (ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
//   we don't need this v
//   ctx.fillRect(0, 0, Game.DIM_X, Game.DIM_Y);
  this.asteroids.forEach((aster) => {
    aster.draw(ctx);
  });
};

Game.prototype.moveObjects = function () {
  this.asteroids.forEach((aster) => {
    aster.move();
  });
};
// clearRect is not clearing entiring canvas. only clearing top part
Game.prototype.wrap = function(pos) {
    let x = pos[0];
    let y = pos[1];
    if (x > this.DIM_X + 30) {
        x -= this.DIM_X + 100
    } else if (x < 50) {
        x += this.DIM_X + 100
    }
    if (y > this.DIM_Y + 30) {
        y -= this.DIM_Y + 100
    } else if (y < 50) {
        y += this.DIM_Y + 100
    }
    return [x,y];
}

module.exports = Game

/* MovingObject.prototype.move = function() {
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1]; 
}*/