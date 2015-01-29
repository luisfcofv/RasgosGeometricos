//
//  FloodFillTest.swift
//  rasgos-geometricos
//
//  Created by Luis Flores on 1/28/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import UIKit
import XCTest

class FloodFillTest: XCTestCase {

    func testFloodFill() {
        var grid: [[Int]] = [
            [1, 0, 0, 0, 1],
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
            [1, 0, 0, 0, 1]
        ]
        
        var floodFill = FloodFill(grid: grid)
        XCTAssert(floodFill.numberOfComponents() == 4, "4 componentes")
        
        grid = [
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0]
        ]
        
        floodFill = FloodFill(grid: grid)
        XCTAssert(floodFill.numberOfComponents() == 0, "0 componentes")
        
        grid = [
            [1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1]
        ]
        
        floodFill = FloodFill(grid: grid)
        XCTAssert(floodFill.numberOfComponents() == 1, "1 componentes")
        
        grid = [
            [1, 1, 0, 1, 1],
            [1, 1, 0, 1, 1],
            [1, 1, 0, 1, 1],
            [1, 1, 0, 1, 1]
        ]
        
        floodFill = FloodFill(grid: grid)
        XCTAssert(floodFill.numberOfComponents() == 2, "2 componentes")
        // Ensure the same result
        XCTAssert(floodFill.numberOfComponents() == 2, "2 componentes")
    }
    
    func testPerformanceFloodFill() {
        self.measureBlock() {
            var grid: [[Int]] = [
                [1, 0, 0, 0, 1],
                [0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0],
                [1, 0, 0, 0, 1]
            ]
            
            let floodFill = FloodFill(grid: grid)
            XCTAssert(floodFill.numberOfComponents() == 4, "4 componentes")
        }
    }
}
