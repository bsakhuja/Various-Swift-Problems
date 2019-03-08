import UIKit

/* Given a binary search tree, return the closest biggest number of a given  number
 For example,
 
 7
 / \
 3  12
 /  /
 1  8
 \
 9
 
 If I ask for 7, it will return 8.
 If I ask for 9, it will return 12.
 */

class Node {
    let value: Int
    let left: Node?
    let right: Node?
    
    init(value: Int, left: Node?, right: Node?) {
        self.value = value
        self.left = left
        self.right = right
    }
}
//
//var array = [Int]()
//func inorderTraversal(root: Node) {
//    if let leftNode = root.left {
//        inorderTraversal(root: leftNode)
//    }
//
//    array.append(root.value)
//
//    if let rightNode = root.right {
//        inorderTraversal(root: rightNode)
//    }
//}
//
//func closestBiggestNumber(tree: [Int], referenceValue: Int) -> Int {
//    let indexOfReferenceValue = tree.firstIndex(of: referenceValue)
//    if indexOfReferenceValue! < tree.capacity - 1 {
//        return tree[indexOfReferenceValue! + 1]
//    }
//    return tree[tree.capacity - 1]
//
//}
let node9 = Node(value: 9, left: nil, right: nil)
let node8 = Node(value: 8, left: nil, right: node9)
let node12 = Node(value: 12, left: node8, right: nil)
let node1 = Node(value: 1, left: nil, right: nil)
let node3 = Node(value: 12, left: node1, right: nil)
let node7 = Node(value: 7, left: node3, right: node12)
//
//
//inorderTraversal(root: node7)
//print(array)
//print(closestBiggestNumber(tree: array, referenceValue: 3))
