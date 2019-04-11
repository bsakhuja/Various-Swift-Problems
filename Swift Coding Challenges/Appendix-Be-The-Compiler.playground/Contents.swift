import UIKit

// Questions by Paul Hudson

/**********************************************************/
/* Beginner */
/**********************************************************/

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

// F
// Output: the code will not compile due to the fact that the switch was not exhaustive


/**********************************************************/
// Question 2
//let i = 10.2

// F
// i has the data type of double

/**********************************************************/
// Question 3
//let myStr: String
//myStr = "shiny"

// F
// The value of myStr: this code will not compile.

/**********************************************************/
// Question 4
//import Foundation
//let ns = NSString("Hello")
//let swift = String(ns)

// A
// The value of the swift string: this code will not compile.

/**********************************************************/
// Question 5
//let names = ["Amy", "Rory"]
//
//for name in names {
//    name = name.uppercased()
//    print("HELLO, \(name)!")
//}

// B
// The output: this code will not compile.

/**********************************************************/
// Question 6

// How many bits are used to store an Int?

// B
// Answer: it depends on the device

/**********************************************************/
// Question 7

//let names = ["Amy", "Clara"]
//
//for i in 0...names.length {
//    print("Hello, \(names[i])!")
//}

// E
// The output: this code will not compile

/**********************************************************/
// Question 8

//let names = [String]()
//names.append("Amy")
//names.append("Clara")
//names.append("Rory")

// D
// The number of strings names array contains: this code will not compile

/**********************************************************/
// Question 9

//let names = ["Chris", "Joe", "Doug", "Jordan"]
//
//if let name = names[1] {
//    print("Brought to you by \(name)")
//}

// C
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

// E
// The output: the code will not compile
// Use repeat instead of do

/**********************************************************/
// Question 11

//for i in 1...3 {
//    print(i)
//}

// A
// The output: 1, 2, 3

/**********************************************************/
// Question 12

//for i in 3...1 {
//    print(i)
//}

// D
// The output: This code will compile but crash.  Swift does not allow you to generate ranges where the initial value is greater than the end value.


/**********************************************************/
// Question 13

//class Starship {
//    var type: String
//    var age: Int
//}
//
//let serenity = Starship(type: "Firefly", age: 24)
//print(serenity.type)

// D
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

// B
// The output: TARDIS

/**********************************************************/
// Question 15

//import Foundation
//let number = 16.0
//print("\(number) squared is \(number * number), and its square root is \(sqrt(number))")

// D
// The output: "16.0 squared is 256.0 and its square root is 4.0"

/**********************************************************/
// Question 16

//func sayHello(to name: String) -> String {
//    return "Howdy, \(name)!"
//}
//
//print("\(sayHello(to: "Jayne"))")

// E
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

// A
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

// B
// The output: "It's very windy"

/**********************************************************/
// Question 19

//let names = ["Serenity", "Sulaco", "Enterprise", "Galactica"]
//
//for name in names where name.hasPrefix("S") {
//    print(name)
//}

// E
// The output: "Serenity", "Sulaco"

/**********************************************************/
// Question 20

//let oneMillion = 1_000_000
//let oneThousand = oneMillion / 0_1_0_0_0
//print(oneThousand)

// C
// The output: 1000

/**********************************************************/
// Question 21

//let names = ["Serenity", "Sulaco", "Enterprise", "Galactica"]
//
//if let last = names.last {
//    print(last)
//}

// H
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

// B
// The output: "The error message was: Forbidden"

/**********************************************************/
// Question 23

//var motto = "Bow ties are cool"
//motto.replacingOccurrences(of: "Bow", with: "Neck") // "Neck ties are cool"
//print(motto) // "Bow ties are cool"

// E
// The output: "Bow ties are cool"

/**********************************************************/
// Question 24

//let first = ["Sulaco", "Nostromo"]
//let second = ["X-Wing", "TIE Fighter"]
//let third = first + second

// C
// The value of third: "Sulaco", "Nostromo", "X-Wing", "TIE Fighter"

/**********************************************************/
// Question 25

//final class Dog {
//    func bark() {
//        print("Woof!")
//    }
//}
//
//class Corgi: Dog {
//    override func bark() {
//        print("Yip!")
//    }
//}
//
//let muttface = Corgi()
//muttface.bark()

// F
// The output: This code will not compile

/**********************************************************/
// Question 26

//let i = "5"
//let j = i + i

// D
// The value of j: "55" (a string)

/**********************************************************/
// Question 27

//var i = 2
//
//repeat {
//    i *= i * 2
//} while  i < 100
//
//print(i)

// G
// The output: 128

/**********************************************************/
// Question 28

//var numbers = [1, 2, 3]
//numbers += [4]

// C
// Number of items in numbers: 4 ([1,2,3,4])


/**********************************************************/
// Question 29

//let num = UInt.min

// C
// Value of num: 0

/**********************************************************/
// Question 30

//import Foundation
//let number = 16
//print("\(number) squared is \(number * number), and its square root is \(sqrt(number))")

// C
// The output: this code will not compile


/**********************************************************/
/* Intermediate */
/**********************************************************/

/**********************************************************/
// Question 1

let names = ["Pilot": "Wash", "Doctor": "Simon"]
let doctor = names["doctor"] ?? "Bones"
print(doctor)

// I
// Output: "Bones"

/**********************************************************/
// Question 2



/**********************************************************/
// Question 3

/**********************************************************/
// Question 4

/**********************************************************/
// Question 5

/**********************************************************/
// Question 6

/**********************************************************/
// Question 7

/**********************************************************/
// Question 8

/**********************************************************/
// Question 9

/**********************************************************/
// Question 10

