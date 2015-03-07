//
//  PixelGridTest.swift
//  rasgos-geometricos
//
//  Created by Luis Flores on 1/28/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import UIKit
import XCTest

class BinaryObjectTest: XCTestCase {
 
    func testNumberOfPixels() {
        var grid: [[Int]] = [
            [1, 0, 0, 0, 1],
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
            [1, 0, 0, 0, 1]
        ]
        
        var binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.numberOfActivePixels() == 4, "4 pixels")
        
        grid = [
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.numberOfActivePixels() == 0, "0 pixels")
        
        grid = [
            [1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.numberOfActivePixels() == 5*4, "20 pixels")
        
        grid = [
            [1, 1, 0, 1, 1],
            [1, 1, 0, 1, 1],
            [1, 1, 0, 1, 1],
            [1, 1, 0, 1, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.numberOfActivePixels() == 16, "16 pixels")
    }
    
    func testCenterOfMass() {
        var grid: [[Int]] = [
            [1, 1, 1],
            [1, 1, 1],
            [1, 1, 1]
        ]
        
        var binaryObject = BinaryObject(grid:grid)
        var centerOfMass = binaryObject.centerOfMass
        XCTAssert(centerOfMass == Coordinate(x: 1, y: 1), "Center of mass: \(centerOfMass)")
        
        grid = [
            [1, 1, 1, 0],
            [1, 1, 1, 0],
            [1, 1, 1, 0],
            [0, 0, 0, 1],
        ]
        
        binaryObject = BinaryObject(grid:grid)
        centerOfMass = binaryObject.centerOfMass
        XCTAssert(centerOfMass == Coordinate(x: 1, y: 1), "Center of mass: \(centerOfMass)")
        
        grid = [
            [1, 1, 1, 0],
            [1, 1, 1, 0],
            [1, 1, 1, 0],
            [0, 0, 1, 0],
        ]
        
        binaryObject = BinaryObject(grid:grid)
        centerOfMass = binaryObject.centerOfMass
        XCTAssert(centerOfMass == Coordinate(x: 1, y: 1), "Center of mass: \(centerOfMass)")
    }
}
