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

  func testBST() throws {
    let bst = BSTree<Int>()
    bst.insert(newElement: 5)
    bst.insert(newElement: 3)
    bst.insert(newElement: 8)
    bst.insert(newElement: 4)
    bst.insert(newElement: 7)
    bst.insert(newElement: 6)
    bst.insert(newElement: 1)
    bst.insert(newElement: 0)
    bst.insert(newElement: 2)
    bst.insert(newElement: 10)
    bst.insert(newElement: 15)
    bst.insert(newElement: 18)
    bst.insert(newElement: 12)

    bst.printValues()
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

  func testSort() throws {
    var arr = [1,22,4,5,66,7]
    arr.sort()
    print(arr)
    let arr1 = [1,22,4,5,66,7,100,2]
    let newArray = arr1.sorted()
    print(newArray)

    let strArry = "fasacde"
    print(strArry.sorted())
  }

  func testFibonachi() throws {
    let sol = Solution()
    XCTAssert(0 == sol.calculateFib(0))
    XCTAssert(1 == sol.calculateFib(1))
    XCTAssert(1 == sol.calculateFib(2))
    XCTAssert(2 == sol.calculateFib(3))
    XCTAssert(3 == sol.calculateFib(4))
    XCTAssert(5 == sol.calculateFib(5))
    XCTAssert(8 == sol.calculateFib(6))
    XCTAssert(13 == sol.calculateFib(7))
    XCTAssert(21 == sol.calculateFib(8))
  }

  func testHouseRobber() {
    let sol = Solution()
    XCTAssert(sol.rob([1,2,3,1]) == 4)
    XCTAssert(sol.rob([2,7,9,3,1]) == 12)

  }

  func testStrings() {
    let x: UnicodeScalar = "🚽"
    let y: Character = "👨‍👩‍👧‍👧"
    //    "是"
    print(x)
    print(y)
    
    let greeting = "Hello! 👨‍👩‍👧‍👧"
    print("Length: \(greeting.count)")
    
    print("Unicode scalar value count: \(greeting.unicodeScalars.count)")
    // Prints "Unicode scalar value count: 15"
    
    print("UTF-8 representation count: \(greeting.utf8.count)")
    // Prints "UTF-8 representation count: 18"
    
    let usFlag: Character = "\u{1F1FA}\u{1F1F8}"
    print(usFlag)
    // Prints "🇺🇸"
  }
   
}
