const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Util = require("./util.js");
const Game = require("./game");
const GameView = require("./game_view");

window.MovingObject = MovingObject;
// takes an event(DOMContentLoaded) and a callback (event) which is called after
// event occurs

document.addEventListener("DOMContentLoaded", function () {
//     const mover = new MovingObject({
//     pos: [200, 200],
//     vel: [10, 10],
//     radius: 100,
//     color: "blue",
//     // game: game1
//   });

//   const aster = new Asteroid({ pos: [100, 100] });
  const canvasEl = document.getElementById("game-canvas");
  canvasEl.width = 1000;
  canvasEl.height = 1000;

  const ctx = canvasEl.getContext("2d");
  console.log(canvasEl);
  window.ctx = ctx;

//   mover.draw(ctx);
//   aster.draw(ctx);

  const game1 = new Game();  
  new GameView(ctx, game1).start();
});
