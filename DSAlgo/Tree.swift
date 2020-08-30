//
//  Tree.swift
//  DSAlgo
//
//  Created by Ankush Singh on 30/08/20.
//  Copyright © 2020 Ankush Singh. All rights reserved.
//

import Foundation
class BSTree<T> where T: Comparable {

  private class Node<T> {
    var value: T
    var left:Node<T>?
    var right:Node<T>?
    init(value: T) {
      self.value = value
    }
  }

  private var root: Node<T>?

  func insert(newElement: T) {
    let node = Node(value: newElement)
    if root == nil {
      root = node
      return
    }
    var temp = root
    while temp != nil {
      if let value = temp?.value, value <= newElement {
        temp = temp?.left
      } else {
        temp = temp?.right
      }
    }

  }

  //All three are DFS
  private func inOrder(node: Node<T>?) {
    if node == nil {
      return
    }
    inOrder(node: node?.left)
    print(node?.value)
    inOrder(node: node?.right)
  }

  private func preOrder(node: Node<T>?) {
    if node == nil {
      return
    }
    print(node?.value)
    preOrder(node: node?.left)
    preOrder(node: node?.right)
  }

  private func postOrder(node: Node<T>?) {
    if node == nil {
      return
    }
    postOrder(node: node?.left)
    postOrder(node: node?.right)
    print(node?.value)
  }
}
