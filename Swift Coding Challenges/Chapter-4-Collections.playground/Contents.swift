import UIKit

// Questions by Paul Hudson

/**********************************************************/
// Challenge 37
// Count the numbers
// Write an extension for collections of integers that returns the number of times a specific digit appears in any of its numbers

extension Collection where Iterator.Element == Int {
    func challenge37(count: Character) -> Int {
        var numberAppearances: Int = 0
        for number in self {
            let numberAsString = String(number)
            for integer in numberAsString {
                if integer == count {
                    numberAppearances += 1
                }
            }
        }
        
        return numberAppearances
    }
    
    // Use reduce() to get the array into a single number.  Then use filter() to pick out each character that matches the input digit.
    func challenge37b(count: Character) -> Int {
        return self.reduce(0) {
            $0 + String($1).filter { (char: Character) -> Bool in
                char == count }.count
        }
    }
}

assert([5, 15, 55, 515].challenge37(count: "5") == 6, "Challenge 37 failed")
assert([5, 15, 55, 515].challenge37(count: "1") == 2, "Challenge 37 failed")
assert([55555].challenge37(count: "5") == 5, "Challenge 37 failed")
assert([55555].challenge37(count: "1") == 0, "Challenge 37 failed")

assert([5, 15, 55, 515].challenge37b(count: "5") == 6, "Challenge 37 failed")
assert([5, 15, 55, 515].challenge37b(count: "1") == 2, "Challenge 37 failed")
assert([55555].challenge37b(count: "5") == 5, "Challenge 37 failed")
assert([55555].challenge37b(count: "1") == 0, "Challenge 37 failed")

/**********************************************************/
// Challenge 38
// Find N smallest
// Write an extension for all collections that returns the N smallest elements as an array, sorted by smallest first, where N is an integer parameter

extension Collection where Iterator.Element: Comparable {
    
    func challenge38(numberOfSmallestElements: Int) -> [Iterator.Element] {
        // Sort the collection by smallest first
        let collectionSorted = self.sorted()
        
        // Get the prefix of the sorted array with numberOfSmallestElements elements.  If the collection is smaller than numberOfSmallestElements, prefix() will return as much as it can.  Then we convert that to an array and return it.
        return Array(collectionSorted.prefix(numberOfSmallestElements))
    }
    
}

assert([1,2,3,4].challenge38(numberOfSmallestElements: 3) == [1,2,3], "Challenge 38 failed")
assert(["q", "f", "k"].challenge38(numberOfSmallestElements: 10) == ["f", "k", "q"], "Challenge 38 failed")
assert([256, 16].challenge38(numberOfSmallestElements: 3) == [16, 256], "Challenge 38 failed")
assert([String]().challenge38(numberOfSmallestElements: 3) == [], "Challenge 38 failed")

/**********************************************************/
// Challenge 39
// Sort a string array by length
// Extend collections with a function that returns an array of strings sorted by their lengths, longest first

extension Collection where Iterator.Element == String {
    func challenge39() -> [String] {
        return self.sorted { $0.count > $1.count }
    }
}

assert(["a", "abc", "ab"].challenge39() == ["abc", "ab", "a"], "Challenge 39 failed")
assert(["paul", "taylor", "adele"].challenge39() == ["taylor", "adele", "paul"], "Challenge 39 failed")
assert([String]().challenge39() == [], "Challenge 39 failed")

/**********************************************************/
// Challenge 40
// Missing numbers in array
// Accepts an array of unsorted numbers from 1 to 100 where 0 or more numbers might be missing.  Returns an array of the missing numbers.

extension Collection where Iterator.Element == Int {
    func challenge40() -> [Int] {
        var missingNumbers = [Int]()
        let set = Set(self)
        
        for index in 1...100 {
            if !set.contains(index) {
                missingNumbers.append(index)
            }
        }
        
        return missingNumbers
    }
    
    // We can also use set algebra.  We construct a set from the input and the test set and subtract one from the other to get the missing numbers.  Then we sort the result.
    func challenge40b() -> [Int] {
        let input = Set(self)
        let testSet = Set(1...100)
        return Array(testSet.subtracting(input)).sorted()
    }
}

var testArray = Array(1...100)
testArray.remove(at: 25)
testArray.remove(at: 20)
testArray.remove(at: 6)

assert(testArray.challenge40() == [7,21,26], "Challenge 40 failed")
assert(testArray.challenge40b() == [7,21,26], "Challenge 40 failed")

/**********************************************************/
// Challenge 41
// Find the median
// Write an extension of collections that accepts an array of Ints and returns the median average or nil if there are no values

extension Collection where Iterator.Element == Int {
    func challenge41() -> Double? {
        guard self.count > 0 else { return nil }
        
        let sorted = self.sorted()
        let sortedCount = sorted.count
        let middle = sortedCount / 2
        
        if sortedCount % 2 == 0 {
            // return the mean average of the two center items for an even sized array
            return Double(sorted[middle] + sorted[middle - 1]) / 2
        } else {
            // return the single center item for an odd sized array
            return Double(sorted[middle])
        }
    }
}

assert([1,2,3].challenge41() == 2, "Challenge 41 failed")
assert([1,2,9].challenge41() == 2, "Challenge 41 failed")
assert([1,3,5,7,9].challenge41() == 5, "Challenge 41 failed")
assert([1,2,3,4].challenge41() == 2.5,  "Challenge 41 failed")
assert([Int]().challenge41() == nil, "Challenge 41 failed")
