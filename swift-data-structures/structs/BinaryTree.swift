//
//  SBinaryTreeNode.swift
//  swift-data-structures
//
//  Created by User on 2018-12-12.
//  Copyright © 2018 User. All rights reserved.
//

import Cocoa

enum BinaryTree<Value> {
    case empty
    indirect case node(BinaryTree, Value, BinaryTree)
}


