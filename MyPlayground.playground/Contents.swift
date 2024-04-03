import UIKit

let myString: MyOptional<String> = MyOptional("Hello")
print(myString.unwrap(default: "Default")) // Output: "Hello"

let myNil: MyOptional<String> = MyOptional(nil)
print(myNil.unwrap(default: "Default")) // Output: "Default"


