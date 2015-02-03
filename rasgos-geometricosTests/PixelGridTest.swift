//
//  PixelGridTest.swift
//  rasgos-geometricos
//
//  Created by Luis Flores on 1/28/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import UIKit
import XCTest

class PixelGridTest: XCTestCase {
 
    func testNumberOfPixels() {
        var grid: [[Int]] = [
            [1, 0, 0, 0, 1],
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
            [1, 0, 0, 0, 1]
        ]
        
        var pixelGrid = PixelGrid(grid:grid)
        XCTAssert(pixelGrid.numberOfPixels() == 4, "4 pixels")
        
        grid = [
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0]
        ]
        
        pixelGrid = PixelGrid(grid:grid)
        XCTAssert(pixelGrid.numberOfPixels() == 0, "0 pixels")
        
        grid = [
            [1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1]
        ]
        
        pixelGrid = PixelGrid(grid:grid)
        XCTAssert(pixelGrid.numberOfPixels() == 5*4, "20 pixels")
        
        grid = [
            [1, 1, 0, 1, 1],
            [1, 1, 0, 1, 1],
            [1, 1, 0, 1, 1],
            [1, 1, 0, 1, 1]
        ]
        
        pixelGrid = PixelGrid(grid:grid)
        XCTAssert(pixelGrid.numberOfPixels() == 16, "16 pixels")
    }
}
