function Game() {

    this.asteroids = [];
}

Game.DIM_X = 1000;
Game.DIM_Y = 1000;
Game.NUM_ASTEROIDS = 10;

Game.prototype.randomPosition = function() {
    let x = Math.floor(Math.random() * Game.DIM_X);
    let y = Math.floor(Math.random() * Game.DIM_Y);
    return [x,y]
}

Game.prototype.addAsteroids = function() {
    
    for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
        let newAst = new Asteroid({
            pos: this.randomPosition(),
        })
        this.asteroids.push(newAst)
    }
}