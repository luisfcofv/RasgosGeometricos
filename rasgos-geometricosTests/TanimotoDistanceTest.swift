//
//  TanimotoDistanceTest.swift
//  rasgos-geometricos
//
//  Created by Luis Flores on 3/7/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import UIKit
import XCTest

class TanimotoDistanceTest: XCTestCase {
    
    func testTanimotoDistance() {
        var gridA: [[Int]] = [
            [1, 1, 1, 0],
            [1, 1, 1, 0],
            [1, 1, 1, 0],
            [0, 0, 0, 1]
        ]
        
        var gridB: [[Int]] = [
            [1, 1, 1, 0],
            [1, 1, 1, 0],
            [1, 1, 1, 0],
            [0, 0, 1, 0]
        ]
        
        var binaryObjectA = BinaryObject(grid:gridA)
        var binaryObjectB = BinaryObject(grid:gridB)
        
        var distance = TanimotoDistance.tanimotoDistance(binaryObjectA, objectB: binaryObjectB)
        XCTAssertEqualWithAccuracy(distance, 0.18, 0.01, "Difference: \(distance - 0.18)")
    }
}
