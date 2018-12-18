//
//  utils.swift
//  swift-data-structures
//
//  Created by Francisco on 2018-12-12.
//  Copyright © 2018 User. All rights reserved.
//
import Foundation

// Fill with `count` random numbers
func fill(list: CLinkedList<Int>, count: Int){
    for _ in 0...count {
        let number = Int.random(in: 1 ..< 100)
        list.append(number)
    }
}

// Fill with `count` sorted random numbers
func fillSorted(list: CLinkedList<Int>, count: Int){
    var number = 1
    for _ in 0...count {
        number = Int.random(in: number ..< number + 20 )
        list.append(number)
    }
}

// Merge 2 sorted lists
func mergeSorted(_ list1:CLinkedList<Int>, with list2: CLinkedList<Int>) -> CLinkedList<Int>{
    let result = CLinkedList<Int>()
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

func removeWithValue(list: CLinkedList<Int>, value: Int){
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


