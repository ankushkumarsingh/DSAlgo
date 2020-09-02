//
//  Solution.swift
//  DSAlgo
//
//  Created by Ankush Singh on 01/09/20.
//  Copyright © 2020 Ankush Singh. All rights reserved.
//

import Foundation
class Solution {

  func isValidBST(_ root: TreeNode?) -> Bool {
    guard let root = root else {return true}
    if let leftVal = root.left?.val, let rightVal = root.right?.val  {
        if leftVal < root.val && rightVal > root.val{
            return isValidBST(root.left) && isValidBST(root.right)
        }
    } else if let leftVal = root.left?.val {
      if leftVal < root.val {
            return isValidBST(root.left)
        }
    } else if let rightVal = root.right?.val {
        if rightVal > root.val {
            return isValidBST(root.right)
        }
    } else {
      return true
    }
    return false
  }

  
  func rob(_ nums: [Int]) -> Int {
    var cache = Array(repeating: -1, count: nums.count)
    if nums.isEmpty {
      return 0
    }

    func getMax(to index : Int) -> Int {
      if index == 0 {
        cache[index] = nums[index]
        return cache[index]
      } else if index == 1 {
        let maxValue = max(nums[index], nums[index - 1])
        cache[index] = maxValue
        return cache[index]
      } else {

        if cache[index] >= 0 {
          return cache[index]
        } else {
          let maxValue = max(getMax(to: index - 2) + nums[index], getMax(to: index - 1))
          //rob[i] = max(rob[i-2] + rob[i], rob[i-1])
          cache[index] = maxValue
          return cache[index]
        }
      }
    }
    return getMax(to: nums.count - 1)
  }

  func calculateFib(_ n: Int) -> Int {
    var cache = [Int: Int]()

    func fib(_ x: Int) -> Int {
      if let val = cache[x] {
        return val
      } else {
        if x < 2 {
          cache[x] = x
          return x
        } else {
           let val = fib(x-1) + fib(x-2)
          cache[x] = val
          return val
        }
      }
    }
    return fib(n)
  }

  func mergeSort(_ nums:[Int]) -> [Int] {
    if nums.count <= 1 {
      return nums
    }
    let start = 0
    let end = nums.count - 1
    let middle = (start + end)/2
//    let h

    return []
  }
}
