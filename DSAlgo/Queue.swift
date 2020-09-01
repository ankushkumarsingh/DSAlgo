//
//  Queue.swift
//  DSAlgo
//
//  Created by Ankush Singh on 30/08/20.
//  Copyright © 2020 Ankush Singh. All rights reserved.
//

import Foundation

fileprivate class Node<T> where T: Equatable {
  var next: Node?
  var value:T
  init(value: T, next: Node? = nil) {
    self.next = next
    self.value = value
  }
}

extension Node: Equatable {
  static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
    return lhs.value == rhs.value
  }

}
protocol Queue {
  associatedtype T
  func enqueue(newElement: T)
  func dequeue() -> T?
  func peek() -> T?
}

class QueueLinkedList<T> where T: Equatable {
  private var top: Node<T>?
  private var bottom: Node<T>?
  var count:Int
  init() {
    top = nil
    bottom = nil
    count = 0
  }
}

extension QueueLinkedList: Queue {
  func enqueue(newElement: T) {
    let node = Node(value: newElement)
    if count == 0 {
      top = node
      bottom = node
      count = 1
      return
    }
    bottom?.next = node
    bottom = node
    count += 1
  }

  func dequeue() -> T? {
    let dequeuedElement = top
    top = top?.next
    count -= 1
    return dequeuedElement?.value
  }

  func peek() -> T? {
    top?.value
  }

  func printValues() {
    var temp = top
    while temp != nil {
      print(temp!.value, terminator: " -> ")
      temp = temp?.next
    }
    print("\n")
  }

}
