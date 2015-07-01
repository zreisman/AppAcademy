function buildList(list) {
  var result = [];
  for (var i = 0; i < list.length; i++) {
    var item = 'item' + list[i];
    var a = i
    result.push(
      function () {
        console.log(item + ' ' + list[a])
      }
    );

    // result.forEach(function (func) {
    //   func();
    // })

  }
  return result;
}

function testList() {
  var fnlist = buildList([1,2,3]);
  // using j only to help prevent confusion - could use i
  for (var j = 0; j < fnlist.length; j++) {
    fnlist[j]();
  }
}

testList();
