//
//  Trie.swift
//  DSAlgo
//
//  Created by Ankush Singh on 30/08/20.
//  Copyright © 2020 Ankush Singh. All rights reserved.
//

import Foundation
fileprivate class Node<T> where T: Comparable {
  var value: T
  var isTerminating: Bool
  var nodes: [Node<T>]?

  init(value: T, isTerminating: Bool = false) {
    self.value = value
    self.isTerminating = isTerminating
  }

//  typealias closure = ((_ response: [String: Any]) -> Void)

}
class Trie<T> where T: Comparable {
  private var root: Node<T>?

//  func insert
}
