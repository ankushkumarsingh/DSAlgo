//
//  Tree.swift
//  DSAlgo
//
//  Created by Ankush Singh on 30/08/20.
//  Copyright © 2020 Ankush Singh. All rights reserved.
//

import Foundation

protocol TreeProtocol {
  associatedtype T
  func insert(newElement: T)
  func search(element: T) -> Bool
  func delete(element: T)
}
fileprivate class Node<T> where T: Equatable {
  var value: T
  var left:Node<T>?
  var right:Node<T>?
  init(value: T) {
    self.value = value
  }
}

public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }

extension Node: Equatable {
  static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
    return lhs.value == rhs.value
  }

}
class BSTree<T> where T: Comparable {

  private var root: Node<T>?

  func printValues() {
    traverse(node: root)
  }
  func printInOrderValues() {
    inOrder(node: root)
  }
  func printPreOrderValues() {
    preOrder(node: root)
  }
  func printPostOrderValues() {
    postOrder(node: root)
  }
  //All three are DFS
  private func inOrder(node: Node<T>?) {
    guard let node = node else {return}
    inOrder(node: node.left)
    print(node.value)
    inOrder(node: node.right)
  }

  private func preOrder(node: Node<T>?) {
    guard let node = node else {return}
    print(node.value)
    preOrder(node: node.left)
    preOrder(node: node.right)
  }

  private func postOrder(node: Node<T>?) {
    guard let node = node else {return}
    postOrder(node: node.left)
    postOrder(node: node.right)
    print(node.value)
  }

  //BFS
  private func traverse(node: Node<T>?) {
    guard let node = node else {return}
    let queue = QueueLinkedList<Node<T>>()
    queue.enqueue(newElement: node )
    while queue.count != 0 {
      let temp = queue.dequeue()
      print(temp?.value)
      if let left = temp?.left{
        queue.enqueue(newElement: left)
      }
      if let right = temp?.right {
        queue.enqueue(newElement: right)
      }
    }
  }

  private func isLeafNode(node: Node<T>?) -> Bool {
    if node?.left == nil && node?.right == nil {
      return true
    }
    return false
  }

  private func isCompleteNode(node: Node<T>?) -> Bool {
    if node?.left != nil && node?.right != nil {
      return true
    }
    return false
  }

  private func hasOnlyLeft(node: Node<T>?) -> Bool {
    if node?.left != nil && node?.right == nil {
      return true
    }
    return false
  }

  private func hasOnlyRight(node: Node<T>?) -> Bool {
    if node?.right != nil && node?.left == nil {
      return true
    }
    return false
  }

  private func isValidBST(_ root: Node<T>?) -> Bool {
      guard let root = root else {return true}
      if let leftVal = root.left?.value {
          if leftVal < root.value {
              return isValidBST(root.left)
          }
      } else {
        return true
      }
      if let rightVal = root.right?.value {
          if rightVal > root.value {
              return isValidBST(root.right)
          }
      } else {
        return true
      }
      return false
  }
}

extension BSTree: TreeProtocol {
  func search(element: T)-> Bool {
    if root == nil {
      return false
    }
    var temp = root
    while temp != nil {
      if let value = temp?.value, element == value {
        return true
      } else if let value = temp?.value, element < value {
        temp = temp?.left
      } else {
        temp = temp?.right
      }
    }
    return false
  }



  func delete(element: T) {
    if root == nil {
      return
    }
    if let rootValue = root?.value, element == rootValue {
      root = nil
      return
    }

    var temp = root
    while temp != nil {
      if let left = temp?.left, left.value == element {

      }
    }

  }

  func insert(newElement: T) {
    let node = Node(value: newElement)
    if root == nil {
      root = node
      return
    }
    var temp = root
    while temp != nil {
      if let value = temp?.value, newElement <= value {
        if temp?.left == nil {
          temp?.left = node
          break
        }
        temp = temp?.left
      } else {
        if temp?.right == nil {
          temp?.right = node
          break
        }
        temp = temp?.right
      }
    }

  }
}
