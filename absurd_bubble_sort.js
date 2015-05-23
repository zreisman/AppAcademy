
var readline = require('readline');

var reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

function askIfGreaterThan(el1, el2, callback) {
  reader.question(("Is " + el1 + " > " + el2 + "?"), function(rawInput) {
      if (rawInput === "yes") {
        callback(true);
      } else {
        callback(false);
      }
  });
}

function innerBubbleSortLoop(array, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i == array.length - 1) {
    outerBubbleSortLoop(madeAnySwaps);
  } else {
    askIfGreaterThan(array[i], array[i+1], function(boolean) {
      if(boolean) {
        var tempArrayI = array[i];
        array[i] = array[i + 1];
        array[i + 1] = tempArrayI;
        innerBubbleSortLoop(array, ++i, true, outerBubbleSortLoop);
      } else {
        innerBubbleSortLoop(array, ++i, madeAnySwaps, outerBubbleSortLoop);
      }
    })
  }
}

function absurdBubbleSort(array, sortCompletionCallback) {
  function outerBubbleSortLoop (madeAnySwaps) {
    // Begin an inner loop if `madeAnySwaps` is true, else call
    // `sortCompletionCallback`.
    if (madeAnySwaps) {
      innerBubbleSortLoop(array, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(array);
    }
  }

  // Kick the first outer loop off, starting `madeAnySwaps` as true.
  outerBubbleSortLoop(true);
}

absurdBubbleSort([1, 5, 8, 2, 4], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});
