// Given a string of characters, compress it.

// The length after compression must always be smaller than or equal to the original string.

// After you are done modifying the input string, return the new string.

// Example:

// Input:
// ["aabbccc"]
// ["eeffggii"]
// ["aaaabbaaddbb"]
// ["aab"]
// [""]

// Output:
// ["a2b2c3"]
// ["e2f2g2i2"]
// ["a4b2a2d2b2"]
// ["aab"]
// [""]


import Foundation

func compress(input: String) -> String {
    
    var output: String = ""
    var count: Int = 0
    var currentCharacter: Character?
    var index: Int = 0
    
    for character in input {
        //        print("character: \(character)  and currentCharacter:  \(currentCharacter)")
        
        // this will be executed first for every new input we're given
        if currentCharacter == nil {
            currentCharacter = character
            count += 1
            
            // this will be executed for every character we're counting
        } else if character == currentCharacter! {
            count += 1
            
            // this will be executed for every new character
        } else {
            output += String(currentCharacter!) + String(count)
            currentCharacter = character
            count = 1
            
        }
        
        // this will be executed at the end of the array
        if index == input.count - 1 {
            output += String(currentCharacter!) + String(count)
        }
            
            
        index += 1
        
    }
    
    if output.count <= input.count {
        return output
    } else {
        return input
    }
    
    
}


print(compress(input: "aabbccc"))


