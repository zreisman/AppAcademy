var readline = require('readline');

var reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback){
  if (numsLeft == 0) {
    return completionCallback(sum);
  }

  reader.question("Choose a Number: ", function (rawInput) {
    var num = parseInt(rawInput);
    sum += num;
    numsLeft -= 1;
    addNumbers (sum, numsLeft, completionCallback);
  });
}



addNumbers(0, 3, function (sum) {
  console.log("Total Sum: " + sum);
});
