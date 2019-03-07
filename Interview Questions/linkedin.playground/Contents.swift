import UIKit

/* This class will be given a list of words (such as might be tokenized
 * from a paragraph of text), and will provide a method that takes two
 * words and returns the shortest distance (in words) between those two
 * words in the provided text.
 * Example:
 *   input: ["the", "quick", "brown", "fox", "quick"]
 *   output: distance("fox", "the") = 3
 *           distance("quick", "fox") = 1
 *
 * "quick" appears twice in the input. There are two possible distance values for "quick" and "fox":
 *     (3 - 1) = 2 and (4 - 3) = 1.
 * Since we have to return the shortest distance between the two words we return 1.
 */


class ElementIndexDistanceFinder {
    
    var wordArray = [String]()
    
    init(elems: [String]) {
        self.wordArray = elems
    }
    
    // e.g., given elems ["the", "quick", "brown", "fox", "the"]
    // distance(between: "quick", and: "fox") = 2
    // distance(between: "fox", and: "the") = 1
    func distance(between first: String, and second: String) -> Int {
        var index1 = -1
        var index2 = -1
        var minDistance = Int.max
        var currentIndex = 0
        
        for word in wordArray {
            
            // we see the first word
            if word == first {
                index1 = currentIndex
                print("found first word at index \(index1)")
            } else if word == second {
                index2 = currentIndex
                print("found second word at index \(index2)")
            }
        
            // We only update the distance if both the words have been found and the found distance is less than the previous minimum distance
            if (index1 != -1 && index2 != -1) && (abs(index1 - index2) < minDistance) {
                minDistance = abs(index1 - index2)
            }

            currentIndex += 1
        }
        
        return minDistance
    }

}

let dist = ElementIndexDistanceFinder(elems: ["the", "quick", "brown", "fox", "quick"])
dist.distance(between: "quick", and: "fox")



/* Implement a function which, given a number, will return "true" if that number
 * has an integer square root and "false" otherwise
 * 49 -> "true", since sqrt(49) = 7 is an integer
 * 50 -> "false", since sqrt(50) = 7.071... is not an integer
 */
func hasIntegerSquareRoot(n: Int) -> Bool {
    let range = 1...n
    for index in range {
        if (index * index) == n {
            return true
        }
        
    }
    
    return false
    
}

//hasIntegerSquareRoot(n: 5)
