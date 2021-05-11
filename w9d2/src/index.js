const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Util = require("./util.js")
window.MovingObject = MovingObject;
// takes an event(DOMContentLoaded) and a callback (event) which is called after
// event occurs
document.addEventListener("DOMContentLoaded", function () {
  const mover = new MovingObject({
    pos: [200, 200],
    vel: [10, 10],
    radius: 100,
    color: "blue",
  });
  const aster = new Asteroid({pos: [100,100]});
  const canvasEl = document.getElementById("game-canvas");
  canvasEl.width = window.innerWidth;
  canvasEl.height = window.innerHeight;

  const ctx = canvasEl.getContext("2d");
  console.log(canvasEl);
  window.ctx = ctx;

  mover.draw(ctx);
  aster.draw(ctx);
});
