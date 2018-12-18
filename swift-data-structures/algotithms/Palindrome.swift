//
//  Palindrome.swift
//  swift-data-structures
//
//  Created by User on 2018-12-13.
//  Copyright © 2018 User. All rights reserved.
//

import Foundation


func isPalindrome(_ text:String) -> Bool{
    let len = text.lengthOfBytes(using: .utf8)
    for idx in 0..<len/2 {
        let index1 = text.index (text.startIndex, offsetBy: idx)
        let index2 = text.index (text.startIndex, offsetBy: len-idx-1)
        if(text[index1] != text[index2]){
            return false
        }
    }
    return true
}



