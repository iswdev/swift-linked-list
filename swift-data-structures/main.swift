//
//  main.swift
//  swift-data-structures
//
//  Created by User on 2018-12-04.
//  Copyright © 2018 User. All rights reserved.
//

import Foundation

// Fill with `count` random numbers
func fill(list: LinkedList<Int>, count: Int){
    for _ in 0...count {
        let number = Int.random(in: 1 ..< 100)
        list.append(number)
    }
}

// Fill with `count` sorted random numbers
func fillSorted(list: LinkedList<Int>, count: Int){
    var number = 1
    for _ in 0...count {
        number = Int.random(in: number ..< number + 20 )
        list.append(number)
    }
}

// Merge 2 sorted lists 
func mergeSorted(_ list1:LinkedList<Int>, with list2: LinkedList<Int>) -> LinkedList<Int>{
    let result = LinkedList<Int>()
    var pointer1 = list1.root
    var pointer2 = list2.root
    while(true){
        if let value1 = pointer1 {
            if let value2 = pointer2 {
                let val1 = value1.value
                let val2 = value2.value
                if val1 <= val2 {
                    result.append(value1.value)
                    pointer1 = pointer1?.next
                }else{
                    result.append(value2.value)
                    pointer2 = pointer2?.next
                }
            }else{
                result.append(value1.value)
                pointer1 = pointer1?.next
            }
        }else if let value2 = pointer2 {
            result.append(value2.value)
            pointer2 = pointer2?.next
        }else{
            break
        }
    }
    return result
}

func removeWithValue(list: LinkedList<Int>, value: Int){
    var currentNode = list.root
    while let node = currentNode {
        currentNode = currentNode?.next
        if node.value == value {
            list.remove(node: node)
        }
    }
}


func checkParenthesis(text: String) -> Bool{
    let stack = Stack<Character>()
    for char in text {
        if char == "(" {
            stack.push(char)
        }
        if char == ")" {
            if let _ = stack.pop(){
                
            }else{
                return false
            }
        }
    }
    if let _ = stack.pop(){
        // elements left
        return false
    }else{
        // empty stack
        return true
    }
}




var listCount = 10

var listA = LinkedList<Int>()
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
let listB = LinkedList<Int>()
fillSorted(list: listA, count: listCount)
let listC = LinkedList<Int>()
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



