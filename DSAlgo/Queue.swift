//
//  Queue.swift
//  DSAlgo
//
//  Created by Ankush Singh on 30/08/20.
//  Copyright © 2020 Ankush Singh. All rights reserved.
//

import Foundation
protocol Queue {
  associatedtype T
  func enqueue(newElement: T)
  func dequeue() -> T?
  func peek() -> T?
}

class QueueLinkedList<T> where T: Equatable {
  var top: Node<T>?
  var bottom: Node<T>?
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
  }

  func dequeue() -> T? {
    let dequeuedElement = top
    top = top?.next
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
