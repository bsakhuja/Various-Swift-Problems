import UIKit


// MARK: - Implement a queue with two stacks
// stack is last in, first out (LIFO)
// queue is first in, first out (FIFO)
// keep two stacks called inbox and outbox
// to ENQUEUE, we push the new element to the outbox
// to DEQUEUE, if the outbox is empty, we refill it by popping each element from inbox onto outbox. then we pop and return the top element from outbox.

//public struct Stack<T> {
//    fileprivate var array = [T]()
//
//    public var isEmpty: Bool {
//        return array.isEmpty
//    }
//
//    public var count: Int {
//        return array.count
//    }
//
//    public mutating func push(_ element: T) {
//        array.append(element)
//    }
//
//    public mutating func pop() -> T? {
//        return array.popLast()
//    }
//
//    public var top: T? {
//        return array.last
//    }
//}
//
//class Queue<T> {
//    private var inbox = Stack<T>()
//    private var outbox = Stack<T>()
//
//    func queue(item: T) {
//        inbox.push(item)
//    }
//
//    func dequeue() -> T {
//        if outbox.isEmpty {
//            while !inbox.isEmpty {
//                outbox.push(inbox.pop()!)
//            }
//        }
//        return outbox.pop()!
//
//    }
//}

// CRACKING THE CODING INTERVIEW
// MARK: - 1.1
// Implement an algorithm to determine if a string has all unique characters using only an array.
// idea: iterate through the string, keeping track of all new characters. create new array of seen characters. for each character, iterate through seencharacters array and check if it contains the character
//func hasUniqueCharacters(string: String) -> Bool {
//    var seenCharacters = [Character]()
//    for character in string {
//        if seenCharacters.contains(character) {
//            return false
//        }
//        seenCharacters.append(character)
//
//    }
//    return true
//
//}
//
//hasUniqueCharacters(string: "is this thing on?")



// MARK: 1.3
// Write a method to replace all spaces  in a string with '%20'
//func urlify(string: String) -> String {
//    var newString = ""
//    for character in string {
//        if character == " " {
//            newString.append("%20")
//        } else {
//            newString.append(character)
//        }
//    }
//    return newString
//}
//
//urlify(string: "the apple sauce")

// MARK: -. 2.1
// Remove duplicates from an unsorted linked list
//func removeLinkedListDuplicates(head: Node) -> Node {
//    let tempHead = head
//    var seen = [Int]()
//    while tempHead.next != nil {
//        if seen.contains(tempHead.next.value) {
//            if let nextNext = tempHead.next.next {
//                tempHead.next = nextNext
//            }
//        }
//
//    }
//    return head
//}

// MARK: - 3.1
// How would you use a single array to implement three stacks

// MARK: - 3.2
// How would you design a stack which, in addition to push and pop , has a function min, which returns the minimum element
//func stackMin(stack: Stack) -> Int {
//    var minSeen = Int.max
//    while !stack.isEmpty() {
//        let temp = stack.pop()
//        if temp < minSeen {
//            minSeen = temp
//        }
//    }
//}

// MARK: - 3.3
// Implement a data structure SetOfStacks that creates a new stack when the previous stack exceeds some threshold.  SetOfStacks should be composed ot several stacks and should create a new stack once the previous one exceeds capacity.

// MARK: - 3.4
// Implement MyQueue class which implements a queue using two stacks

// MARK: - 3.6
// An animal shelter, which holds only dogs and cats, operates on a strictly FIFO basis (queue). People must adopt either the "oldest" of all animals at the shelter, or they can select a dog or cat and receive the oldest one of those.  Create the data structure to maintain this system and implement operation such as enqueue, dequeueAny, dequeueDog, and dequeueCat.

// MARK: - 4.1
// Given a directed graph, design an algorithm to find out whether there is a route between two nodes

// MARK: - 4.2
// Given a sorted (increasing order) array with unique integer elements, write an algorithm to create a binary search tree with minimal height

// MARK: - 4.4
// Implement a function to check if a binary tree is balanced.  For the purpose of this question, a balanced tree is defined to be a tree such that the heights of the two subtrees of any node never differ by more than one.

// MARK: - 4.5
// Implement a function to check if a binary tree is a binary search tree
//func isBST(root: Node) -> Bool {
//    if let left = root.left {
//        if left.value > root.value {
//            return false
//        }
//        return isBST(root: left)
//    }
//    if let right = root.right {
//        if right.value < root.value {
//            return false
//
//        }
//        return isBST(root: right)
//    }
//    return true
//}
//
//isBST(root: node7)

// MARK: - 4.6
// Write an algorithm to find the "next" node (i.e. in-order successor) of a given node in a binary search tree.  You may assume that each node has a link to its parent.

// MARK: - 4.10
// T1 and T2 are two very large binary trees with T1 much bigger than T2.  Create an algorithm to determine if T2 is a subtree of T1.  A tree T2 is a subtree of tree T1 if there exists a node n in T1 such that the subtree of n is identical to T2.  That is if you cut off the tree at node n, the two trees would be identical.

// MARK: - 5.1
// You are given two 32-bit numbers N and M and two bit positions i and j. Write a method to insert M into N such that M starts at bit j and ends at bit i.  You can assume that the bits j through i have enough space to fit all of M.  If you have M = 10011, you can assume that there are at least 5 bits between j and i.  You would not, for example, have j  = 3 and i = 2 because M would not fully fit between bit 3 and bit 2.
// Example: Input N = 100000000000, M = 10011, i = 2, j = 6
// Output N = 100000010011

// MARK: - 7.1
// Design the data structures for a generic deck of cards
//struct card {
//    let suit: String
//    let value: String
//
//    init(suit: String, value: String) {
//        self.suit = suit
//        self.value = value
//    }
//}

// MARK: - 7.2
// Imagine you have a call center with three levels of employees: respondent, manager, and director.  An incoming telephone call must be first allocated to a respondent who is free.  If the respondent can't handle the call, he or she must escalate the call to a manager.  if the manager is not available, the call should be escalated to a director.  Design the classes and data structures for this problem.  Implement a method called dispatchCall() which assigns a call to the first available employee.

// MARK: - 7.5
// Design the data structures for an online book reader system.

// MARK: - 7.7
// Explain how you would design a chat server.  In particular, provide details about the various backend components, classes, and methods.  What would be the heardest problems to solve?

// MARK: - 7.11
// Explain the data structures and algorithms that you would use to design an in-memory file system.  Illustrate with an example with code where possible.

// MARK: - 7.12
// Design and implement a hashtable which uses chaining (linked lists) to handle collisions.

// MARK: - 8.1
// A child is running up a staircase with n steps and can either 1 step, 2 steps, or 3 steps at a time. Implement a method to count how many possible ways the child can run up the stairs.

// MARK: - 8.2
// Imagine a robot sitting on the upper left corner of a grid with r rows and c columns.  The robot can only move in two directions (right and down).  Certain cells are off limits sich that the robot cannot step on them. Design an algorithm to find a path for the robot from the top left to the bottom right.

// MARK: - 8.3
// A magic index in an array A[0..n-1] is defined to be an index such that A[i] = i.  Given a sorted array of distinct integers, write a method to find a magic index if one exists in array A.  What if the values are not distinct?

// MARK: - 8.4

// MARK: - 8.7
// MARK: - 8.8
// MARK: - 9.1
// MARK: - 9.2
// MARK: - 9.3
// MARK: - 9.4
// MARK: - 10.3
// MARK: - 10.9
// MARK: - 10.10
// MARK: - 14.5
// MARK: - 15.1
// MARK: - 16.4
// MARK: - 16.17
// MARK: - 16.24
// MARK: - 17.22
// MARK: - 17.23
