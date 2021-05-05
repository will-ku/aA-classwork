// start and end are numbers. return an array of numbers
// start = 1, end = 1
// return []
// start = 1, end = 2
// return [1]

// start = 1, end = 3
// return [1,2,3]
// return [1] + range[2,3]
//      return [2] + range[3,3]
// 
function range(start,end) {
    if (start === end) return [end];
    
    return [start].concat(range(start+1,end))
}