import UIKit
// MARK: - Extensions
extension String {
    
    var length: Int {
        return count
    }
    
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
}

// Leetcode challenges

/****************************************************************************/
// Valid Anagram
// https://leetcode.com/problems/valid-anagram/
/*
 Given two strings s and t , write a function to determine if t is an anagram of s.
 
 Example 1:
 
 Input: s = "anagram", t = "nagaram"
 Output: true
 Example 2:
 
 Input: s = "rat", t = "car"
 Output: false
 */

func isAnagram(_ s: String, _ t: String) -> Bool {
    if s.count == t.count {
        if s.sorted() == t.sorted() {
            return true
        }
    }
    
    return false
}

assert(isAnagram("anagram", "nagaram") == true, "isAnagram failed")
assert(isAnagram("rat", "car") == false, "isAnagram failed")

/****************************************************************************/
// Find All Anagrams in a String
// https://leetcode.com/problems/find-all-anagrams-in-a-string/
/*
 Given a string s and a non-empty string p, find all the start indices of p's anagrams in s.
 
 Strings consists of lowercase English letters only and the length of both strings s and p will not be larger than 20,100.
 
 The order of output does not matter.
 
 Example 1:
 
 Input:
 s: "cbaebabacd" p: "abc"
 
 Output:
 [0, 6]
 
 Explanation:
 The substring with start index = 0 is "cba", which is an anagram of "abc".
 The substring with start index = 6 is "bac", which is an anagram of "abc".
 Example 2:
 
 Input:
 s: "abab" p: "ab"
 
 Output:
 [0, 1, 2]
 
 Explanation:
 The substring with start index = 0 is "ab", which is an anagram of "ab".
 The substring with start index = 1 is "ba", which is an anagram of "ab".
 The substring with start index = 2 is "ab", which is an anagram of "ab".
 */

func findAnagrams(_ s: String, _ p: String) -> [Int] {
    var output = [Int]()
    
    for index in 0..<s.count {
        if index + p.count <= s.count {
            // Get each substring of the length of p.
            // For example, input s = cbaebabacd, p = abc we get the substrings cba, bae, aeb, eba, bab, aba, bac, acd
            
            let start = s.index(s.startIndex, offsetBy: index)
            let end = s.index(s.startIndex, offsetBy: index + p.count - 1)
            let range = start...end
            let substring = s[range]
            
            // Utilize our other function from  above to determine if input p is an anagram of the substring
            if isAnagram(String(substring), p) {
                output.append(index)
            }
        }
    }
    
    return output
}

assert(findAnagrams("cbaebabacd", "abc") == [0,6], "findAnagrams failed")
assert(findAnagrams("abab", "ab") == [0,1,2], "findAnagrams failed")

/****************************************************************************/
// Hamming Distance
// https://leetcode.com/problems/hamming-distance/
/*
 The Hamming distance between two integers is the number of positions at which the corresponding bits are different.
 
 Given two integers x and y, calculate the Hamming distance.
 
 Note:
 0 ≤ x, y < 2^(31).
 
 Example:
 
 Input: x = 1, y = 4
 
 Output: 2
 
 Explanation:
 1   (0 0 0 1)
 4   (0 1 0 0)
        ↑   ↑
 
 The above arrows point to positions where the corresponding bits are different.
 */

func hammingDistance(_ x: Int, _ y: Int) -> Int {
    
    guard x < y else { return  0 }
    
    
    var distance = 0
    
    // Get x and y in binary
    // For example 1 becomes 1 and 4 becomes 100
    var xBinary = String(x, radix: 2)
    let yBinary = String(y, radix: 2)
    
    // Add padding to make the strings the same length
    // For example 1 becomes 001 and 100 stays the same
    let differenceInLength = yBinary.count - xBinary.count
    let padding = String(repeatElement("0", count: differenceInLength))
    xBinary = padding + xBinary
    
    for index in 0...yBinary.count {
        if xBinary[index] != yBinary[index] {
            distance += 1
        }
    }
    
    return distance
}


// Another solution using bitwise operators
// http://vojtastavik.com/2017/03/02/swift-programming-interview-hamming-distance/
func calculateHammingDistance(x: Int, y: Int) -> Int {
    
    // Step 1: Find different bits using XOR operator
    let signedDifferentBits = x ^ y
    
    // We bitcast Int to UInt to allow the algorithm work correctly also for negative numbers.
    var differentBits: UInt = UInt(bitPattern: signedDifferentBits)
    
    // Step 2: Count them
    var counter = 0
    
    // Until there are some bits set to '1' in differentBits.
    while differentBits > 0 {
        
        // Mask differentBits with number 1 aka 00000001.
        // By doing this, we set all bits of differentBits
        // but the last one to zero.
        let maskedBits = differentBits & 1
        
        // If the last bit is not zero,
        if maskedBits != 0 {
            // increment the counter.
            counter += 1
        }
        
        // Shift bits in differentBits to the right.
        differentBits = differentBits >> 1
    }
    
    // We're done, return the number of 1s we've found.
    return counter
}

assert(hammingDistance(1, 4) == 2, "hammingDistance failed")
assert(hammingDistance(34, 2123) == 5, "hammingDistance failed")

/****************************************************************************/
