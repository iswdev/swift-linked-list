//
//  main.swift
//  swift-data-structures
//
//  Created by User on 2018-12-04.
//  Copyright © 2018 User. All rights reserved.
//

import Foundation

var listCount = 20

var list = LinkedList()
list.fill(count: listCount)

// Normal list print
print("print list: ", list)



// 1.- Reversed list
list.printReverse()



// 2.- Middle node

var middle = list.middleNode()
print("Middle node: \(middle!.value)")


// 3.- Reversed
list.reverseList()
print("Reversed:" , list)


// 4.- Merge sorted
let listA = LinkedList()
listA.fillSorted(count: listCount)
let listB = LinkedList()
listB.fillSorted(count: listCount)
print("List A",listA)
print("List B",listB)
let listC = listA.mergeSortedWith(list: listB)
print("Merged A-B:", listC)



