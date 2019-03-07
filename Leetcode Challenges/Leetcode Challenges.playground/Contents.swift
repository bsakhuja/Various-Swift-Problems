import UIKit

// Leetcode challenges

/*****************************************************/
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

/*****************************************************/
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
    
}
