//
//  LinkedList.swift
//  swift-data-structures
//
//  Created by User on 2018-12-04.
//  Copyright © 2018 User. All rights reserved.
//

import Foundation

class LinkedNode<Value> {
    var value : Value
    var next : LinkedNode?
    var prev : LinkedNode?
    
    init(value: Value) {
        self.value = value
    }
}

class LinkedList<Value> {
    var root: LinkedNode<Value>?
    var tail: LinkedNode<Value>?
    
    func append(_ value: Value){
        let node = LinkedNode(value: value)
        if let lastNode = tail {
            node.prev = lastNode
            lastNode.next = node
        } else{
            root = node
        }
        tail = node
    }
    
    func middleNode() -> LinkedNode<Value>? {
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
        var list = [Value]()
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
    
    func remove( node : LinkedNode<Value>){
        let prev = node.prev
        let next = node.next
        if let prev = prev{
            prev.next = next
        }else{
            root = next
        }
        next?.prev = prev
        
        if next == nil {
            tail = prev
        }
        
        node.prev = nil
        node.next = nil
    }
    
    
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        var node = root
        let header = ("[ ")
        var list = [Value]()
        while let currentNode = node {
            list.append(currentNode.value)
            node = currentNode.next
        }
        let footer = ("]")
        let elements = list.map { "\($0)" }.joined(separator: " -> ")
        return header + elements + footer
    }
    
}
