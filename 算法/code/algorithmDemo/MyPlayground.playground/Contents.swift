import Cocoa

let myArray = ["bd","bc","abc","abd","aba","abe","ac","a","b","c","cb","ca"]

let ans = myArray.sorted { s1, s2 in
    return s1.localizedStandardCompare(s2) == .orderedAscending
}

print(ans)
