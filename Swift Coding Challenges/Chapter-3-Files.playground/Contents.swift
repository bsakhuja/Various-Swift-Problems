import UIKit

// Questions by Paul Hudson

/**********************************************************/
// Challenge 27
// Print last lines
let shakespeareFilepath = Bundle.main.path(forResource: "shakespeare", ofType: "txt")!

func challenge27(filename: String, lineCount: Int) -> String {
    guard let input = try? String(contentsOfFile: filename) else { return "" }
    
    var lines = input.components(separatedBy: "\n")
    
    guard lines.count > 0 else { return "" }
    
    lines.reverse()
    
    var output = [String]()
    
    // lineCount + 1 to ignore the whitespace at the end
    for index in 1..<min(lines.count, lineCount + 1) {
        output.append(lines[index])
    }
    
    return output.joined(separator: ", ")
    
}

assert(challenge27(filename: shakespeareFilepath, lineCount: 5) == "Twelfth Night, Othello, Macbeth, King Lear, Julius Caesar", "Challenge 27 failed")

/**********************************************************/
// Challenge 28
// Log a message
// 
