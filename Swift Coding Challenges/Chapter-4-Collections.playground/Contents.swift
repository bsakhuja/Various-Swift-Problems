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

/**********************************************************/
// Challenge 42
// Recreate index(of:)
// Write an extension for all collections that implements the index(of:) method

extension Collection where Iterator.Element: Equatable {
    func challenge42(indexOf: Iterator.Element) -> Int? {
        for (index, element) in self.enumerated() {
            if element == indexOf {
                return index
            }
        }
        return nil
    }
}

assert([1,2,3].challenge42(indexOf: 1) == 0, "Challenge 42 failed")
assert([1,2,3].challenge42(indexOf: 3) == 2, "Challenge 42 failed")
assert([1,2,3].challenge42(indexOf: 5) == nil, "Challenge 42 failed")
assert(["a", "b", "ab", "0"].challenge42(indexOf: "ab") == 2, "Challenge 42 failed")

/**********************************************************/
// Challenge 43
// Linked lists
// Create a linked list of lower English alphabet letters along with a method that traverses all nodes and prints their letters on a single line separated by spaces.

class LinkedListNode<T> {
    
    var letter: T
    var nextNode: LinkedListNode?
    
    init(letter: T) {
        self.letter = letter
    }
    
    
}

class LinkedList<T> {
    var start: LinkedListNode<T>?
    
    func printNodes() {
        var currentNode = start
        
        while let node = currentNode {
//            print(node.letter, terminator: " ")
            currentNode = node.nextNode
        }
    }
}

func challenge43() {
    let list = LinkedList<Character>()
    var previousNode: LinkedListNode<Character>? = nil
    
    for letter in "abcdefghijklmnopqrstuvwxyz" {
        let node = LinkedListNode(letter: letter)
        
        if let predecessor = previousNode {
            predecessor.nextNode = node
        } else {
            list.start = node
        }
        
        previousNode = node
    }
    
    list.printNodes()
}

// challenge43()

/**********************************************************/
// Challenge 44
// LinkedList mid-point
// Extend the linked list class with a new method that returns the node at the midpoint of the linked list using no more than one loop

extension LinkedList {
    
    var centerNode: LinkedListNode<T>? {
        var slow = start
        var fast = start
        
        while fast != nil && fast?.nextNode != nil {
            slow = slow?.nextNode
            fast = fast?.nextNode?.nextNode
        }
        
        return slow
    }
}

func challenge44Test(withString: String) {
    let list = LinkedList<Character>()
    var previousNode: LinkedListNode<Character>? = nil
    
    for number in withString {
        let newNode = LinkedListNode(letter: number)
        
        if let predecessor = previousNode {
            predecessor.nextNode = newNode
        } else {
            list.start = newNode
        }
        previousNode = newNode
    }
    
//    print(list.centerNode?.letter ?? "c")
}

challenge44Test(withString: "12345")
challenge44Test(withString: "1234")
challenge44Test(withString: "abcdefghijklmnopqrstuvwxyz")

/**********************************************************/
// Challenge 45
// Traversing the tree
// Complete challenge 54 first!

/**********************************************************/
// Challenge 46
// Recreate map()
// Write an extension for all  collections that reimplements the map method

extension Collection {
    
    // Generic method that accepts a closure operating on our element type and returns a new type, with the whole method returning an array of that type
    func challenge46<T>(_ transform: (Iterator.Element) throws -> T) rethrows -> [T] {
        
        // create the return array
        var returnValue = [T]()
        
        // loop over all items, trying the transformation and appending it to our return array
        for item in self {
            returnValue.append(try transform(item))
        }
        
        return returnValue
    }
    
    // Marking the parameter with throws means that it might throw, not that it will throw.  Marking the whole thing as rethrows means it needs to be used with a try/catch block only when its parameter really does throw.
    
}

/**********************************************************/
// Challenge 47
// Recreate min()

extension Collection where Iterator.Element: Comparable {
    
    func challenge47() -> Iterator.Element? {
        var min: Iterator.Element?
        
        for item in self {
            if min == nil {
                min = item
            } else if item < min! {
                min = item
            }
        }
        
        return min
    }
    
    // Use guard let to get rid of optionality
    func challenge47b() -> Iterator.Element? {
        guard var min = self.first else { return nil }
        
        for item in self {
            if item < min {
                min = item
            }
        }
        
        return min
    }
    
    // Without accessing the first element twice we get
    func challenge47c() -> Iterator.Element? {
        var iterator = makeIterator()
        guard var min = iterator.next() else { return nil}
        
        while let item = iterator.next() {
            if item < min {
                min = item
            }
        }
        
        return min
    }
    
    // We can also use reduce()
    func challenge47d() -> Iterator.Element? {
        guard let min = self.first else { return nil }
        return reduce(min) { $1 < $0 ? $1 : $0 }
        
        // If the second element is lower than the first element, set min to the second element.  Else set it equal to the first
    }
    
    // We can also use IteratorSequence to avoid getting the first element twice
    func challenge47e() -> Iterator.Element? {
        var iterator = makeIterator()
        guard let min = iterator.next() else { return nil }
        
        return IteratorSequence(iterator).reduce(min) { $1 < $0 ? $1 : $0 }
    }
    
    // A sneaky soluction where we sort then get the first element
    func challenge47f() -> Iterator.Element? {
        return self.sorted().first
    }
}

assert([1,2,3].challenge47() == 1, "Challenge 47 failed")
assert(["q", "f", "k"].challenge47() == "f", "Challenge 47 failed")
assert([4096, 256, 16].challenge47() == 16, "Challenge 47 failed")
assert([String]().challenge47() == nil, "Challenge 47 failed")

/**********************************************************/
// Challenge 48
// Implement a deque data structure
// Create a new data type that models a double-ended queue using generics.  You should be able to push items to the front or back, pop them from the front or back and get the number of items.

struct Deque<T> {
    
    private var contents = [T]()
    var count: Int {
        get {
            return contents.count
        }
        
    }

    
    mutating func pushBack(_ input: T) {
        
        // Simply add the new element at the end of the deque array
        contents.append(input)
        
    }
    
    mutating func pushFront(_ input: T) {
        contents.insert(input, at: 0)
    }
    
    mutating func popFront() -> T? {
        if contents.isEmpty {
            return nil
        } else {
            return contents.removeFirst()
        }
    }
    
    
    mutating func popBack() -> T? {
        return contents.popLast()
    }
    
}

func challenge48() {
    var numbers = Deque<Int>()
    
    numbers.pushBack(5)
    numbers.pushBack(8)
    numbers.pushBack(3)
    
    assert(numbers.count == 3, "Challenge 48 failed")
    assert(numbers.popFront()! == 5, "Challenge 48 failed")
    assert(numbers.popBack()! == 3, "Challenge 48 failed")
    assert(numbers.popFront()! == 8, "Challenge 48 failed")
    assert(numbers.popBack() == nil, "Challenge 48 failed")
}

challenge48()

/**********************************************************/
// Challenge 49
// Sum the even repeats
// Write a function that accepts a variadic array of integers and returns the sum of all numbers that appear an even number of times

func challenge49(_ numbers: Int...) -> Int {
    var sum: Int = 0
    let set = NSCountedSet(array: numbers)
    
    for number in set {
        let numberAsInt = number as! Int
        if set.count(for: numberAsInt) % 2 == 0 {
            sum += numberAsInt
        }
    }
    
    return sum
}

// Without using a force downcast.  Using for case let.
func challenge49b(_ numbers: Int...) -> Int {
    var sum: Int = 0
    let set = NSCountedSet(array: numbers)
    
    for case let item as Int in set {
        if set.count(for: item) % 2 == 0 {
            sum += item
        }
    }
    return sum
}

assert(challenge49(1, 2, 2, 3, 3, 4) == 5, "Challenge 49 failed")
assert(challenge49(5, 5, 5, 12, 12) == 12, "Challenge 49 failed")
assert(challenge49(1, 1, 2, 2, 3, 3, 4, 4) == 10, "Challenge 49 failed")

/**********************************************************/
// Challenge 50
// Count the largest range
// Write a function that accepts an array of positive and negative numbers and returns a closed range containing the position of the contiguous positive numbers that sum to the highest value or nil if nothing was found.

func challenge50(input: [Int]) -> CountableClosedRange<Int>? {

    var bestRange: CountableClosedRange<Int>? = nil
    var bestSum: Int = 0
    
    // These track the current sequence of positive integers
    var currentStart: Int? = nil
    var currentSum: Int = 0
    
    for (index, number) in input.enumerated() {
        if number > 0 {
            
            // Set the start for the current range (if not, use the current index)
            currentStart = currentStart ?? index
            currentSum += number
            
            if currentSum > bestSum {
                bestRange = currentStart!...index
                bestSum = currentSum
            }
        } else {
            // We have a negative number. Reset the current range
            currentSum = 0
            currentStart = nil
        
        }
    }
    
    return bestRange
    
}

assert(challenge50(input: [0,1,1,-1,2,3,1])! == 4...6, "Challenge 50 failed")
assert(challenge50(input: [10,20,30,-10,-20,10,20])! == 0...2,  "Challenge 50 failed")
assert(challenge50(input: [1,-1,2,-1])! == 2...2,  "Challenge 50 failed")
assert(challenge50(input: [2,0,2,0,2])! == 0...0,  "Challenge 50 failed")
assert(challenge50(input: [Int]()) == nil,  "Challenge 50 failed")

/**********************************************************/
// Challenge 51
// Reversing linked lists
