//
//  LinkedList.swift
//  DSAlgo
//
//  Created by Ankush Singh on 21/08/20.
//  Copyright © 2020 Ankush Singh. All rights reserved.
//

import Foundation
class Node<T> {
  var next: Node?
  var value:T
  init(value: T, next: Node? = nil) {
    self.next = next
    self.value = value
  }
}

extension Node: Equatable where T: Equatable {
  static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
    lhs.value == rhs.value
  }
}

class LinkedList<T> {
  var head: Node<T>?

  func insert(val: T) {
    let node = Node(value: val)
    var temp = head
    while temp?.next != nil {
      temp = temp?.next
    }
    temp?.next = node
  }
}
