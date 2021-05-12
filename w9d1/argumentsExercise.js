function sum(){
    var i;
    var sum = 0;
    for (i = 0; i < arguments.length; i++) {
        sum += arguments[i];
    }
    return sum;
}

function sum(...args) {
    return args.reduce((previous, current) => {
        return previous + current;
    });
}

Function.prototype.myBind = function(context) {
    this;
    return () => this.apply(context);
}

Function.prototype.myBind = function() {
    this;
    const that = this.arguments[0]; //
    return function () {
        that.apply(arguments.slice(1));
    }
}   
// why is this not printing out?
Function.prototype.myBind1 = function (ctx) {
  const fn = this; // this is the method (says)
  const bindArgs = Array.from(arguments).slice(1); 
  return function _boundFn() {
    const callArgs = Array.from(arguments);
    return fn.apply(ctx, bindArgs.concat(callArgs));
  };//            just the 1st arg, 
};

function sum(...args) {
    return args.reduce((previous, current) => {
        return previous + current;
    });
}

function curriedSum(numArgs) {
    let numbers = [];
    function _curriedSum(num) {
        numbers.push(num);
        if (numbers.length === numArgs ) {
            let total = 0;
            numbers.forEach( (number) => {
                total += number
            })
            return total;
        } else {
            return _curriedSum;
        }
    }
    return _curriedSum; 
}
// not invoking the function reutrns a reference to the function
// this characteristic is what allows us to chain these functions
