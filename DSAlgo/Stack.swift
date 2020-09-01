//
//  Stack.swift
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
  private var top: Node<T>?
  private var bottom: Node<T>?
  var count: Int

  init() {
    top = nil
    bottom = nil
    count = 0
  }

  private func traverseLinkedList(to : Int) -> Node<T>? {
    var temp = bottom
    for _ in 0..<(to-1) {
      temp = temp?.next
    }
    return temp
  }

}

extension StackLinkedList: Stack {

  func push(newElement: T) {
    let node = Node(value: newElement)
    if count == 0 {
      top = node
      bottom = node
      count = 1
      return
    }
    node.next = top
    top = node
    count += 1
  }


  func pop() -> T? {
    let poppedElement = top
    top = top?.next
    count -= 1
    return poppedElement?.value
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
