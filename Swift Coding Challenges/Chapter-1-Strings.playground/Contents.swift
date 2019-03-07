import UIKit

// Questions by Paul Hudson

/**********************************************************/
// Challenge 1
// Are the letters unique?
func challenge1(input: String) -> Bool {
    var setOfChars = Set<Character>()
    
    for character in input {
        if setOfChars.contains(character) {
            return false
        } else {
            setOfChars.insert(character)
        }
    }
    return true
}

// A smarter solution
// Because sets cannot contain duplicate items by nature, we can just compare the count of elements in the input string and respective set.
func challenge1b(input: String) -> Bool {
    return Set(input).count == input.count
}

assert(challenge1(input: "No duplicates") == true, "Challenge 1 failed")
assert(challenge1(input: "abcdefghijklmnopqrstuvwxyz") == true, "Challenge 1 failed")
assert(challenge1(input: "AaBbCc") == true, "Challenge 1 failed")
assert(challenge1(input: "Hello, world") == false, "Challenge 1 failed")

/**********************************************************/
// Challenge 2
// Is the string a palindrome?
func challenge2(input: String) -> Bool {
    let lowercasedString = input.lowercased()
    if lowercasedString == String(lowercasedString.reversed()) {
        return true
    } else {
        return false
    }
}

assert(challenge2(input: "rotator") == true, "Challenge 2 failed")
assert(challenge2(input: "Rats live on no evil star") == true, "Challenge 2 failed")
assert(challenge2(input: "Never odd or even") == false, "Challenge 2 failed")
assert(challenge2(input: "Hello, world") == false, "Challenge 2 failed")

/**********************************************************/
// Challenge 3
// Do two strings contain the same characters?

func challenge3(s1: String, s2: String) -> Bool {
    let s1Sorted = s1.sorted()
    let s2Sorted = s2.sorted()

    return s1Sorted == s2Sorted
}

assert(challenge3(s1: "abca", s2: "abca") == true, "Challenge 3 failed")
assert(challenge3(s1: "abc", s2: "cba") == true, "Challenge 3 failed")
assert(challenge3(s1: "a1 b2", s2: "b1 a2") == true, "Challenge 3 failed")
assert(challenge3(s1: "abc", s2: "abca") == false, "Challenge 3 failed")
assert(challenge3(s1: "abc", s2: "Abc") == false, "Challenge 3 failed")
assert(challenge3(s1: "abc", s2: "cbAa") == false, "Challenge 3 failed")
assert(challenge3(s1: "abcc", s2: "abca") == false, "Challenge 3 failed")

/**********************************************************/
// Challenge 4
// Does one string contain another?

extension String {
    func challenge4(input: String) -> Bool {
        // range(of: ) returns the position of one string inside another.  We check if input is inside of self (implicit).  If it returns nil, we return false.  Otherwise, we return true as input is contained in the implicit self string.
        return range(of: input, options: .caseInsensitive) != nil
    }

}

assert("Hello, world".challenge4(input: "Hello") == true, "Challenge 4 failed")
assert("Hello, world".challenge4(input: "WORLD") == true, "Challenge 4 failed")
assert("Hello, world".challenge4(input: "Goodbye") == false, "Challenge 4 failed")


/**********************************************************/
// Challenge 5
// Count the characters

func challenge5(c: Character, s: String) -> Int {
    var count: Int = 0
    
    for character in s {
        if c == character {
            count += 1
        }
    }
    
    return count
}

// Other solutions:
// Solve the problem functionally with reduce().  It will start with 0 and go over every character in the string s.  When we match the character in the string, it increases the reduce counter ($0) by 1.  Otherwise, reduce() returns the current reduce counter ($0).
func challenge5b(c: Character, s: String) -> Int {
    return s.reduce(0) {
        $1 == c ? $0 + 1 : $0
    }
}

// Solve the problem using NSCountedSet.  This solution is wasteful because it requires a lot of overhead.  It would be less wasteful if we counted several different characters as well.  Walking through the code, we create an array of strings by converting each character in the input string.  Then, we create a counted set from the string array and return the count.
func challenge5c(c: Character, s: String) -> Int {
    let array = s.map { String($0) }
    let counted = NSCountedSet(array: array)
    
    return counted.count(for: c)
}

// Solve the problem using .replacingOccurrences(of:).  We just remove each instance of character c in the string s.  We then just get the difference between the two to get the number of times the character appeared in the string.
func challenge5d(c: Character, s: String) -> Int {
    let modified = s.replacingOccurrences(of: String(c), with: "")
    return s.count - modified.count
}

assert(challenge5(c: "a", s: "The rain in Spain") == 2, "Challenge 5 failed")
assert(challenge5(c: "i", s: "Mississippi") == 4, "Challenge 5 failed")
assert(challenge5(c: "i", s: "Hacking with Swift") == 3, "Challenge 5 failed")


/**********************************************************/
// Challenge 6
// Remove duplicate letters from a string

func challenge6(input: String) -> String  {
    var charsSeen = Set<String>()
    var newString: String = ""
    
    for char in input {
        if !charsSeen.contains(String(char)) {
            newString.append(char)
        }
        
        charsSeen.insert(String(char))
    }
    return newString
}

// Solve the problem using NSOrderedSet, which is a set which preserves order.  We must use typecasting twice.  Once from Character to String with String($0).  Then from Array<Any> to Array<String>.
func challenge6b(input: String) -> String {
    let array = input.map { String($0) }
    let set = NSOrderedSet(array: array)
    let letters = Array(set) as! Array<String>
    return letters.joined()
}

// Solve the problem using brute force.  Use a character array then iterate through every letter and check if it's already in the used array.  If it isn't, add the character to  the array.  Then return the string version of the array.
func challenge6c(input: String) -> String {
    var usedCharacters = [Character]()
    
    for char in input {
        if !usedCharacters.contains(char) {
            usedCharacters.append(char)
        }
    }
    
    return String(usedCharacters)
}

// Solve the problem using a dictionary and updateValue() to maintain a list of the used characters.  By calling updateValue() we changethe value assigned to the key while also returning either the original value or nil if there wasn't one.  If you call updateValue() and get back nil it means that the character wasn't in the dictionary but it is now.  We use filter() on the input string's character property.  So, we filter the characters so that only those that return nil for updateValue() are used in the return array.
func challenge6d(input: String) -> String {
    var usedCharacters = [Character : Bool]()
    
    let result = input.filter {
        usedCharacters.updateValue(true, forKey: $0) == nil
    }
    
    return String(result)
}

assert(challenge6(input: "wombat") == "wombat", "Challenge 6 failed")
assert(challenge6(input: "hello") == "helo", "Challenge 6 failed")
assert(challenge6(input: "Mississippi") == "Misp", "Challenge 6 failed")

/**********************************************************/
// Challenge 7
// Condense whitespace

// "[space]+" or " +" in regular expression means match one or more spaces.  Here, we match and replace one or more spaces with just one space.
func challenge7(input: String) -> String {
    return input.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
}

// Solve the problem using components(separatedBy:).  It removes any empty items  and joins  the remainder elements with a space.
func challenge7b(input: String) -> String {
    let components = input.components(separatedBy: .whitespacesAndNewlines)
    return components.filter { !$0.isEmpty }.joined(separator: " ")
}

// Solve the problem by looping
func challenge7c(input: String) -> String {
    var seenSpace = false
    var returnValue = ""
    
    for letter in input {
        if letter == " " {
            if seenSpace { continue }
            seenSpace = true
        } else {
            seenSpace = false
        }
        
        returnValue.append(letter)
    }
    
    return returnValue
    
}
assert(challenge7(input: "a   b   c") == "a b c", "Challenge 7 failed")
assert(challenge7(input: "    a") == " a", "Challenge 7 failed")
assert(challenge7(input: "abc") == "abc", "Challenge 7 failed")

/**********************************************************/
// Challenge 8
// String is rotated

func challenge8(input1: String, input2: String) -> Bool {
    guard input1.count == input2.count else { return false }
    
    let twiceString = input1 + input1
    
    return twiceString.contains(input2)
    
}

assert(challenge8(input1: "abcde", input2: "eabcd") == true, "Challenge 8 failed")
assert(challenge8(input1: "abcde", input2: "cdeab") == true, "Challenge 8 failed")
assert(challenge8(input1: "abcde", input2: "abced") == false, "Challenge 8 failed")
assert(challenge8(input1: "abc", input2: "a") == false, "Challenge 8 failed")

/**********************************************************/
// Challenge 9
// Find pangrams (a string that contains every letter exactly once)

func challenge9(input: String) -> Bool {
    let inputLowercased = input.lowercased()
    let inputSet = Set(inputLowercased)
    let letters = inputSet.filter { $0 >= "a" && $0 <= "z"}
    return letters.count == 26
}

assert(challenge9(input: "The quick brown fox jumps over the lazy dog.") == true, "Challenge 9 failed")
assert(challenge9(input: "The quick brown fox jumped over the lazy dog.") == false, "Challenge 9 failed")

/**********************************************************/
// Challenge 10
// Vowels and Consonants
// Return a tuple containing the number of vowels and consonants

func challenge10(input: String) -> (vowels: Int, consonants: Int) {
    var vowelsAndConsonants: (vowels: Int, consonants: Int) = (0, 0)
    let consonantsSet =  Set(["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"])
    let vowelsSet = Set(["a", "e",  "i", "o", "u"])
    let inputLowercased = input.lowercased()
    
    for letter in inputLowercased {
        if vowelsSet.contains(String(letter)) {
            vowelsAndConsonants.vowels += 1
        } else if consonantsSet.contains(String(letter)) {
            vowelsAndConsonants.consonants += 1
        }
    }
    
    return vowelsAndConsonants
}

assert(challenge10(input: "Swift Coding Challenges") == (6, 15), "Challenge 10 failed")
assert(challenge10(input: "Mississippi") == (4, 7), "Challenge 10 failed")

/**********************************************************/
// Challenge 11
// Three Different Letters
// Accepts two strings and returns true if they are identical in length but have no more than three different letters, taking case and string order into account.

func challenge11(input1: String, input2: String) -> Bool {
    guard input1.count == input2.count else { return false }
    
    let input1Array = Array(input1)
    let input2Array = Array(input2)
    var numberOfDifferentLetters: Int = 0
    
    for (index, letterForInput1) in input1Array.enumerated() {
        let letterForInput2 = input2Array[index]
        
        if letterForInput1 != letterForInput2 {
            numberOfDifferentLetters += 1
        }
        
        if numberOfDifferentLetters == 4 {
            return false
        }
        
    }
    return true
}

assert(challenge11(input1: "Clamp", input2: "Cramp") == true, "Challenge 11 failed")
assert(challenge11(input1: "Clamp", input2: "Crams") == true, "Challenge 11 failed")
assert(challenge11(input1: "Clamp", input2: "Grams") == true, "Challenge 11 failed")
assert(challenge11(input1: "Clamp", input2: "Grans") == false, "Challenge 11 failed")
assert(challenge11(input1: "Clamp", input2: "Clam") == false, "Challenge 11 failed")
assert(challenge11(input1: "clamp", input2: "maple") == false, "Challenge 11 failed")

/**********************************************************/
// Challenge 12
// Find longest prefix
// Accepts a string of words with a similar prefix, separated by spaces, and returns the longest substring that prefixes them all.

func challenge12(input: String) -> String {
    // separate string of words into an array of words
    let words = input.components(separatedBy: " ")
    
    // check if we get a first word.  if not, return an empty string
    guard let first = words.first else { return "" }
    
    var currentPrefix = ""
    var longestPrefixSeen = ""
    
    // iterate through the characters in the first word
    for letter in first {
        
        // append the current letter to the currentPrefix variable.  Getting longer with each iteration.
        currentPrefix.append(letter)
        
        // Iterate through each word and check if the word contains the prefix.  If not, we return the longest prefix seen from the last iteration of the outer for loop.
        for word in words {
            if !word.hasPrefix(currentPrefix) {
                return longestPrefixSeen
            }
        }
        
        // Update the longest prefix once we get here since all of the words contain it.
        longestPrefixSeen = currentPrefix
    }
    
    return longestPrefixSeen
}

assert(challenge12(input: "swift switch swill swim") == "swi", "Challenge 12 Failed")
assert(challenge12(input: "flip flap flop") == "fl", "Challenge 12 Failed")

/**********************************************************/
// Challenge 13
// Run-length encoding
// Takes a string  as an input and returns how often each letter is repeated in a single run, taking case into account.


func challenge13(input: String) -> String {
    var compressedString = ""
    let inputArray = Array(input)
    
    var currentLetterCount = 0
    var currentLetter: Character?
    
    for letter in inputArray {
        
        if letter == currentLetter {
            currentLetterCount += 1
            
        } else {
            if let current = currentLetter {
                compressedString.append("\(current)\(currentLetterCount)")
            }
            
            currentLetter = letter
            currentLetterCount = 1
        }
    }
    
    if let current = currentLetter {
        compressedString.append("\(current)\(currentLetterCount)")
    }
    
    return compressedString
}

assert(challenge13(input: "aabbcc") == "a2b2c2", "Challenge 13 failed")
assert(challenge13(input: "aaabaaabaaa") == "a3b1a3b1a3", "Challenge 13 failed")
assert(challenge13(input: "aaAAaa") == "a2A2a2", "Challenge 13 failed")


/**********************************************************/
// Challenge 14
// String Permutations
// Print all permutations of a given input string

func challenge14(input: String, current: String = "") {
    let length = input.count
    let inputAsArray = Array(input)
    
    if length == 0 {
        print(current)
        print("********")
    } else {
        print(current)
        
        for index in 0..<length {
            // get the letters before the current index
            let left = String(inputAsArray[0..<index])
            
            // get the letters after the current index
            let right = String(inputAsArray[index + 1..<length])
            
            // put those two together and move on
            challenge14(input: left + right, current: current + String(inputAsArray[index]))
        }
    }
}

//challenge14(input: "a") // prints "a"
//challenge14(input: "ab") // prints "ab" and "ba"
//challenge14(input: "abc") // prints "abc", "acb", "bac", "bca", "cab", "cba"
//challenge14(input: "wombat") // prints 720 permutations

/**********************************************************/
// Challenge 15
// Reverse the words in a string
// Given a sentence, return a string with each of the words reversed but in the right order

func challenge15(input: String) -> String {
    var reversedWords: [String] = []
    let inputWords = input.components(separatedBy: " ")
    
    for word in inputWords {
        reversedWords.append(String(word.reversed()))
    }
    
    return reversedWords.joined(separator: " ")
}

// Solve the problem using map()
func challenge15b(input: String) -> String {
    let parts = input.components(separatedBy: " ")
    let reversed = parts.map { String($0.reversed()) }
    return reversed.joined(separator: " ")
}

assert(challenge15(input: "Swift Coding Challenges") == "tfiwS gnidoC segnellahC", "Challenge 15 failed")
assert(challenge15(input: "The quick brown fox") == "ehT kciuq nworb xof", "Challenge 15 failed")
