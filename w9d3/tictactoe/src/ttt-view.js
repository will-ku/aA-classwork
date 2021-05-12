class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    //this.bindEvents();
  }

  bindEvents() {
    $("li.cell").on('click', el => {
      const $li = $(el.currentTarget);
      const pos = $li.data("pos");

      if (!this.game.board.isEmptyPos(pos)){
          alert("Invalid Move");
          return;
      }
      this.makeMove($li);
      this.game.playMove(pos);

      if (this.game.isOver()) {
        alert("Winner " + this.game.winner());
      }
    });
    // playMove takes in a position
    // we might want to save position to each <li>
  }

  makeMove($square) {
    $square.addClass("marked");
    $square.text(this.game.currentPlayer);
  }

  setupBoard() {
    let $ul = $('<ul></ul>');

    for (let i = 0; i < 9; i++) {
      let $li = $('<li></li>');
       
      let x = Math.floor(i / 3);
      let y = i % 3;
      // $li.addClass("unmarked");
      $li.data("pos", [x,y]);

      // i / 3 = would be x; 8 / 3 = 2
      // i % 3 = would be y; 8 % 3 = 2

      $ul.append($li);
    }

    this.$el.append($ul);
    $ul.addClass('board')
    $ul.children().addClass('cell')
  }
}

module.exports = View;
