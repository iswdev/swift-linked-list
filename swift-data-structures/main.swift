//
//  main.swift
//  swift-data-structures
//
//  Created by User on 2018-12-04.
//  Copyright © 2018 User. All rights reserved.
//
import Foundation

var listCount = 10

var listA = CLinkedList<Int>()
fill(list: listA, count: listCount)

// Normal list print
print("print List A: ", listA)


// 1.- Reversed list
listA.printReverse()


// 2.- Middle node
var middle = listA.middleNode()
print("Middle node in List A: \(middle!.value)")


// 3.- Reversed
listA.reverseList()
print("List A Reversed:" , listA)


// 4.- Merge sorted
let listB = CLinkedList<Int>()
fillSorted(list: listA, count: listCount)
let listC = CLinkedList<Int>()
fillSorted(list: listB, count: listCount)
print("List B",listB)
print("List C",listC)

let listD = mergeSorted(listA, with: listB)
print("List D (Merged B-C):", listD)

// 5.- Remove value
removeWithValue(list: listA, value: middle!.value)
print("Remove \(middle!.value) from List A:", listA)




// Stack

let stack = Stack<Int>()
stack.push(123)
stack.push(345)
stack.push(856)
print("Stack:\n\(stack)")

let popped = stack.pop()!
print("Popped value: \(popped)")
print("New Stack:\n\(stack)")


// Check parenthesis
let check1 = "h((e))llo(world)()"
if (checkParenthesis(text: check1)){
    print("\(check1) OK")
}else{
    print("\(check1) ERROR")
}

let check2 = "(hello world"
if (checkParenthesis(text: check2)){
    print("\(check2) OK")
}else{
    print("\(check2) ERROR")
}


let check3 = "(he(ll(o) world)"
if (checkParenthesis(text: check3)){
    print("\(check3) OK")
}else{
    print("\(check3) ERROR")
}

let check4 = "(h(e(l(l(o( )w)o)r)l)d)"
if (checkParenthesis(text: check4)){
    print("\(check4) OK")
}else{
    print("\(check4) ERROR")
}



// TREE Excercises

var root = TreeNode<Int>(value:15)
root.add(1).add([1,5,0])
root.add(17).add(2)
root.add(20).add([5,7])

print(root.descriptionByLevels)



// Palindrome
let words=[
    "EteraretE",
    "EterretE",
    "EterretEX",
    "E5terretE"
]
for word in words{
    if (isPalindrome(word)){
        print("\(word) is Palindrome")
    }else{
        print("\(word) is not Palindrome")
    }
}

let numbers=primeNumbers(max:120)
print("Prime numbers until :\(numbers)")

