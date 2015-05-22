function range(start, end) {
  if (start === end){
    return [start];
  }
  return [start].concat(range(start+1, end));
}

function exp(base, e) {
  if (e === 0) {
    return 1;
  }
  return base * exp(base, e-1)
}

function fibonacci(n) {
  if (n <= 2) {
    return [1, 1].slice(0, n);
  }

  var fibs = fibonacci(n-1);
  fibs.push(fibs[fibs.length -1] + fibs[fibs.length -2]);
  return fibs;
}

function binary_search(array, target) {
  var pivot = array.length / 2;
  if (target === array[pivot]) {
    return pivot;
  } else if (target < array[pivot]) {
    return binary_search(array.slice(0, pivot), target);
  } else {
    return binary_search(array.slice(pivot, array.length), target) + pivot;
  }
}

function makeChange(amount, coins) {
  if (amount <= 0) {
    return [];
  }

  if (!coins){
    coins = [25, 10, 5, 1];
  }
  if (coins.length === 0) {
    return [];
  }

  var coin_type = 0;
  while (amount < coins[coin_type]) {
    coin_type++;
  }

  remainder = amount - coins[coin_type];
  var new_coins = [];
  for(var i = 0; i < coins.length; i++) {
    if (coins[i] <= coins[coin_type]) {
      new_coins.push(coins[i]);
    }
  }

  return [coins[coin_type]].concat(makeChange(remainder, new_coins));
}

function makeBetterChange(amount, coins) {
  if (amount <= 0) {
    return [];
  }

  if (!coins){
    coins = [25, 10, 5, 1];
  }
  if (coins.length === 0) {
    return [];
  }

  var coin_type = 0;
  while (amount < coins[coin_type]) {
    coin_type++;
  }


  remainder = amount - coins[coin_type];
  var new_coins = [];
  for(var i = 0; i < coins.length; i++) {
    if (coins[i] <= coins[coin_type]) {
      new_coins.push(coins[i]);
    }
  }

  return [coins[coin_type]].concat(makeChange(remainder, new_coins));
}


function mergeSort(array) {
  if (array.length <= 1) {
    return array;
  }

  var mid = array.length / 2;
  var left = array.slice(0, mid);
  var right = array.slice(mid, array.length);

  return merge(mergeSort(left), mergeSort(right));
}

function merge(left, right) {
  var merged = [];
  while (left.length != 0 && right.length != 0) {
    if (left[0] <= right[0]) {
      merged.push(left.shift());
    } else {
      merged.push(right.shift());
    }
  }

  merged = merged.concat(left);
  merged = merged.concat(right);
  return merged;
}


function subsets(array) {
  if (array.length < 1) {
    return [array]
  }
  var output = []

  output.push(array)

  for (var i = 0; i < array.length; i++) {
    var trial = array
    trial.splice(1, 1)
    output.push(subsets(trial))
  }

  return output
}

  // for (var i = 0; i < array.length; i++) {
  //   new_array = array.splice(i, 1);
  //   output.push([new_array]);
  //   output.push(subsets(new_array))
  //   // element = array.splice(0,1)
  // }
  // return output
    // return [element].concat(subsets(array))





console.log(subsets([1, 2]));











//
