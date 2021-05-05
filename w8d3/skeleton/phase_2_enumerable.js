

Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i])
  }
}


Array.prototype.myMap = function(callback) {
  const result = []
  for (let i = 0; i < this.length; i++) {
    result.push(callback(this[i]))
  }
  return result
}

// callback(accumulator, element) {
// return accumulator + element
//}
// [1,2,3,4], 1
Array.prototype.myReduce = function(callback, initialValue) {

  let acc = initialValue || this[0]
  let start = initialValue ? 0 : 1;

  for (let i = start; i < this.length; i++) {
    acc = callback(acc, this[i])
  }

  return acc
}