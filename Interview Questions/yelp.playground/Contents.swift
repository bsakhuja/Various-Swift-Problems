import Foundation

struct Bookmark {
    let businessName: String
}

let sampleBookmarks = [
    Bookmark(businessName: "Burger King"),
    Bookmark(businessName: "McDonald's"),
    Bookmark(businessName: "Bob’s Burgers"),
    Bookmark(businessName: "Five Guys"),
    Bookmark(businessName: "Super Duper Burgers"),
    Bookmark(businessName: "Wahlburgers")
]

/* Part 1:
 * Given a list of bookmark objects and a search term, return bookmarks
 * where the search term is a prefix of one of the words in the business
 * name. Return the first 4 business names that match  the search term.
 * For example searching for ‘bur’ in these bookmark objects should
 * suggest “Burger King”, “Bob's Burgers”, and “Super Duper Burgers”.
 */

func findMatches(forPrefix prefix: String, `in` bookmarks: [Bookmark]) -> [Bookmark] {
    var bookmarksToReturn = [Bookmark]()
    
    for bookmark in bookmarks {
        let businessNameWords = bookmark.businessName.components(separatedBy: " ")
        var match = false
        for businessNameComponent in businessNameWords {
            if businessNameComponent.lowercased().hasPrefix(prefix.lowercased()) {
                match = true
                
            }
            
            
        }
        
        if match {
            bookmarksToReturn.append(bookmark)
        }
        
        
        
        
        if bookmarksToReturn.count >= 4 {
            break
        }
        
    }
    
    return bookmarksToReturn
}

// print(findMatches(forPrefix: "BUR", in: sampleBookmarks))



/* Part 2:
 * Now we want to also include matches where the search term exists
 * anywhere in the business name. We want to give word prefix matches
 * higher priority than non-prefix matches. Given the search term ‘bur’
 * here is the expected order:
 * 1. Bob’s Burgers - prefix match, sorted alphabetically
 * 2. Burger King - prefix match, sorted alphabetically
 * 3. Super Duper Burgers - prefix match, sorted alphabetically
 * 4. Wahlburgers - non-prefix match
 */

func findMatches(forTerm term: String, `in` bookmarks: [Bookmark]) -> [Bookmark] {
    
    var bookmarksToReturn = [Bookmark]()
    var prefixMatches = [Bookmark]()
    var nonPrefixMatches = [Bookmark]()
    
    for bookmark in bookmarks {
        let businessNameWords = bookmark.businessName.components(separatedBy: " ")
        var prefixMatch = false
        var nonPrefixMatch = false
        for businessNameComponent in businessNameWords {
            
            // check for a prefix match
            if businessNameComponent.lowercased().hasPrefix(term.lowercased()) {
                prefixMatch = true
                
            } else if businessNameComponent.lowercased().contains(term.lowercased()) {
                nonPrefixMatch = true
                
            }
            
            
        }
        
        if prefixMatch {
            prefixMatches.append(bookmark)
        } else if nonPrefixMatch {
            nonPrefixMatches.append(bookmark)
        }
        
        
        
        
        if bookmarksToReturn.count >= 4 {
            break
        }
        
    }
    
    let prefixMatchesSorted = prefixMatches.sorted { $0.businessName < $1.businessName }
    
    bookmarksToReturn = prefixMatchesSorted + nonPrefixMatches
    
    return bookmarksToReturn
}

print(findMatches(forTerm: "bur", in: sampleBookmarks))


