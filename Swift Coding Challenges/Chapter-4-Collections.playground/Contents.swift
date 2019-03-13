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

class LinkedListNode<T>: Hashable {
    

    
    var letter: T
    var nextNode: LinkedListNode?
    var hashValue: Int // hashable for problem 53
    
    init(letter: T, hashValue: Int) {
        self.letter = letter
        self.hashValue = hashValue
    }
    
    static func == (lhs: LinkedListNode<T>, rhs: LinkedListNode<T>) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
}

class LinkedList<T> {
    var start: LinkedListNode<T>?
    private var uniqueHashValue = 0
    
    func printNodes() {
        var currentNode = start
        
        while let node = currentNode {
            //            print(node.letter, terminator: " ")
            currentNode = node.nextNode
        }
    }
    
    func getUniqueHashValue() -> Int {
        uniqueHashValue += 1
        return uniqueHashValue
    }
}

func challenge43() {
    let list = LinkedList<Character>()
    var previousNode: LinkedListNode<Character>? = nil
    
    for letter in "abcdefghijklmnopqrstuvwxyz" {
        let node = LinkedListNode(letter: letter, hashValue: Int(arc4random()))
        
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
        let newNode = LinkedListNode(letter: number, hashValue: Int(arc4random()))
        
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
// Expand your code from Challenge 43 so that it has a reversed() method that returns a copy of itself in reverse

extension LinkedList {
    func reversed() -> LinkedList<T> {
        
        // Create the copy for our return
        let copy = LinkedList<T>()
        
        // Check if we have nodes to copy
        if let startNode = start {
            // Copy the original start node
            var previousCopyNode = LinkedListNode(letter: startNode.letter, hashValue: Int(arc4random()))
            
            // Now start copying from the next node
            var currentNode = start?.nextNode
            
            while let node = currentNode {
                // create a copy of this node
                let copyNode = LinkedListNode(letter: node.letter, hashValue: Int(arc4random()))
                
                // Make it point to the node we created previously
                copyNode.nextNode = previousCopyNode
                
                // Then make it the previous node so we can move forward
                previousCopyNode = copyNode
                currentNode = currentNode?.nextNode
            }
            
            // We're at the end of the list, which is our new start
            copy.start = previousCopyNode
        }
        
        return copy
    }
    
    
    // Alternatively, we could utilize a copy() method in our reverse method
    
    func copy() -> LinkedList<T> {
        
        // Create the copy to return.  Initially an empty list.
        let copy = LinkedList<T>()
        
        // If the list has a start node...
        if let startNode = start {
            
            // ... set the start of the copy to the list's start node
            copy.start = LinkedListNode(letter: startNode.letter, hashValue: Int(arc4random()))
            
            // Then, create a variable that holds the last iteration's node
            var previousCopyNode = copy.start
            
            // Create a variable that holds the current iteration's node
            var currentNode = start?.nextNode
            
            // Traverse the linked list from start to finish
            while let node = currentNode {
                
                // Create a copy of the node
                let copyNode = LinkedListNode(letter: node.letter, hashValue: Int(arc4random()))
                
                // Set the previous node's next node property to the current node we're copying
                previousCopyNode?.nextNode = copyNode
                
                // Set the previous node to the next node
                previousCopyNode = copyNode
                
                // Set the current node to the next node
                currentNode = currentNode?.nextNode
            }
        }
        
        // Finally return the reference to the head
        return copy
    }
    
    func reverseInPlace() {
        
        // Create a variable that points to the current node we're visiting.  Initially the start node for the list.
        var currentNode = start
        
        // Create a variable for the new next node that we'll assign to the current node's nextNode property
        var newNext: LinkedListNode<T>? = nil
        
        // Visit each node
        while let node = currentNode {
            
            // Create the next node
            let next = node.nextNode
            
            // Assign the current node's nextNode to the new next node
            node.nextNode = newNext
            
            // Set the newNext node to the current node (essentially swapping pointers)
            newNext = node
            
            // Set the current node to the next node to continue down the linked list
            currentNode = next
            
        }
        
        // Set the start node to the new
        start = newNext
    }
    
    func reversedUsingCopyAndReverseInPlace() -> LinkedList<T> {
        let copy = self.copy()
        copy.reverseInPlace()
        return copy
    }
}

/**********************************************************/
// Challenge 52
// Sum an array of numbers
// Write one function that sums an array of numbers. The array might contain all integers, all doubles, or all floats.

func challenge52<T: Numeric>(numbers: [T]) -> T {
    var total: T = 0
    
    for number in numbers {
        total = total + number
    }
    
    return total
}

func challenge52b<T: Numeric>(numbers: [T]) -> T {
    return numbers.reduce(0, +)
}

import Accelerate

// Use the Accelerate framework to add floats/doubles really fast
func challenge52c(numbers: [Double]) -> Double {
    var result: Double = 0.0
    vDSP_sveD(numbers, 1, &result, vDSP_Length(numbers.count))
    return result
}

/**********************************************************/
// Challenge 53
// Linked lists with a loop
// Write a method for your linked list that returns the node at the start of its loop (i.e. the one that is linked back to)
extension LinkedList {
    func challenge53() -> LinkedListNode<T>? {
        // Use our linked list's start node as the initial node to read
        var currentNode = start
        
        // The set of seen nodes
        var seen = Set<LinkedListNode<T>>()
        
        // Go through the linked list...
        while let node = currentNode {
            
            // ...if we've seen the node before, there is a loop...
            if seen.contains(node) {
                
                // ...so we return the node
                return node
            } else {
                
                // ...if we are visiting a new node, we add it to our seen set then proceed to visit the next node.
                seen.insert(node)
                currentNode = node.nextNode
            }
        }
        
        return nil
    }
    
    // Using Floyd's cycle-finding algorithm
    func challenge53b() -> LinkedListNode<T>? {
        // We have both a fast pointer and slow pointer
        var slow = start
        var fast = start
        
        // Go through the linked list until we find the end
        while fast != nil && fast?.nextNode != nil {
            
            // Slow moves one space, fast moves two
            slow = slow?.nextNode
            fast = fast?.nextNode?.nextNode
            
            // If fast and slow meet, we've found a loop, so exit the while loop
            if slow === fast {
                break
            }
        }
        
        // If fast or its successor is nil, we've made it to the end of the list, so there is no loop
        guard fast != nil || fast?.nextNode != nil else {
            return nil
        }
        
        // If we're here, we know there is a loop
        slow = start
        
        // Loop through until we've found another match
        while slow! !== fast! {
            // move slow and fast at the same speed now
            slow = slow?.nextNode
            fast = fast?.nextNode
        }
        
        // At this point, slow and fast are the same, so return either of them.
        
        return slow
    }
    
}

/**********************************************************/
// Challenge 54
// Binary search trees
// Create a binary search tree data structure that can be initialized from an unordered array of comparable values, then write a method that returns whether the tree is balanced

class Node<T> {
    var key: T
    var left: Node<T>?
    var right: Node<T>?
    
    init(key: T) {
        self.key = key
    }
}

class BinarySearchTree<T: Comparable>: CustomStringConvertible {
    
    // Description from CustomStringConvertable protocol to print the tree in a nice way
    var description: String {
        guard let first = root else { return "(Empty)"}
        var queue = [Node<T>]()
        queue.append(first)
        
        var output = ""
        
        while queue.count > 0 {
            var nodesAtCurrentLevel = queue.count
            
            while nodesAtCurrentLevel > 0 {
                let node = queue.removeFirst()
                output += "\(node.key)"
                
                if node.left != nil { queue.append(node.left!) }
                if node.right != nil { queue.append(node.right!) }
                
                nodesAtCurrentLevel -= 1
            }
            output += "\n"
        }
        
        return output
    }
    
    var root: Node<T>?
    
    init(array: [T]) {
        
        // Iterate through every item in the array
        for item in array {
            // Create a placed property thats true when we've created a node for this item
            var placed = false
            
            // Check if we have a root node
            if let rootNode = root {
                
                // Make the root node our tracker
                var tracker = rootNode
                
                while placed == false {
                    
                    if item <= tracker.key {
                        if tracker.left == nil {
                            // Make the item the left node if the left node is nil
                            tracker.left = Node(key: item)
                            placed = true
                        }
                        
                        // We already have a left node.  Make that the tracker so we can compare against it.
                        tracker = tracker.left!
                        
                    } else {
                        // This item is greater than our tracker, so it goes to the right
                        if tracker.right == nil {
                            // Make the item the right node if the right node is nil
                            tracker.right = Node(key: item)
                            placed = true
                        }
                        
                        // We already have a right node.  Make that the tracker so we can compare against it.
                        tracker = tracker.right!
                        
                    }
                }
            } else {
                root = Node(key: item)
            }
        }
    }
    
    func isBalanced() -> Bool {
        func minDepth(from node: Node<T>?) -> Int {
            guard let node = node else { return 0 }
            let returnValue = 1 + min(minDepth(from: node.left), minDepth(from: node.right))
            print("Got min depth \(returnValue) for \(node.key)")
            return returnValue
        }
        
        func maxDepth(from node: Node<T>?) -> Int {
            guard let node = node else { return 0 }
            let returnValue = 1 + max(maxDepth(from: node.left), maxDepth(from: node.right))
            print("Got max depth \(returnValue) for \(node.key)")
            return returnValue
        }
        
        guard let root = root else { return true }
        
        let difference = maxDepth(from: root) - minDepth(from: root)
        return difference <= 1
    }
}

//print(BinarySearchTree(array: [2,1,3]).description)
print(BinarySearchTree(array: [5, 1, 7, 6, 2, 1, 9]).description)
