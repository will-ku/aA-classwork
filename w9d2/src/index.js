const MovingObject = require("./moving_object.js");
window.MovingObject = MovingObject;
// takes an event(DOMContentLoaded) and a callback (event) which is called after
// event occurs
document.addEventListener("DOMContentLoaded", function () {
  const mover = new MovingObject({
    pos: [10, 10],
    vel: [10, 10],
    radius: 5,
    color: "black"
  });

  const canvasEl = document.getElementById("game-canvas");
  console.log(canvasEl);
  canvasEl.width = window.innerWidth;
  canvasEl.height = window.innerHeight;

  const ctx = canvasEl.getContext("2d");
//   window.ctx = ctx;

  mover.draw(ctx);
});
