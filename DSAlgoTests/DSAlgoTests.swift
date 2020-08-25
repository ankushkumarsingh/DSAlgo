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
    let n1 = Node(value: 3, next: Node(value: 3, next: Node(value: 2, next: Node(value: 1))))
    let n2 = n1.next
    let n3 = n2?.next
    print(n1.value)
    print(n2?.value)
    print(n3?.value)
    XCTAssert(n1 == n2)
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
