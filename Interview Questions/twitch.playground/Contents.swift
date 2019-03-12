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


// Phone screen

// For 1 through 19
func digitToString(_ digit: Int) -> String {
    switch digit {
    case 1: return "one"
    case 2: return "two"
    case 3: return "three"
    case 4: return "four"
    case 5: return "five"
    case 6: return "six"
    case 7: return "seven"
    case 8: return "eight"
    case 9: return "nine"
    case 10: return "ten"
    case 11: return "eleven"
    case 12: return "twelve"
    case 13: return "thirteen"
    case 14: return "fourteen"
    case 15: return "fifteen"
    case 16: return "sixteen"
    case 17: return "seventeen"
    case 18: return "eighteen"
    case 19: return "nineteen"
    default: return "woah-digit"
    }
}

// For 20, 30, 40, 50, 60, 70, 80, 90
func tensToString(_ tensValue: Int) -> String {
    switch tensValue {
    case 2: return "twenty"
    case 3: return "thirty"
    case 4: return "fourty"
    case 5: return "fifty"
    case 6: return "sixty"
    case 7: return "seventy"
    case 8: return "eighty"
    case 9: return "ninety"
    default: return "whoa-tens"
    }
}

// 1 to 999,999
func integerToString(_ number: Int) -> String {
    
    var returnString: String = ""
    
    let hundredThousands = (number / 100000)
    let tenThousands  = (number / 10000)
    let thousands = (number / 1000)
    let hundreds = (number / 100)
    let teens = (number % 100)
    
    if hundredThousands < 10 && tenThousands == 0 {
        returnString += "\(digitToString(hundredThousands)) hundred thousand "
    } else {
        returnString += "\(digitToString(hundredThousands)) hundred "
        
    }
    
    print(tenThousands)
    if tenThousands < 100 &&  tenThousand > 0 {
        if tenThousands % 10 == 0 {
            returnString += "\(tensToString(tenThousands))"
        } else {
            returnString += "\(tensToString(tenThousands/10)) \(digitToString(tenThousands % 10)) thousand "
        }
    }
    
    if thousands < 10 {
        returnString += "\(digitToString(thousands)) thousand "
    }
    
    if hundreds < 10 {
        returnString += "\(digitToString(hundreds)) hundred "
    }
    
    if teens < 20 { // 1 - 19
        returnString += "\(digitToString(teens))"
    } else { // 20 - 99
        if teens % 10 == 0 {
            returnString += "\(tensToString(teens/10))"
        } else {
            returnString += "\(tensToString(teens/10)) \(digitToString(teens % 10))"
        }
    }
    
    return returnString
}

print(integerToString(200263))


