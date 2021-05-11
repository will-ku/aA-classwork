const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Util = require("./util.js");
const Game = require("./game");

function GameView(ctx, game) {
  this.ctx = ctx;
  this.game = game;
}

GameView.prototype.start = function () {
  setInterval(function () {
    game.moveObjects;
    game.draw;
  }, 20);
};

module.exports = GameView;
