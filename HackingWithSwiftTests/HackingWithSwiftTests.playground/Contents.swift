import UIKit

// Tests from Hacking with Swift
// https://www.hackingwithswift.com/test

/*
 
 EXPERT
 
 */

/************************************************************/

//let names = ["Pilot": "Wash", "Doctor": "Simon"]
//
//for (key, value) in names.enumerated() {
//    let testVar = value
//}

/************************************************************/

//let i = 11
//let j = 20
//
//let name = 9...11 ~= i ? j % 2 == 1 ? "Larry" : "Laura" : "Libby"

/************************************************************/

//let result = UInt8.max.addingReportingOverflow(1)

/************************************************************/

//let (captain, engineer, doctor) = ("Mal", "Kailee", "Simon")
//print(engineer)

/************************************************************/

//let names = ["River", "Kaylee", "Zoe"]
//let result = names.sorted { $0 > $1 }
//print(result)

/************************************************************/

//struct TaylorFan {
//    fileprivate var name: String
//}
//
//var fan = TaylorFan(name: "Kailee")
//fan.name = "Simon"
//print(fan.name)

/************************************************************/

//let numbers = [1, 3, 5, 7, 9]
//let result = numbers.reduce(0, +)

/************************************************************/

//var names = [String]()
//names.append("Amy")
//
//let example1 = names.popLast()
//let example2 = names.popLast()

/************************************************************/

//func greet(_ name: String = "Anonymous") {
//    print("Hello, \(name)!")
//}
//
//let greetCopy = greet
//greetCopy("Dave")


/************************************************************/

//enum Planet: Int {
//    case Mercury = 1
//    case Venus
//    case Earth
//    case Mars
//}
//
//let test = Planet(rawValue: 3)


/************************************************************/

//let names: [String?] = ["Barbara", nil, "Janet", nil, "Peter", nil, "George"]
//let result = names.flatMap { $0 }
//print(result)

/************************************************************/

//func getNumber() -> Int {
//    print("Fetching number...")
//    return 5
//}
//
//func printStatement(_ result: @autoclosure () -> Bool) {
//    // print("Here is the number: \(result())")
//    print("Nothing to see here.")
//}
//
//printStatement(getNumber() == 5)

/************************************************************/

//func fetchCrewMember() -> (job: String, name: String) {
//    return ("Public Relations", "Jayne")
//}
//
//let result = fetchCrewMember().0

/************************************************************/

//func square<T>(_ value: T) -> T {
//    return value * value
//}
//
//print(square(5))

/************************************************************/

//func foo(_ number: Int) -> Int {
//    func bar(_ number: Int) -> Int {
//        return number * 5
//    }
//
//    return number * bar(3)
//}
//
//print(foo(2))

/************************************************************/

//var first = [1, 2, 3]
//var second = ["one", "two", "three"]
//var third = Array(zip(first, second))
//print(third)

/************************************************************/

//func foo(_ function: (Int) -> Int) -> Int {
//    return function(function(5))
//}
//
//func bar<T: BinaryInteger>(_ number: T) -> T {
//    return number * 3
//}
//
//print(foo(bar))

/************************************************************/

//struct Spaceship {
//    fileprivate(set) var name = "Serenity"
//}
//
//var serenity = Spaceship()
//serenity.name = "Jayne's Chariot"
//print(serenity.name)

/************************************************************/

//import Foundation
//
//let data: [Any?] = ["Bill", nil, 69, "Ted"]
//
//for datum in data where !(datum is Hashable) {
//    print(datum)
//}

/************************************************************/

//var spaceships1 = Set<String>()
//spaceships1.insert("Serenity")
//spaceships1.insert("Enterprise")
//spaceships1.insert("TARDIS")
//
//let spaceships2 = spaceships1
//
//if spaceships1.isSubset(of: spaceships2) {
//    print("This is a subset")
//} else {
//    print("This is not a subset")
//}

/************************************************************/

//var names = [String]()
//names.append("Amy")
//let example1 = names.removeLast()
//let example2 = names.removeLast()

/************************************************************/

//let status = "shiny"
//
//for (position, character) in status.reversed().enumerated() where position % 2 == 0 {
//    print("\(position): \(character)")
//}

/************************************************************/

//let string: String = String(describing: String.self)
//print(string)

/************************************************************/

/*
 
 INTERMEDIATE
 
 */

/************************************************************/

//let name = "Simon"
//
//switch name {
//case "Simon":
//    fallthrough
//
//case "Malcom", "Zoe", "Kaylee":
//    print("Crew")
//
//default:
//    print("Not crew")
//}

/************************************************************/

//var i = 1
//
//mainLoop: repeat {
//    i += 2
//
//    switch i % 2 {
//    case 0:
//        break mainLoop
//    default:
//        break
//    }
//} while true
//
//print("Complete!")

/************************************************************/

//import Foundation
//let rounded: Int = round(10.5)
//print("Rounding 10.5 makes \(rounded)")

/************************************************************/

//let numbers = [1, 2, 3].map { [$0, $0] }

/************************************************************/

//var names = [String]()
//names.reserveCapacity(2)
//names.append("Amy")
//names.append("Rory")
//names.append("Clara")

/************************************************************/

//func greet(_ name: inout String) {
//    name = name.uppercased()
//    print("Greetings, \(name)!")
//}
//
//var name = "Mal"
//greet(name)
//print("Goodbye, \(name)!")

/************************************************************/

//func greet(names: String...) {
//    print("Criminal masterminds:", names.joined(separator: ", "))
//}
//
//greet(names: "Malcolm", "Kaylee", "Zoe")

/************************************************************/

//let names = ["Pilot": "Wash", "Doctor": "Simon"]
//let doctor = names["doctor"] ?? "Bones"
//print(doctor)

/************************************************************/

//struct Spaceship {
//    var name: String
//
//    func setName(_ newName: String) {
//        name = newName
//    }
//}
//var enterprise = Spaceship(name: "Enterprise")
//enterprise.setName("Enterprise A")
//print(enterprise.name)

/************************************************************/

//let bigNumber = Int.max
//let biggerNumber = bigNumber + 1
//print(biggerNumber)

/************************************************************/

//func sum(numbers: Int...) -> Int {
//    var result = 0
//
//    for number in numbers {
//        result += number
//    }
//
//    return result
//}
//
//let result = sum(numbers: [1, 2, 3, 4, 5])

/************************************************************/

//var foo: Float = 32
//var bar: Double = 32

/************************************************************/

//let numbers = [1, 3, 5, 7, 9]
//let result = numbers.filter { $0 >= 5 }

/************************************************************/

//var crew = ["Captain": "Malcolm", "Doctor": "Simon"]
//crew = [:]
//print(crew.count)

/************************************************************/

//let people = [String](repeating: "Malkovitch", count: 2)
//print(people)

/************************************************************/

//let possibleNumber = "1701"
//let convertedNumber = Int(possibleNumber)

/************************************************************/

//let numbers = [1, 3, 5, 7, 9]
//let result = numbers.map { $0 * 10 }
//print(numbers)

/************************************************************/

//let number = 5
//
//switch number {
//case 0..<5:
//    print("First group")
//case 5...10:
//    print("Second group")
//case 0...5:
//    print("Third group")
//default:
//    print("Fourth group")
//}

/************************************************************/

//let numbers = [1, 2, 3].flatMap { [$0, $0] }

/************************************************************/

//let names = ["Simon", "River", "Book"]
//
//names.forEach {
//    print($1)
//}

/************************************************************/

/*
 
 NOVICE
 
 */

/************************************************************/

//var numbers = [1, 2, 3]
//numbers += [4]

/************************************************************/

//func sayHello(to name: String) -> String {
//    return "Howdy, \(name)!"
//}
//
//print("\(sayHello(to: "Jayne"))")

/************************************************************/

//struct Starship {
//    var name: String
//}
//
//let tardis = Starship(name: "TARDIS")
//var enterprise = tardis
//enterprise.name = "Enterprise"
//
//print(tardis.name)

/************************************************************/

//var i = 2
//
//repeat {
//    i *= i * 2
//} while i < 100
//
//print(i)

/************************************************************/

//import Foundation
//let ns = NSString("Hello")
//let swift = String(ns)

/************************************************************/

//var motto = "Bow ties are cool"
//motto.replacingOccurrences(of: "Bow", with: "Neck")
//print(motto)

/************************************************************/

//for i in 1...3 {
//    print(i)
//}

/************************************************************/

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

/************************************************************/

//final class Dog {
//    func bark() {
//        print("Woof!")
//    }
//}
//
//class Corgi : Dog {
//    override func bark() {
//        print("Yip!")
//    }
//}
//
//let muttface = Corgi()
//muttface.bark()

/************************************************************/

//let first = ["Sulaco", "Nostromo"]
//let second = ["X-Wing", "TIE Fighter"]
//let third = first + second

/************************************************************/

//import Foundation
//let number = 16.0
//print("\(number) squared is \(number * number), and its square root is \(sqrt(number))")

/************************************************************/

//let i = "5"
//let j = i + i

/************************************************************/

//let i = 3
//
//switch i {
//case 1:
//    print("Number was 1")
//case 2:
//    print("Number was 2")
//case 3:
//    print("Number was 3")
//}

/************************************************************/

//let names = ["Serenity", "Sulaco", "Enterprise", "Galactica"]
//
//for name in names where name.hasPrefix("S") {
//    print(name)
//}

/************************************************************/

//var myStr: String = "0"
//myStr = "shiny"

/************************************************************/

//class Starship {
//    var type: String
//    var age: Int
//}
//
//let serenity = Starship(type: "Firefly", age: 24)
//print(serenity.type)

/************************************************************/

//var i = 2
//
//do {
//    print(i)
//    i *= 2
//} while (i < 128)

/************************************************************/

//let names = [String]()
//names.append("Amy")
//names.append("Clara")
//names.append("Rory")

/************************************************************/

//let i = 10.2

/************************************************************/

//let names = ["Serenity", "Sulaco", "Enterprise", "Galactica"]
//
//if let last = names.last {
//    print(last)
//}

/************************************************************/
