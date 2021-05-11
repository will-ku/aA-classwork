const MovingObject = require('./moving_object.js')
window.MovingObject = MovingObject;
// takes an event(DOMContentLoaded) and a callback (event) which is called after
// event occurs
window.addEventListener('DOMContentLoaded', (event) => {
    const canvasEl = document.getElementById("game-canvas");
    canvasEl.width = window.innerWidth;
    canvasEl.height = window.innerHeight;

    const ctx = canvasEl.getContext("2d");
    window.ctx = ctx;
    
})