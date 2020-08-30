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

protocol LinkedListProtocol {
  associatedtype T
  var isEmpty: Bool {get}
  func append(element: T)
  func prepend(element: T)
  func insert(newElement: T, at: Int)
  func remove(element: T)
  func reverse()
}
class LinkedList<T> where T: Equatable {

  private var head: Node<T>?
  private var tail: Node<T>?
  private var count: Int

  init(element: T) {
    let node = Node(value: element)
    head = node
    tail = node
    count = 1
  }

  init() {
    head = nil
    tail = nil
    count = 0
  }

  private func createFirstNode(node: Node<T>) {
    if isEmpty && tail == nil && head == nil {
      tail = node
      head = node
      count = 1
    }
  }

  private func traverseLinkedList(to : Int) -> Node<T>? {
    var temp = head
    for _ in 0..<(to-1) {
      temp = temp?.next
    }
    return temp
  }

  func printValues() {
    print("Head = ", head!.value)
    print("Tail = ", tail!.value)
    var temp = head
    while temp != nil {
      print(temp!.value, terminator: " -> ")
      temp = temp?.next
    }
  }

//  private func tra
}

extension LinkedList : LinkedListProtocol {
  var isEmpty: Bool {
    if count == 0 {
      return true
    }
    return false
  }

  func append(element: T) {
    let node = Node(value: element)
    if isEmpty {
      createFirstNode(node: node)
      return
    }
    tail?.next = node
    tail = node
    count += 1
  }

  func prepend(element: T) {
    let node = Node(value: element)
    if isEmpty {
      createFirstNode(node: node)
      return
    }
    node.next = head
    head = node
    count += 1
  }
  
  func insert(newElement: T, at: Int) {
    let node = Node(value: newElement)
    if at == 0 {
      createFirstNode(node: node)
      return
    }
    let previous = traverseLinkedList(to: at)
    if previous == nil {
      append(element: newElement)
      return
    }
    node.next = previous?.next
    previous?.next = node
  }

  func remove(element: T) {

    if let value = head?.value, value == element {
      head = head?.next
      count = 0
      return
    }
    var temp = head
    var previous = head
    while temp?.next != nil {
      if let value = temp?.next?.value, value == element {
        previous?.next = temp?.next?.next
        break
      }
      previous = temp
      temp = temp?.next
    }
    count -= 1
  }

  func reverse() {
    //1 -> 2 -> 3 -> 4 -> 5
    var first = head //1
    var second = first?.next //2

    if first == nil || second == nil {
      return
    }

    while second != nil {
      let temp = second?.next //3
      second?.next = first // 2 -> 1
      first = second
      second = temp
    }
    head?.next = nil
    tail = head
    head = first
  }
}
