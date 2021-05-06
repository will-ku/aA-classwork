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



function sumRec(arr) {

  if (arr.length === 0) return 0;

  return arr[0] + sumRec(arr.slice(1, arr.length));

}


// 2 ^ 1
function exponent(base, exp) {
  if (exp === 0) return 1;
  return base * exponent(base, exp-1);
}

// n = 4
// 1,1,2,3,5
function fibonacci(n) {
  // base cases
  if (n === 1) return [ 1 ];
  if (n === 2) return [ 1,1 ];
  // n === 3
  // recursive case
  const prevFibSequence = fibonacci(n-1);
  let nextFibNum = prevFibSequence
                        .slice(-2)
                        .reduce((acc, el) => acc + el, 0)

  return prevFibSequence.concat([nextFibNum])
}

// []
// [1]
// [1,2]
// [1,[2]]

function deepDup(arr) {
  const dup = []
  arr.forEach((el) => {
    if (Array.isArray(el)) {
      dup.push(deepDup(el))
    } else {
      dup.push(el)
    }
  })
  return dup;
}

function bsearch(arr, target) {
  if (arr.length === 0) return -1

  const middle = Math.floor(arr.length / 2);

  // 1. if middle is target
  if (arr[middle] === target) {
    return middle;
  } else if (target < arr[middle]) {

    return bsearch(arr.slice(0, middle), target)
  } else if (target > arr[middle]) {
    // 5
    let offset = bsearch(arr.slice(middle+1, arr.length), target)
    // offset 2
    if (offset === -1) return offset
    return middle + offset + 1
  }

}
