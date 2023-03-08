//Naming convention in Motoku is lowercamel case for dynamic data and uppercamel case for actor name, module name, etc.
//candid: It's interrative langugage

import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));
  // currentValue := 100;

  let id = 347209548732079;

  Debug.print(debug_show(id));
  //private function(only accessible in actor)
  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withDraw(amount: Float) {
    if(amount > currentValue){
      Debug.print("You have unsufficient balance!");
      return;
    } else {
      currentValue -= amount;
      Debug.print(debug_show(currentValue))
    }
  };

  public query func showBalance(): async Float {
    return currentValue;
  };

  // topUp();

  public func compound() {
    let currentTime = Time.now();
    let timeEllapsedNS = currentTime - startTime;
    let timeEllapsedS = timeEllapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeEllapsedS));
    startTime := currentTime;
  };

};

// dfx caniter call canister_name function_name
//Orthogonal Persistence
// It reset the variables untill stated otherwise