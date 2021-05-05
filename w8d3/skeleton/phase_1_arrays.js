Array.prototype.uniq = function() {
    const result = [];
    this.forEach (function(el){
        if (!result.includes(el)) result.push(el)
    })
    return result;
}

Array.prototype.twoSum = function() {

    for (let i = 0; i < this.length - 1; i++) {
        let first = this[i];
        // console.log(first)
        for (let j = i + 1; j < this.length; j++) {
            // console.log(second)
            let second = this[j];
            if (first + second === 0) {
                return [first, second];
            }
        }
    }
    return null;
}

// Array.prototype.twoSum = function() {
// 	var result = [];

// 	for (var i = 0; i < this.length; i++) {
// 		for (var j = i + 1; j < this.length; j++) {
// 			if (this[i] + this[j] === 0) {
// 				return [this[i], this[j]];
// 			}
// 		}
// 	}
// 	return result;
// }