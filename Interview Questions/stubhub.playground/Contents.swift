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
    
    // Initialize the output string
    var output: String = ""
    
    // Initialize the count of the current character to 0
    var currentCharacterCount: Int = 0
    
    // Initialize the current character
    var currentCharacter: Character?
    
    for (index, character) in input.enumerated() {
        // print("character: \(character)  and currentCharacter:  \(currentCharacter)")
        
        // this will be executed first for every new input we're given
        if currentCharacter == nil {
            // set the current character to the first character and increase the character count by 1
            currentCharacter = character
            currentCharacterCount += 1
            
            // this will be executed for every character (besides the first)
        } else if character == currentCharacter! {
            currentCharacterCount += 1
            
            // this will be executed for every new character
        } else {
            output.append("\(currentCharacter!)\(currentCharacterCount)")
            currentCharacter = character
            currentCharacterCount = 1
        }
        
        // this will be executed at the end of the array
        if index == input.count - 1 {
            output.append("\(currentCharacter!)\(currentCharacterCount)")
        }
        
    }
    
    // Only return the output string if it is shorter than the input.  If the input is shorter, return that.
    if output.count <= input.count {
        return output
    } else {
        return input
    }
    
    
}


print(compress(input: "aaabcdefffff"))


