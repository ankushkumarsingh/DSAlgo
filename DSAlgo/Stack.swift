//
//  Stack.swift
//  DSAlgo
//
//  Created by Ankush Singh on 30/08/20.
//  Copyright © 2020 Ankush Singh. All rights reserved.
//

import Foundation
protocol Stack {
  associatedtype T
  mutating func push(newElement: T)
  mutating func pop() -> T?
  mutating func peek() -> T?
}

struct StackArray<T> where T: Equatable {
  var array: [T] = []
  
}

extension StackArray: Stack {
  mutating func push(newElement: T) {
    array.append(newElement)
  }

  mutating func pop() -> T? {
    if array.isEmpty {
      return nil
    }
    return array.removeLast()
  }

  func peek() -> T? {
    array.last
  }

}

class StackLinkedList<T> where T: Equatable {
  var top: Node<T>?
  var bottom: Node<T>?
  var count: Int

  init() {
    top = nil
    bottom = nil
    count = 0
  }

}

extension StackLinkedList: Stack {

  func push(newElement: T) {
    let node = Node(value: newElement)
    top?.next = node
    top = node
    count += 1
  }

  func pop() -> T? {
    let node = top
    count -= 1
    return top?.value
  }

  func peek() -> T? {
    top?.value
  }


}
