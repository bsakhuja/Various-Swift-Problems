import UIKit
import Foundation

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
// Write a logging function that accepts a path to a log file on disk as well as a new log message.  Your function should open the log file (or create it if it does not already exist), then append the new message to the log with the current date and time.

func challenge28(log message: String, to logFile: String) {
    var existingLog = (try? String(contentsOfFile: logFile)) ?? ""
    
    existingLog.append("\(Date()): \(message)\n")
    
    do {
        try existingLog.write(toFile: logFile, atomically: true, encoding: .utf8)
    } catch {
        print("Failed to write to log: \(error.localizedDescription)")
    }
}

/**********************************************************/
// Challenge 29
// Documents directory
// Write a function that returns a URL to the user's documents directory

func challenge29() -> URL {
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
}

/**********************************************************/
// Challenge 30
// New JPEGs
// Write a function that accepts a path to a directory and returns an array of all JPEGs that have been created in the last 48 hours

func challenge30(directory: String) -> [String] {
    let fileManager = FileManager.default
    let directoryURL = URL(fileURLWithPath: directory)
    
    guard let files = try? fileManager.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else { return [] }
    
    var jpegs = [String]()
    
    for file in files {
        if file.pathExtension == "jpg" || file.pathExtension == "jpeg" {
            guard let attributes = try? fileManager.attributesOfItem(atPath: file.path) else { continue }
            guard let creationDate = attributes[.creationDate] as? Date else { continue }
            
            if creationDate > Date(timeIntervalSinceNow: -60 * 60 * 48) {
                jpegs.append(file.lastPathComponent)
            }
        }
    }
    
    return jpegs
}

/**********************************************************/
// Challenge 31
// Copy recursively
// Write a function that accepts two paths: the first should point to a directory to copy and the second should be where the directory should be copied to.  Return true if the directory and all of its contents were copied successfully; false if the copy failed, or the user specified something other than a directory.

func challenge31(source: String, destination: String) -> Bool {
    let fileManager = FileManager.default
    var isDirectory: ObjCBool = false
    
    guard fileManager.fileExists(atPath: source, isDirectory: &isDirectory) || isDirectory.boolValue == false else { return false }
    
    let sourceURL = URL(fileURLWithPath: source)
    let destinationURL = URL(fileURLWithPath: destination)
    
    do {
        try fileManager.copyItem(at: sourceURL, to: destinationURL)
    } catch {
        print("Copy failed: \(error.localizedDescription)")
        return false
    }
    
    return true
}

/**********************************************************/
// Challenge 32
// Word frequency
// Write a function that accepts a filename on disk and loads it into a string then returns the frequency of a word in that string.

func challenge32(fileName: String, count: String) -> Int {
    // convert the input to a string
    guard let inputString = try? String(contentsOfFile: fileName) else { return 0 }
    
    // create the set of characters to separate the words by
    var nonLetters = CharacterSet.letters.inverted
    nonLetters.remove("'") // for example I'm is a word (we dont want to split that up into multiple words
    
    // Create an array of the words
    let allWords = inputString.components(separatedBy: nonLetters)
    
    // Add each word to an NSCountedSet
    let wordsSet = NSCountedSet(array: allWords)
    
    // Return the count of the word we're looking for
    return wordsSet.count(for: count)
}

/**********************************************************/
// Challenge 33
// Find duplicate filenames
// Write a function that accepts the name of a directory to scan and returns an array of filenames that appear more than once in that directory or any of its subdirectories.

func challenge33(directory: String) -> [String] {
    
    // instantiate filemanager
    let fileManager = FileManager.default
    let directoryURL = URL(fileURLWithPath: directory)
    
    // Get all the files (subdirectories included)
    guard let files = fileManager.enumerator(at: directoryURL, includingPropertiesForKeys: nil) else { return [] }
    
    // the return array (set of duplicate files)
    var duplicates = Set<String>()
    
    // the set of seen files
    var seen = Set<String>()
    
    //
    for case let file as URL in files {
        
        // We don't care about folders
        guard file.hasDirectoryPath == false else { continue }
        
        let filename = file.lastPathComponent
        
        // If we have seen the filename before, add it to the duplicates.  The fact that duplicates is a set takes care of adding the element more than once since a set does not allow duplicates.
        if seen.contains(filename) {
            duplicates.insert(filename)
        }
        
        seen.insert(filename)
    }
    
    return Array(duplicates)
}


/**********************************************************/
// Challenge 34
// Find executables
// Write a function that accepts the name of a directory to scan and returns an array containing the name of any executable files in there
func challenge34(directory: String) -> [String] {
    
    // The filemanager
    let fileManager = FileManager.default
    let directoryURL = URL(fileURLWithPath: directory)
    
    // Get all the files
    guard let files = try? fileManager.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else { return [] }
    
    // The executables to return
    var executables = [String]()
    
    for file in files {
        // We don't care about folders (considered an executable)
        guard file.hasDirectoryPath == false else { continue }
        
        if fileManager.isExecutableFile(atPath: file.path) {
            executables.append(file.lastPathComponent)
        }
    }
    return executables
}

/**********************************************************/
// Challenge 35
// Convert images
// Write a function that accepts a path to a directory then converts any JPEGs to PNGs, leaving the originals intact.

// For iOS
func challenge35iOS(in directory: String) {
    let fileManager = FileManager.default
    let directoryURL = URL(fileURLWithPath: directory)
    
    // Get the files in the directory
    guard let files = try? fileManager.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else { return }
    
    // Go through each file
    for file in files {
        // Ensure the file is a JPEG
        guard file.pathExtension == "jpeg" || file.pathExtension == "jpg" else { continue }
        
        // Get the image as a UIImage
        guard let image = UIImage(contentsOfFile: file.path) else { continue }
        
        // Convert to PNG
        guard let png = image.pngData() else { continue }
        
        // Get the filename for the new PNG
        let newFileName = file.deletingPathExtension().appendingPathComponent("png")
        
        // Finally, write the new image
        _ = try? png.write(to: newFileName)
    }
}

/**********************************************************/
// Challenge 36
// Print error lines
// Write a function that accepts a path to a log file on disk, and returns how many lines start with "[ERROR]".  The log file could be as large as 10GB, but also may not exist

class ChunkedFileReader {
    var fileHandle: FileHandle?
    
    // We keep adding to the buffer until eventually we find a line break or hit the end of the file
    var buffer: Data
    
    // This should be between 1024 and 8192 for production; it determines how much of the file is read in each step
    let chunkSize: Int = 4
    
    // This determines what we consider to be the end of a line
    let delimiter = "\n".data(using: .utf8)!
    
    init(path: String) {
        // open the file handle and prepare the buffer
        fileHandle = FileHandle(forReadingAtPath: path)
        buffer = Data(capacity: chunkSize)
    }
    
    func readLine() -> String? {
        // find the delimiter in our buffer
        var rangeOfDelimiter = buffer.range(of: delimiter)
        
        // Loop until we find a delimiter
        while rangeOfDelimiter == nil {
            // try to read a chunk from the file handle, or escape
            guard let chunk = fileHandle?.readData(ofLength: chunkSize) else { return nil }
            
            if chunk.count == 0 {
                // the chunk was read successfully but was empty (we reached the end of the file)
                if buffer.count > 0 {
                    // the buffer has something left in it; send it back and make sure to clear the buffer's remnants when it's finished
                    
                    defer { buffer.count = 0 }
                    
                    return String(data: buffer, encoding: .utf8)
                    
                }
                
                // we reached th end of the line and the buffer was empty
                return nil
            } else {
                // We read some data.  Append it to our buffer
                buffer.append(chunk)
                
                // Now, re-scan for the delimiter
                rangeOfDelimiter = buffer.range(of: delimiter)
            }
        }
        
        // We can only make it here if we found a delimiter.  It might be anywhere inside our buffer.  We want to pull out everything in our buffer from the start up to where the delimiter lies
        let rangeOfLine = 0..<rangeOfDelimiter!.upperBound
        
        // Convert that range to a string
        let line = String(data: buffer.subdata(in: rangeOfLine), encoding: .utf8)
        
        // then remove it from the buffer
        buffer.removeSubrange(rangeOfLine)
        
        // send the line back, removing the trailing line break at the end
        return line?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
func challenge36(fileName: String) -> Int {
    var totalErrors = 0
    
    let reader = ChunkedFileReader(path: fileName)
    
    while let line = reader.readLine() {
        if line.hasPrefix("[ERROR]") {
            totalErrors += 1
        }
    }
    
    return totalErrors
}





