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

// 32 -> binary -> 100000 -> pading -> 00100000 -> reverse -> 00000100 -> decimal -> 4
assert(challenge22(number: 32) == 4, "Challenge 22 failed")

// 4 -> binary -> 101001 -> pading -> 00101001 -> reverse -> 10010100 -> decimal -> 148
assert(challenge22(number: 4) == 32, "Challenge 22 failed")
assert(challenge22(number: 41) == 148, "Challenge 22 failed")
assert(challenge22(number: 148) == 41, "Challenge 22 failed")

/**********************************************************/
// Challenge 23
// Integer disguised as string
// Given a string, return true if it only contains numbers (i.e. the digits 0 through 9)

func challenge23(input: String) -> Bool {
    return UInt(input) != nil
}

// iterate through every letter in the string
func challenge23b(input: String) -> Bool {
    for letter in input {
        if Int(String(letter)) == nil {
            return false
        }
    }
    
    return true
}

// Use rangeOfCharacter(from:) to provide a character set and return the location of those characters in the search
func challenge23c(input: String) -> Bool {
    return input.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
}

// Or we can specify the exact characters we are looking for
func challenge23d(input: String) -> Bool {
    return input.rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789").inverted) == nil
}

assert(challenge23(input: "01010101") == true, "Challenge 23 failed")
assert(challenge23(input: "123456789") == true, "Challenge 23 failed")
assert(challenge23(input: "9223372036854775808") == true, "Challenge 23 failed")
assert(challenge23(input: "1.01") == false, "Challenge 23 failed")

/**********************************************************/
// Challenge 24
// Add numbers inside a string
// Given a string, return the sum of all the numbers found.

func challenge24(input: String) -> Int {
    var currentNumber: String = ""
    var sum: Int = 0
    
    for letter in input {
        let letterString = String(letter)
        
        if Int(letterString) != nil {
            currentNumber += letterString
        } else {
            sum += Int(currentNumber) ?? 0
            currentNumber = ""
        }
    }
    
    sum += Int(currentNumber) ?? 0
    
    return sum
}

// Using regular expressions
func challenge24b(input: String) -> Int {
    // '\\d' means anything that is a number
    let regex = try! NSRegularExpression(pattern: "(\\d+)", options: [])
    let matches = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))
    
    let allNumbers = matches.compactMap { Int((input as NSString).substring(with: $0.range)) }
    
    return allNumbers.reduce(0, +)
}

// Using Swift's built-in regular expression replacement code
// Split the input into just the numbers separated by dashes.
// Then create an array of the numbers and use reduce to sum up the values
func challenge24c(input: String) -> Int {
    // '\\D' means anything that isn't a number
    return input.replacingOccurrences(of: "\\D+", with: "-", options: .regularExpression).split(separator: "-").reduce(0) { $0 + Int(String($1))! }
}

assert(challenge24(input: "a1b2c3") == 6, "Challenge 24 failed")
assert(challenge24(input: "a10b20c30") == 60, "Challenge 24 failed")
assert(challenge24(input: "h8ers") == 8, "Challenge 24 failed")

assert(challenge24b(input: "a1b2c3") == 6, "Challenge 24b failed")
assert(challenge24b(input: "a10b20c30") == 60, "Challenge 24b failed")
assert(challenge24b(input: "h8ers") == 8, "Challenge 24b failed")

assert(challenge24c(input: "a1b2c3") == 6, "Challenge 24c failed")
assert(challenge24c(input: "a10b20c30") == 60, "Challenge 24c failed")
assert(challenge24c(input: "h8ers") == 8, "Challenge 24c failed")


/**********************************************************/
// Challenge 25
// Calculate a square root by hand
// Given a positive integer, return the square root, rounded down to the nearest int

func challenge25(input: Int) -> Int {
    guard input > 0 else { return 0 }
    
    for index in 0...(input / 2 + 1) {
        if index * index > input {
            return index - 1
        }
    }
    
    return 0
}

// Using binary search
func challenge25b(input: Int) -> Int {
    // Specify an upper bound of half the input number + 1
    var upperbound = (input / 2) + 1
    
    // Specify a lower bound of 0
    var lowerbound = 0
    
    // If the lowerbound + 1 is greater than or equal to the upperbound, we've overshot our mark.  Then we break out of the loop and return the lowerbound.
    while lowerbound + 1 < upperbound {
        
        // Specify the midpoint of the two bounds (half the difference plus the shift up from the lowerbound
        let midpoint = ((upperbound - lowerbound) / 2) + lowerbound
        
        // Square the midpoint and compare it against the input number
        let midpointSquared = midpoint * midpoint
        
        // The midpointSquared is less than the input.  We increase the lowerbound to the midpoint and try again.
        if midpointSquared < input {
            lowerbound = midpoint
            
            // midpointSquared is more than the input.  We lower the upperbound to the midpoint and try again.
        } else if midpointSquared > input {
            upperbound = midpoint
            
            // If we have a match, we found our answer
        } else if midpointSquared == input {
            return midpoint
        }
        
    }
    
    return lowerbound
    
}

// Using pow() a.k.a the sneaky approach.  Get half the power (aka the square root).
func challenge25c(input: Int) -> Int {
    guard input > 0 else { return 0 }
    return Int(floor(pow(Double(input), 0.5)))
}

assert(challenge25(input: 9) == 3, "Challenge 25 failed")
assert(challenge25(input: 16777216) == 4096, "Challenge 25 failed")
assert(challenge25(input: 16) == 4, "Challenge 25 failed")
assert(challenge25(input: 15) == 3, "Challenge 25 failed")
assert(challenge25(input: -13) == 0, "Challenge 25 failed")

assert(challenge25b(input: 9) == 3, "Challenge 25 failed")
assert(challenge25b(input: 16777216) == 4096, "Challenge 25 failed")
assert(challenge25b(input: 16) == 4, "Challenge 25 failed")
assert(challenge25b(input: 15) == 3, "Challenge 25 failed")
assert(challenge25b(input: -13) == 0, "Challenge 25 failed")

assert(challenge25c(input: 9) == 3, "Challenge 25 failed")
assert(challenge25c(input: 16777216) == 4096, "Challenge 25 failed")
assert(challenge25c(input: 16) == 4, "Challenge 25 failed")
assert(challenge25c(input: 15) == 3, "Challenge 25 failed")
assert(challenge25c(input: -13) == 0, "Challenge 25 failed")


/**********************************************************/
// Challenge 26
// Subtract without subtract
// Take two integers and return the difference between the two

func challenge26(subtract: Int, from: Int) -> Int {
    // Simply flip the sign of the subtract integer and add the two together
    return from + (-subtract)
}

// If we're being pedantic about the '-' operator though, we can multiply by -1 instead
func challenge26b(subtract: Int, from: Int) -> Int {
    return from + -1 * subtract
}

// If we're being *really* pedantic, we can use the ~ (NOT) operator
// For 8-bit integers, the eighth bit is the sign of the integer. The remaining 7 bits are dedicated to the absolute value.
// For example 01000000 is 64 and  11000000 is -64.
// If we do ~(01000000) we get 10111111 which is -65.
// All we need to do is add 1 to get the reversed sign of the original integer.
func challenge26c(subtract: Int, from: Int) -> Int {
    // for example, subtract = 64 and from = 164.
    // ~subtract = -65 -> ~subtract + 1 = -64 -> add from to result (164 + (-64)) -> 100
    return from + (~subtract + 1)
}

assert(challenge26(subtract: 5, from: 9) == 4, "Challenge 26 failed")
assert(challenge26(subtract: 5, from: -9) == -14, "Challenge 26 failed")
assert(challenge26(subtract: 10, from: 30) == 20, "Challenge 26 failed")

assert(challenge26b(subtract: 5, from: 9) == 4, "Challenge 26 failed")
assert(challenge26b(subtract: 5, from: -9) == -14, "Challenge 26 failed")
assert(challenge26b(subtract: 10, from: 30) == 20, "Challenge 26 failed")

assert(challenge26c(subtract: 5, from: 9) == 4, "Challenge 26 failed")
assert(challenge26c(subtract: 5, from: -9) == -14, "Challenge 26 failed")
assert(challenge26c(subtract: 10, from: 30) == 20, "Challenge 26 failed")
