import UIKit

var greeting = "Hello, playground"
let index = greeting.index(of: ",") ?? greeting.endIndex
print(index)
let beginning = greeting[..<index]
print(beginning)

let newString = String(beginning)
print(newString)

//let endIndex = greeting[greeting.endIndex]
//print(endIndex)

let endLetter = greeting[greeting.index(before: greeting.endIndex)]
print(endLetter)

let letter = greeting[greeting.index(before: greeting.endIndex]]
print(letter)
