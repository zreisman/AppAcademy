
var readline = require('readline');

var reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

function HanoiGame() {
  // for(var a = [];a.length < 3; a.push([])){};
  stacks: [[3,2,1], [], []]

}


function HanoiGame.prototype.isWon(stacks) {
  if (stacks[1].length == 3 && stacks[1].sort() == stacks[1]) {
    return true;
  } else if (stacks[2].length == 3 && stacks[2].sort() == stacks[2]) {
    return true;
  } else {
    return false;
  }
}

function HanoiGame.prototype.isValidMove(startTowerIdx, endTowerIdx) {
  if (!stacks[startTowerIdx]) {
    return false;
  } else if (stacks[startTowerIdx].slice(-1)[0] > stacks[endTowerIdx].slice(-1)[0]) {
    return false;
  } else {
    return true;
  }
}

function HanoiGame.prototype.move(startTowerIdx, endTowerIdx) {
  if isValidMove(startTowerIdx, endTowerIdx) {
    // move
    stacks[endTowerIdx].push(stacks[startTowerIdx].pop());
    return true;
  } else {
    return false;
  }
}

function HanoiGame.prototype.print() {
  for(var i = 0; i < 3; i++) {
    console.log(stacks[0][i] + "    " + stacks[1][i] + "    " stacks[2][i])
  }
}

function HanoiGame.prototype.promptMove(callback) {
  this.print();
  reader.question("Select a start stack?", function(stack1) {
    reader.question("Select an end stack?", function(stack2) {
      var startTowerIdx = parseInt(stack1);
      var endTowerIdx = parseInt(stack2);
      callback();
    })
  })
}

function HanoiGame.prototype.run(completionCallback) {
  this.promptMove(function () {
    if (this.move(startTowerIdx, endTowerIdx) {
      if (this.isWon()) {
        completionCallback();
      }else {
        this.run(completionCallback);
      }

    });

  }

}



game = new HanoiGame();
console.log(game.stacks.length);
