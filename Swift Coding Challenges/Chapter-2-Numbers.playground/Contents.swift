import UIKit

// Questions by Paul Hudson

/**********************************************************/
// Challenge 16
// Fizz buzz

func challenge16(toInt: Int) {
    for i in 0...toInt {
        if i % 3 == 0  && i & 5 == 0 {
            print("Fizz Buzz")
        } else if i % 3 == 0 {
            print("Fizz")
        } else if i % 5 == 0 {
            print("Buzz")
        } else {
            print(i)
        }
    }
}

//challenge16(toInt: 100)

/**********************************************************/
// Challenge 17
// Generate a random number in a range

func challenge17(min: Int, max: Int) -> Int {
    return Int.random(in: min...max)
}

assert([1,2,3,4,5].contains(challenge17(min: 1, max: 5)), "Challege 17 failed")
assert([8,9,10].contains(challenge17(min: 8, max: 10)), "Challege 17 failed")
assert([12].contains(challenge17(min: 12, max: 12)), "Challege 17 failed")
assert(![7].contains(challenge17(min: 12, max: 18)), "Challege 17 failed")

/**********************************************************/
// Challenge 18
// Recreate the pow() function
// Takes two positive integers and raises the first to the power of the second

func challenge18(base: Int, toThePowerOf: Int) -> Int {
    guard base > 0, toThePowerOf > 0 else { return 0 }
    
    var result = base
    
    for _ in 1..<toThePowerOf {
        result *= base
    }
    
    return result
}

// Solve the problem recursively
func challenge18b(base: Int, toThePowerOf: Int) -> Int {
    guard base > 0, toThePowerOf > 0 else { return 0 }
    
    if toThePowerOf == 1 { return base }
    
    return challenge18b(base: base, toThePowerOf: toThePowerOf - 1) * base
    
}

assert(challenge18(base: 4, toThePowerOf: 3) == 64, "Challenge 18 failed")
assert(challenge18(base: 2, toThePowerOf: 8) == 256, "Challenge 18 failed")

/**********************************************************/
// Challenge 19
// Swap two numbers
// Swap two positive variable integers a and b without using a temporary variable

var a = 1
var b = 2

var c = 3
var d = 4

func challenge19() {
    (a, b) = (b, a)
    
}

// Solve the problem using the global swap() function
func challenge19b() {
    swap(&c, &d)
}

challenge19()
challenge19b()



assert(a == 2 && b == 1, "Challenge 19 failed")
assert(c == 4 && d == 3, "Challenge 19 failed")

/**********************************************************/
// Challenge 20
// Number is prime
// Accepts an integer as its parameter and returns true if the number is prime

// Brute force solution
func challenge20(number: Int) -> Bool {
    guard number >=  2 else { return false }
    
    for index in 2..<number {
        if number % index == 0 {
            return false
        }
    }
    return true
}

func challenge20b(number: Int) -> Bool {
    guard number >= 2 else { return false }
    guard number != 2 else { return true }
    
    let squareRootRoundedUpToNearestInt = Int(ceil(sqrt(Double(number))))
    
    for index in 2..<squareRootRoundedUpToNearestInt {
        if number % index == 0 {
            return false
        }
    }
    
    return true
}

assert(challenge20(number: 11) == true, "Challenge 20 failed")
assert(challenge20(number: 13) == true, "Challenge 20 failed")
assert(challenge20(number: 4) == false, "Challenge 20 failed")
assert(challenge20(number: 9) == false, "Challenge 20 failed")
assert(challenge20b(number: 16777259) == true, "Challenge 20 failed")

/**********************************************************/
// Challenge 21
// Counting binary ones
// Accepts any positive integer and returns the next highest and lowest number that has the same number of ones in its binary representation.  If either number is not possible, return nil.

func challenge21(number: Int) -> (nextHighest: Int?, nextLowest: Int?) {
    guard number >= 0 else { return (nil, nil) }
    
    // Convert the input integer to a string of the number in binary (base 2)
    let binaryStringOfInput = String(number, radix: 2)
    
    // Count the number of ones in the binary string
    let targetNumberOfOnes = binaryStringOfInput.filter { (char: Character) -> Bool in char == "1" }.count
    
    var nextHighest: Int? = nil
    var nextLowest: Int? = nil
    
    for index in number + 1...Int.max {
        let currentBinary = String(index, radix: 2)
        let currentNumberOfOnes = currentBinary.filter { (char: Character) -> Bool in char == "1" }.count
        
        // If we have a match of the number of ones, we found the next highest because we are increasing the integer amount
        if targetNumberOfOnes == currentNumberOfOnes {
            nextHighest = index
            break
        }
    }
    
    
    for index in (0..<number).reversed() {
        let currentBinary = String(index, radix: 2)
        let currentNumberOfOnes = currentBinary.filter { (char: Character) -> Bool in char == "1"}.count
        
        // If we have a match of the number of ones, we found the next lowest because we are decreasing the integer amount
        if targetNumberOfOnes == currentNumberOfOnes {
            nextLowest = index
            break
        }
    }
    
    return (nextHighest, nextLowest)
}

// Refactoring the code we get this solution
func challenge21b(number: Int) -> (nextHighest: Int?, nextLowest: Int?) {
    guard number >= 0 else { return (nil, nil) }
    
    // Function to return the number of ones in a given number integer
    func ones(in number: Int) -> Int {
        let currentBinary = String(number, radix: 2)
        return  currentBinary.filter { (char: Character) -> Bool in char == "1" }.count
    }
    
    let targetNumberOfOnes = ones(in: number)
    var nextHighest: Int? = nil
    var nextLowest: Int? = nil
    
    for index in (number + 1)...Int.max {
        if ones(in: index) == targetNumberOfOnes {
            nextHighest = index
            break
        }
    }
    
    for index in (0..<number).reversed() {
        if ones(in: index) == targetNumberOfOnes {
            nextLowest = index
            break
        }
    }
    
    return (nextHighest, nextLowest)
}

assert(challenge21b(number: 12) == (17, 10), "Challenge 21 failed")
assert(challenge21b(number: 28) == (35, 26), "Challenge 21 failed")

/**********************************************************/
// Challenge 22
// Binary reverse
// Given an 8-bit integer, return its binary reverse, padded so that it holds precisely eight binary digits.

func challenge22(number: Int) -> Int {
    guard number >= 0 else { return 0 }
    
    let numberInBinary = String(number, radix: 2)
    let differenceToGetToEightBits = 8 - numberInBinary.count
    let paddedBinary = String(repeating: "0", count: differenceToGetToEightBits) + numberInBinary
    let reversedBinary = String(paddedBinary.reversed())
    
    return Int(reversedBinary, radix: 2)!
    
    // 1011 -> 00001101
}

challenge22(number: 32)


