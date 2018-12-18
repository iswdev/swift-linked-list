//
//  STreeNode.swift
//  swift-data-structures
//
//  Created by User on 2018-12-12.
//  Copyright © 2018 User. All rights reserved.
//

import Foundation

class TreeNode<Value> {
    
    var value : Value
    var children = [TreeNode<Value>]()
    
    init(value:Value) {
        self.value = value
    }
    
    @discardableResult
    func add(_ value: Value) -> TreeNode{
        let node = TreeNode(value: value)
        children.append(node)
        return node
    }
    
    func add(_ values: [Value]){
        for value in values {
            add(value)
        }
    }
    
    func getLevel(level: Int) -> [Value]{
        if level == 0 {
            return [value]
        }
        else if level == 1 {
            var items = [Value]()
            for item in children{
                items.append(item.value)
            }
            return items
        }
        else{
            var items = [Value]()
            for item in children{
                let subitems = item.getLevel(level: level-1)
                for subitem in subitems{
                    items.append(subitem)
                }
            }
            return items
        }
    }
    
    var descriptionByLevels: String {
        var content="\(value)"
        var level=0
        var items=self.getLevel(level: level)
        while items.count>0{
            let arr = NSArray(array: items)
            content += "\n" + arr.componentsJoined(by: ", ")
            level += 1
            items = self.getLevel(level: level)
        }
        return content
    }
    
}

extension TreeNode : CustomStringConvertible {
    var description: String {
        var content=""
        if children.count>0 {
            content += "( "
        }
        content += " \(value) "
        if children.count>0 {
            content += " [ "
        }
        for item in children{
            content += item.description
        }
        if children.count>0 {
            content += "] )"
        }
        return content
    }
    
}
