//
//  DSAlgoTests.swift
//  DSAlgoTests
//
//  Created by Ankush Singh on 21/08/20.
//  Copyright © 2020 Ankush Singh. All rights reserved.
//

import XCTest
@testable import DSAlgo

class DSAlgoTests: XCTestCase {

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testUser() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    let user = User(name: "Ankush", gender: "M")
    let encoder = JSONEncoder()
    let encodedValue = try encoder.encode(user)
    print(encodedValue)
    let decoder = JSONDecoder()
    let decodedValue = try decoder.decode(User.self, from: encodedValue)
    print(decodedValue)
    XCTAssert(user == decodedValue)
  }

  func testLinkedList() throws {
    let linkedList = LinkedList<Int>()
    linkedList.append(element: 2)
    linkedList.prepend(element: 0)
    linkedList.insert(newElement: 1, at : 1)
    linkedList.append(element: 3)
    linkedList.append(element: 5)
    linkedList.append(element: 6)
    linkedList.insert(newElement: 4, at: 4)
    linkedList.printValues()

    linkedList.reverse()
    linkedList.printValues()
  }

  func testStack() throws {
    let stack = StackLinkedList<Int>()
     stack.push(newElement: 1)
     stack.push(newElement: 3)
     stack.push(newElement: 5)
     stack.push(newElement: 6)
     stack.printValues()
    print(stack.pop())
    stack.printValues()

   }


  func testQueue() throws {
    let queue = QueueLinkedList<Int>()
    queue.enqueue(newElement: 1)
    queue.enqueue(newElement: 2)
    queue.enqueue(newElement: 3)
    queue.printValues()
    print(queue.dequeue())
    queue.printValues()
  }

  func testStringIfUnique() {
    let str: String = "abcdefgzqs"
    var checker: Int32 = 0
    for (index,char) in str.enumerated() {
      print(index,char)
      let diff = char.asciiValue! - Character("a").asciiValue!
      let newBit: Int32 = 1 << diff
      XCTAssertFalse(checker & newBit == 1)
      checker = checker | newBit
      print(checker)
    }
  }
}
