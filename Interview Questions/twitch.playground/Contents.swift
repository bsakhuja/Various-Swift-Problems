import UIKit

// Write a function find duplicates that given an array of integers, it returns any numbers that show up more than once.  If a number shows up three times, it should be listed twice.

func findDuplicates(inputArray: [Int]) -> [Int] {
    var duplicateArray = [Int]()
    var setOfNumbersSeen = Set<Int>()
    
    // Iterate through each number in the input array
    for number in inputArray {
        
        // If the number exists in the set, we append it because it already appears
        if setOfNumbersSeen.contains(number) {
            duplicateArray.append(number)
        }
        
        // Then we add the seen number to the set
        setOfNumbersSeen.insert(number)
    }
    
    // Finally, we return the array of duplicate integers
    return duplicateArray
}

assert(findDuplicates(inputArray: [1, 2, 3, 4, 5]) == [], "findDuplicates(inputArray:) failed")
assert(findDuplicates(inputArray: [1, 1, 2, 3, 3, 3]) == [1, 3, 3], "findDuplicates(inputArray:) failed")
assert(findDuplicates(inputArray: [2, 2]) == [2], "findDuplicates(inputArray:) failed")
assert(findDuplicates(inputArray: [5, 5, 5, 5, 5]) == [5, 5, 5, 5], "findDuplicates(inputArray:) failed")
assert(findDuplicates(inputArray: []) == [], "findDuplicates(inputArray:) failed")


// Write a function doesClick(list:, target:) that given a list of integers and a target integer, returns true if the list clicks and false if the list does not click.  "Clicking" means if for the list, one can place a + (add) or * (multiply) between every number to reach the target integer.  You must use all the numbers in the list.

func doesClick(list: [Int], target: Int) -> Bool {

    var possibleResults = [Int]()
    
    for (index, number) in list.enumerated() {
        guard index < list.count - 1 else { break }
        
        let nextNumber = list[index + 1]
        var resultSoFar: Int?
        
        for i in 0...1 {
            if i == 0 {
                resultSoFar = number + nextNumber
            } else if i == 1 {
                resultSoFar = number * nextNumber
            }
        }
        print(resultSoFar)
    }
    
    return false
}

doesClick(list: [2, 3, 5], target: 25)


assert(doesClick(list: [2, 3, 5], target: 25) == true, "doesClick(list: target:) failed")
assert(doesClick(list: [2, 3, 5], target: 26) == false, "doesClick(list: target:) failed")
assert(doesClick(list: [2, 3, 5], target: 5) == false, "doesClick(list: target:) failed")
