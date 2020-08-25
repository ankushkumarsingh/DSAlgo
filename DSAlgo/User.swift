//
//  User.swift
//  DSAlgo
//
//  Created by Ankush Singh on 21/08/20.
//  Copyright © 2020 Ankush Singh. All rights reserved.
//

import Foundation
struct User {
  var name: String
  var gender: String
  var score = 0
  var items = [String]()
}

extension User {
  mutating func updateScore(newScore: Int) {
    self.score = newScore
  }
}

extension User: Codable, Equatable {}


