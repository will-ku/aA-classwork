const MovingObject = require("./moving_object.js");
const Util = require("./util.js");
const Game = require("./game");
const GameView = require("./game_view");


function Asteroid(options) {
  this.RADIUS = "20";
  this.COLOR = "purple";
  //   this.pos = options.pos;
  //   this.radius = options.RADIUS;
  //   this.color = options.COLOR;

  MovingObject.call(this, {
    pos: options.pos,
    vel: Util.randomVec(5),
    radius: this.RADIUS,
    color: this.COLOR,
  });
}

Util.inherits(Asteroid, MovingObject);
module.exports = Asteroid;
