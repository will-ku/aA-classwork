
Array.prototype.bubbleSort = function() {
    while (true) {
        let sorted = true
        for (let i = 0; i < this.length - 1; i++) {
            // let first = this[i];
            // let second = this[i+1];
            if (this[i] > this[i+1]) {
                const temp = this[i];
                this[i] = this[i+1];
                this[i+1] = temp;
                sorted = false
            }
        }
        if (sorted) return this
    }
}

String.prototype.substrings = function() {
    const result = [];

    for (let i = 0; i < this.length; i++) {
        for (let j = i; j < this.length; j++) {
             result.push(this.slice(i,j+1))
        }
    }
    return result
}