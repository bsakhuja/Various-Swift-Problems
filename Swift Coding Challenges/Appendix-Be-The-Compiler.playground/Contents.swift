import UIKit

// Questions by Paul Hudson

/**********************************************************/
// Question 1

//let i = 3
//switch i {
//case 1:
//    print("Number was 1")
//case 2:
//    print("Number was 2")
//case 3:
//    print("Number was 3")
//}

// Output: the code will not compile due to the fact that the switch was not exhaustive


/**********************************************************/
// Question 2
//let i = 10.2

// i has the data type of double

/**********************************************************/
// Question 3
//let myStr: String
//myStr = "shiny"

// The value of myStr: this code will not compile.

/**********************************************************/
// Question 4
//import Foundation
//let ns = NSString("Hello")
//let swift = String(ns)

// The value of the swift string: this code will not compile.

/**********************************************************/
// Question 5
//let names = ["Amy", "Rory"]
//
//for name in names {
//    name = name.uppercased()
//    print("HELLO, \(name)!")
//}

// The output: this code will not compile.

/**********************************************************/
// Question 6

// How many bits are used to store an Int?

// Answer: it depends on the device

/**********************************************************/
// Question 7

//let names = ["Amy", "Clara"]
//
//for i in 0...names.length {
//    print("Hello, \(names[i])!")
//}

// The output: this code will not compile

/**********************************************************/
// Question 8

//let names = [String]()
//names.append("Amy")
//names.append("Clara")
//names.append("Rory")

// The number of strings names array contains: this code will not compile

/**********************************************************/
// Question 9

//let names = ["Chris", "Joe", "Doug", "Jordan"]
//
//if let name = names[1] {
//    print("Brought to you by \(name)")
//}

// The output: this code will not compile
// if let is not necessary since names does not contain optional strings


/**********************************************************/
// Question 10

//var i = 2
//
//do {
//    print(i)
//    i *= 2
//} while (i < 128)

// The output: the code will not compile
// Use repeat instead of do

/**********************************************************/
// Question 11

//for i in 1...3 {
//    print(i)
//}

// The output: 1, 2, 3

/**********************************************************/
// Question 12

//for i in 3...1 {
//    print(i)
//}

// The output: 3, 2, 1


/**********************************************************/
// Question 13

//class Starship {
//    var type: String
//    var age: Int
//}
//
//let serenity = Starship(type: "Firefly", age: 24)
//print(serenity.type)

// The output: the code will not compile
// There are no initializers for the class Starship

/**********************************************************/
// Question 14

//struct Starship {
//    var name: String
//}
//
//let tardis = Starship(name: "TARDIS")
//var enterprise = tardis
//enterprise.name = "Enterprise"
//
//print(tardis.name)

// The output: TARDIS

/**********************************************************/
// Question 15

//import Foundation
//let number = 16.0
//print("\(number) squared is \(number * number), and its square root is \(sqrt(number))")

// The output: "16.0 squared is 256.0 and its square root is 4.0"

/**********************************************************/
// Question 16

//func sayHello(to name: String) -> String {
//    return "Howdy, \(name)!"
//}
//
//print("\(sayHello(to: "Jayne"))")

// The output: "Howdy, Jayne!

/**********************************************************/
// Question 17

//struct Spaceship {
//    var name: String {
//        willSet {
//            print("I'm called \(newValue)!")
//        }
//    }
//}
//
//var serenity = Spaceship(name: "Serenity")
//serenity.name = "TARDIS"

// The output: "I'm called TARDIS"

/**********************************************************/
// Question 18

//enum Weather {
//    case sunny
//    case cloudy
//    case windy(speed: Int)
//}
//
//let today: Weather = .windy(speed: 10)
//
//switch today {
//case .sunny, .cloudy:
//    print("It's not that windy")
//case .windy(let speed) where speed >= 10:
//    print("It's very windy")
//default:
//    print("It's a bit windy")
//}

// The output: "It's very windy"

/**********************************************************/
// Question 19

//let names = ["Serenity", "Sulaco", "Enterprise", "Galactica"]
//
//for name in names where name.hasPrefix("S") {
//    print(name)
//}

// The output: "Serenity", "Sulaco"

/**********************************************************/
// Question 20

//let oneMillion = 1_000_000
//let oneThousand = oneMillion / 0_1_0_0_0
//print(oneThousand)

// The output: 1000

/**********************************************************/
// Question 21

let names = ["Serenity", "Sulaco", "Enterprise", "Galactica"]

if let last = names.last {
    print(last)
}

// The output: "Galactica"

/**********************************************************/
// Question 22

// You're using a method named willThrowAnError() and it is marked using throws because it will always throw the error "Forbidden"

//enum forbidden: Error {
//    case Forbidden
//}
//
//func willThrowAnError() throws {
//    throw forbidden.Forbidden
//}
//
//do {
//    try willThrowAnError()
//} catch {
//    print("The error message was: \(error)")
//}

// The output: "The error message was: Forbidden"

/**********************************************************/
// Question 23

var motto = "Bow ties are cool"
motto.replacingOccurrences(of: "Bow", with: "Neck") // "Neck ties are cool"
print(motto) // "Bow ties are cool"

// The output: "Bow ties are cool"

/**********************************************************/
// Question 24

/**********************************************************/
// Question 25

/**********************************************************/
// Question 26

/**********************************************************/
// Question 27

/**********************************************************/
// Question 28

/**********************************************************/
// Question 29

/**********************************************************/
// Question 30

/**********************************************************/
// Question 31

/**********************************************************/
// Question 32

/**********************************************************/
// Question 33

