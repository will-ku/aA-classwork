const MovingObject = require("./moving_object");
const Util = require("./util");

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

module.export = Asteroid