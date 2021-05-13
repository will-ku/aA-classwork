class View {
    constructor(game, $dom) {
        this.game = game;
        this.$dom = $dom;
        this.currentTowerClick = undefined;
        this.$currentTowerClick = undefined;

        this.setupTowers();
        this.render();
        this.clickTower();
    }

    clickTower() {
        $("ul").on('click', el => {
            //first click
            if (this.currentTowerClick === undefined) {
                this.$currentTowerClick  = $(el.currentTarget)
                this.currentTowerClick = this.$currentTowerClick.data("outer_index")
                this.$currentTowerClick.addClass("current")   
            } else { //second click  -> valid move? perform move
                const $secTowerClick  = $(el.currentTarget).data("outer_index")
                if (this.game.isValidMove(this.currentTowerClick, $secTowerClick)) {
                    this.game.move(this.currentTowerClick, $secTowerClick)
                    this.render()
                }
                //we want to delete the text value of the li
                this.$currentTowerClick.removeClass("current")
                this.$currentTowerClick = undefined   
                this.currentTowerClick = undefined
            }         
        })

        
    }

    setupTowers() {
        for (let ul = 0; ul < 3; ul++) {
            let $temp_ul = $('<ul></ul>')
            $temp_ul.data("outer_index", ul)

            for (let li = 0; li < 3; li++) {
                let $temp_li = $('<li></li>')

                $temp_li.attr("id",`${ul}${li}`)
                $temp_li.addClass("disc")
                $temp_ul.append($temp_li)

            }
            this.$dom.append($temp_ul)
        }
    }

    render() {
        let towers = this.game.towers;

        for (let i = 0; i < towers.length; i++) {
            for (let j = 0; j < 3; j++) {
                let pos = `${i}${j}`
                let $li = $(`li#${pos}`)
                if (!!towers[i][j]) { //checks for non empty values
                    $li.show()
                    $li.css("width", `${towers[i][j] * 60}px`)
                } else {
                    $li.text("").hide()
                }
            }
        }
    }
}

module.exports = View;