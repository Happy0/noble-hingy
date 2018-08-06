var bleno = require('bleno');

var name = 'test test test';
var serviceUuids = ['d7a1b091-f85d-499a-b1e9-b022625d61c0'];

console.log("aw8 state change.");
bleno.on('stateChange', function(state) {

  if (state === 'poweredOn') {
    //
    // We will also advertise the service ID in the advertising packet,
    // so it's easier to find.
    //
    bleno.startAdvertising(name, [serviceUuids], function(err) {
      if (err) {
        console.log(err);
      } else {
        console.log("Advertising")
      }
    });
  }
  else {
    console.log("oh noes, stop advertising");
    bleno.stopAdvertising();
  }
});
