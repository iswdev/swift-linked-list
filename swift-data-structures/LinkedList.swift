//
//  LinkedList.swift
//  swift-data-structures
//
//  Created by User on 2018-12-04.
//  Copyright © 2018 User. All rights reserved.
//

import Foundation

class LinkedNode {
    var value : Int
    var next : LinkedNode?
    var prev : LinkedNode?
    
    init(value: Int) {
        self.value = value
    }
}

class LinkedList {
    var root: LinkedNode?
    var tail: LinkedNode?
    
    func append(_ value: Int){
        let node = LinkedNode(value: value)
        if let lastNode = tail {
            node.prev = lastNode
            lastNode.next = node
        } else{
            root = node
        }
        tail = node
    }
    
    func fill(count: Int){
        for _ in 0...count {
            let number = Int.random(in: 1 ..< 100)
            append(number)
        }
    }
    
    func fillSorted(count: Int){
        var number = 1
        for _ in 0...count {
            number = Int.random(in: number ..< number + 20 )
            append(number)
        }
    }
    
    func middleNode() -> LinkedNode? {
        if let start = root {
            var pointer1 = start
            var pointer2 = start
            while let nextNode1 = pointer1.next  {
                pointer1 = nextNode1
                if let nextNode1 = pointer1.next{
                    pointer1 = nextNode1
                }
                if let nextNode2 = pointer2.next{
                    pointer2 = nextNode2
                }
            }
            return pointer2
        }else{
            return nil
        }
    }
    
    func printReverse(){
        var node = tail
        let start = "Print reverse [ "
        var list = [Int]()
        while let currentNode = node {
            list.append(currentNode.value)
            node = currentNode.prev
        }
        let end = " ]"
        let elements = list.map { "\($0)" }.joined(separator: " <- ")
        print( start + elements + end)
    }
    
    
    func reverseList(){
        if let rootNode = root {
            var currentNode = rootNode
            while let nextNode = currentNode.next {
                //swap pointers
                currentNode.next = currentNode.prev
                currentNode.prev = nextNode
                currentNode = nextNode
            }
            currentNode.next = currentNode.prev
            currentNode.prev = nil
            tail = root
            root = currentNode
        }
        
    }
    
    func mergeSortedWith(list: LinkedList) -> LinkedList{
        let result = LinkedList()
        var pointer1 = self.root
        var pointer2 = list.root
        while(true){
            if let value1 = pointer1 {
             if let value2 = pointer2 {
                if value1.value <= value2.value {
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
    
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        var node = root
        let header = ("[ ")
        var list = [Int]()
        while let currentNode = node {
            list.append(currentNode.value)
            node = currentNode.next
        }
        let footer = ("]")
        let elements = list.map { "\($0)" }.joined(separator: " -> ")
        return header + elements + footer
    }
    
}

