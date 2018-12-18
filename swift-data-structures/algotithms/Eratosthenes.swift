//
//  Erasthotenes.swift
//  swift-data-structures
//
//  Created by User on 2018-12-17.
//  Copyright © 2018 User. All rights reserved.
//

import Foundation


//

func primeNumbers(max: Int) -> [Int] {
    var dict : [Int : Bool] = [:]
    for num in 1...max{
        dict[num] = false
    }
    for num in 2...max{
        var i = num
        var found = false
        if dict[i]!{
            continue
        }
        while i+num <= max{
            i += num
            if !dict[i]!{
                dict[i] = true
                found = true
            }
        }
        if !found{
            print("Stopping at \(num)")
            break
        }
    }
    var result = [Int]()
    for num in 2...max{
        if !dict[num]!{
            result.append(num)
        }
    }
    return result
}

