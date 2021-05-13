/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module) => {

eval("class Game {\n  constructor() {\n    this.towers = [[3, 2, 1], [], []];\n  }\n  // [0][0]\n\n  isValidMove(startTowerIdx, endTowerIdx) {\n      const startTower = this.towers[startTowerIdx];\n      const endTower = this.towers[endTowerIdx];\n\n      if (startTower.length === 0) {\n        return false;\n      } else if (endTower.length == 0) {\n        return true;\n      } else {\n        const topStartDisc = startTower[startTower.length - 1];\n        const topEndDisc = endTower[endTower.length - 1];\n        return topStartDisc < topEndDisc;\n      }\n  }\n\n  isWon() {\n      // move all the discs to the last or second tower\n      return (this.towers[2].length == 3) || (this.towers[1].length == 3);\n  }\n\n  move(startTowerIdx, endTowerIdx) {\n      if (this.isValidMove(startTowerIdx, endTowerIdx)) {\n        this.towers[endTowerIdx].push(this.towers[startTowerIdx].pop());\n        return true;\n      } else {\n        return false;\n      }\n  }\n\n  print() {\n      console.log(JSON.stringify(this.towers));\n  }\n\n  promptMove(reader, callback) {\n      this.print();\n      reader.question(\"Enter a starting tower: \", start => {\n        const startTowerIdx = parseInt(start);\n        reader.question(\"Enter an ending tower: \", end => {\n          const endTowerIdx = parseInt(end);\n          callback(startTowerIdx, endTowerIdx);\n        });\n      });\n  }\n\n  run(reader, gameCompletionCallback) {\n      this.promptMove(reader, (startTowerIdx, endTowerIdx) => {\n        if (!this.move(startTowerIdx, endTowerIdx)) {\n          console.log(\"Invalid move!\");\n        }\n\n        if (!this.isWon()) {\n          // Continue to play!\n          this.run(reader, gameCompletionCallback);\n        } else {\n          this.print();\n          console.log(\"You win!\");\n          gameCompletionCallback();\n        }\n      });\n  }\n}\n\nmodule.exports = Game;\n\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/hanoi-view.js":
/*!***************************!*\
  !*** ./src/hanoi-view.js ***!
  \***************************/
/***/ ((module) => {

eval("class View {\n    constructor(game, $dom) {\n        this.game = game;\n        this.$dom = $dom;\n        this.currentTowerClick = undefined;\n        this.$currentTowerClick = undefined;\n\n        this.setupTowers();\n        this.render();\n        this.clickTower();\n    }\n\n    clickTower() {\n        $(\"ul\").on('click', el => {\n            //first click\n            if (this.currentTowerClick === undefined) {\n                this.$currentTowerClick  = $(el.currentTarget)\n                this.currentTowerClick = this.$currentTowerClick.data(\"outer_index\")\n                this.$currentTowerClick.addClass(\"current\")   \n            } else { //second click  -> valid move? perform move\n                const $secTowerClick  = $(el.currentTarget).data(\"outer_index\")\n                if (this.game.isValidMove(this.currentTowerClick, $secTowerClick)) {\n                    this.game.move(this.currentTowerClick, $secTowerClick)\n                    this.render()\n                }\n                //we want to delete the text value of the li\n                this.$currentTowerClick.removeClass(\"current\")\n                this.$currentTowerClick = undefined   \n                this.currentTowerClick = undefined\n            }         \n        })\n\n        \n    }\n\n    setupTowers() {\n        for (let ul = 0; ul < 3; ul++) {\n            let $temp_ul = $('<ul></ul>')\n            $temp_ul.data(\"outer_index\", ul)\n\n            for (let li = 0; li < 3; li++) {\n                let $temp_li = $('<li></li>')\n\n                $temp_li.attr(\"id\",`${ul}${li}`)\n                $temp_li.addClass(\"disc\")\n                $temp_ul.append($temp_li)\n\n            }\n            this.$dom.append($temp_ul)\n        }\n    }\n\n    render() {\n        let towers = this.game.towers;\n\n        for (let i = 0; i < towers.length; i++) {\n            for (let j = 0; j < 3; j++) {\n                let pos = `${i}${j}`\n                let $li = $(`li#${pos}`)\n                if (!!towers[i][j]) { //checks for non empty values\n                    $li.show()\n                    $li.css(\"width\", `${towers[i][j] * 60}px`)\n                } else {\n                    $li.text(\"\").hide()\n                }\n            }\n        }\n    }\n}\n\nmodule.exports = View;\n\n//# sourceURL=webpack:///./src/hanoi-view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const HanoiGame = __webpack_require__(/*! ./game */ \"./src/game.js\")\nconst HanoiView = __webpack_require__(/*! ./hanoi-view */ \"./src/hanoi-view.js\")\n\n$(() => {\n  const rootEl = $('.hanoi');\n  const game = new HanoiGame();\n  new HanoiView(game, rootEl);\n});\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;