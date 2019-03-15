import UIKit

// Questions by Paul Hudson

/**********************************************************/
// Challenge 55
// Bubble Sort

extension Array where Element: Comparable {
    func challenge55() -> [Element] {
        guard count > 0 else { return self }
        
        var returnValue = self
        var highestSortedIndex = count
        
        // every time we bubble up an element to the end of the array, the end of the array has been sorted, so we can ignore trying to sort it.
        repeat {
            var lastSwapIndex = 0
            
            // loop over all items in the array except the last one
            for index in  0..<highestSortedIndex - 1 {
                // get the current element and the next one
                let element = returnValue[index]
                let next = returnValue[index + 1]
                
                // compare the two elements
                if element > next {
                    // if the element is bigger than the next one, we swap
                    returnValue.swapAt(index, index + 1)
                    
                    lastSwapIndex = index + 1
                }
                
                
            }
            
            highestSortedIndex = lastSwapIndex
        } while highestSortedIndex != 0
        
        // return the sorted array
        return returnValue
    }
}

/**********************************************************/
// Challenge 56
// Insertion Sort

extension Array where Element: Comparable {
    func challenge56() -> [Element] {
        guard count > 1 else { return self }
        
        var returnValue = [Element]()
        
        for unsorted in self {
            if returnValue.count == 0 {
                returnValue.append(unsorted)
            } else {
                var placed = false
                
                for (index, sorted) in returnValue.enumerated() {
                    if unsorted < sorted {
                        returnValue.insert(unsorted, at: index)
                        placed = true
                        break
                    }
                }
                
                if !placed {
                    returnValue.append(unsorted)
                }
            }
        }
        
        return returnValue
    }
    
    
    func challenge56b() -> [Element] {
        guard count > 1 else { return self }
        
        var returnValue =  self
        
        for i in 1..<count {
            var currentItemIndex = i
            
            // take a copy of the current item
            let itemToPlace = returnValue[currentItemIndex]
            
            // keep going around until we're at the start of the array or find an item that's greater than or equal to us
            while currentItemIndex > 0 && itemToPlace < returnValue[currentItemIndex - 1] {
                // move this item to the right
                returnValue[currentItemIndex] = returnValue[currentItemIndex - 1]
                currentItemIndex -= 1
            }
            
            // place our item into its newly sorted place
            returnValue[currentItemIndex] = itemToPlace
        }
        
        return returnValue
    }
}

/**********************************************************/
// Challenge 57
// Isomorphic values
// Write a function that accepts two values and returns true if they are isomorphic
func challenge57(firstValue: Any, secondValue: Any) -> Bool {
    let first = String(describing: firstValue)
    let second = String(describing: secondValue)
    
    guard first.count == second.count else { return false }
    
    var characterMap = [Character: Character]()
    let firstArray = Array(first)
    let secondArray = Array(second)
    
    for (index, character) in firstArray.enumerated() {
        let otherCharacter = secondArray[index]
        
        if let currentMapping = characterMap[character] {
            if currentMapping != otherCharacter {
                return false
            }
        } else {
            if characterMap.values.contains(otherCharacter) {
                return false
            }
            
            characterMap[character] = otherCharacter
        }
    }
    return true
}

/**********************************************************/
// Challenge 58
func challenge58(string: String) -> Bool {
    let validBrackets = "([{<>}])"
    let validCharacterSet = CharacterSet(charactersIn: validBrackets)
    guard string.rangeOfCharacter(from: validCharacterSet) == nil else { return false }
    
    let matchingBrackets: [Character : Character] = ["(": ")", "[": "]", "{": "}", "<": ">"]
    var usedBrackets = [Character]()
    
    for bracket in string {
        if matchingBrackets.keys.contains(bracket) {
            // this is an opening bracket
            usedBrackets.append(bracket)
        } else {
            // this is a closing bracket. try to pull off our previous open
            if let previousBracket = usedBrackets.popLast() {
                if matchingBrackets[previousBracket] != bracket {
                    return false
                }
            } else {
                return false
            }
        }
    }
    return usedBrackets.count == 0
}

/**********************************************************/
// Challenge 59
// Quicksort

extension Array where Element: Comparable {
    func challenge59() -> [Element] {
        guard count > 1 else { return self }
        
        // pivot on the center of the array
        let pivot = self[count / 2]
        
        // create three new buckets that we'll sort outselves into
        var before = [Element]()
        var after = [Element]()
        var equal = [Element]()
        
        // loop over all items, placing each one into a bucket by comparing against our pivot
        for item in self {
            if item < pivot {
                before.append(item)
            } else if item > pivot {
                after.append(item)
            } else {
                equal.append(item)
            }
        }
        
        return before.challenge59() + equal + after.challenge59()
    }
    
    func challenge59b() -> [Element] {
        guard count > 1 else { return self }
        
        let pivot = self[count / 2]
        let before = filter { $0 < pivot }
        let after = filter { $0 > pivot }
        let equal = filter { $0 == pivot }
        
        return before.challenge59b() + equal + after.challenge59b()
    }
    
    mutating func challenge59c(left: Int, right: Int) {
        // make sure we have a sensible range to work with
        guard left < right else { return }
        
        // use the right-hand element because that's moved last
        let pivot = self[right]
        
        // set our split point (the marker where elements start being greater than the pivot) to be the left edge
        var splitPoint = left
        
        // Count through  all the items in the  array
        for i in left..<right {
            
            // If this item is less than our pivot...
            if self[i] < pivot {
                
                // ... move it so that it's at the split point
                (self[i], self[splitPoint]) = (self[splitPoint], self[i])
                
                // Then move the split point forward by one
                splitPoint += 1
            }
        }
        
        // Move our pivot item to the split point
        (self[right], self[splitPoint]) = (self[splitPoint], self[right])
        
        // Recursively call this function on everything before the split point...
        challenge59c(left: left, right: splitPoint - 1)
        
        // And everything after the split point
        challenge59c(left: splitPoint + 1, right: right)
    }
    
}


/**********************************************************/
// Challenge 60
// Tic Tac Toe Winner
func challenge60a(_ board: [[String]]) -> Bool {
    for i in 0 ..< 3 {
        // check each row
        if board[i][0] != "" && board[i][0] == board[i][1] && board[i][0] == board[i][2] {
            return true
            
        }
        // check each column
        if board[0][i] != "" && board[0][i] == board[1][i] && board[0][i] == board[2][i] {
            return true
            
        }
    }
    
    // now check diagonally top left to bottom right
    if board[0][0] != "" && board[0][0] == board[1][1] && board[0][0] == board[2][2] {
        return true
        
    }
    // and check diagonally bottom left to top right
    if board[0][2] != "" && board[0][2] == board[1][1] && board[0][2] == board[2][0] {
        return true
        
    }
    // if we're still here there's no winner
    return false
}

func challenge60b(_ board: [[String]]) -> Bool {
    func isWin(_ first: String, _ second: String, _ third: String) -> Bool {
        guard first != "" else { return false }
        return first == second && first == third
    }
    
    for i in 0 ..< 3 {
        if isWin(board[i][0], board[i][1], board[i][2]) {
            return true
            
        }
        if isWin(board[0][i], board[1][i], board[2][i]) {
            return true
        }
        
    }
    
    if isWin(board[0][0], board[1][1], board[2][2]) {
        return true
    }
    
    if isWin(board[0][2], board[1][1], board[2][0]) {
        return true
    }
    
    return false
}

func challenge60c(_ board: [[String]]) -> Bool {
    func isWin(_ first: String, _ second: String, _ third: String) -> Bool {
        guard first != "" else { return false }
        
        return first == second && first == third
    }
    for i in 0 ..< 3 {
        
        if isWin(board[i][0], board[i][1], board[i][2]) {
            return true
            
        }
        
        if isWin(board[0][i], board[1][i], board[2][i]) {
            return true
        }
        
    }
    return isWin(board[0][0], board[1][1], board[2][2]) || isWin(board[0][2], board[1][1], board[2][0])
}




/**********************************************************/
// Challenge 61
// Find prime numbers
// Write a function that returns an array of prime numbers from 2 up to but excluding N.

func challenge61(upTo max: Int) -> [Int] {
    guard max > 1 else { return [] }
    var sieve = [Bool](repeating: true, count: max)
    sieve[0] = false
    sieve[1] = false
    for number in 2 ..< max {
        if sieve[number] == true {
            for multiple in stride(from: number * number, to: sieve.count, by: number) {
                sieve[multiple] = false
            }
        }
    }
    return sieve.enumerated().compactMap { $1 == true ? $0 : nil }
}

challenge61(upTo: 20)
