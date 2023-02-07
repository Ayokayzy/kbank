import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  // currentValue := 100;

  // let id = 23123214343341;
  // Debug.print(debug_show (id));

  type Time = Int;

  stable var startTime = Time.now();

  // Debug.print(debug_show(startTime));

  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdraw(amount : Float) {
    let tempValue : Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Amout too large, current value less than zero");
    };
  };

  public query func checkBalance() : async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElaspedNs = currentTime - startTime;
    let timeElaspedS = timeElaspedNs / 1000000000;

    currentValue := currentValue * (1.01 ** Float.fromInt(timeElaspedS));
    startTime := currentTime
  }

  // topUp();
};
