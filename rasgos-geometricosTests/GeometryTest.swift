//
//  GeometryTest.swift
//  rasgos-geometricos
//
//  Created by Luis Flores on 2/3/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import UIKit
import XCTest

class GeometryTest: XCTestCase {

    func testPerimeter() {
        var grid: [[Int]] = [
            [1, 1, 1],
            [1, 1, 1],
            [1, 1, 1]
        ]

        var p = Geometry.perimeter(grid)
        var pc = Geometry.contactPerimeter(grid)
        XCTAssert(p == 12, "P = 12 -> \(p)")
        XCTAssert(pc == 12, "PC = 12 -> \(pc)")
        grid = [
        [1, 1, 1],
        [1, 0, 1],
        [1, 1, 1]
        ]
        
        p = Geometry.perimeter(grid)
        pc = Geometry.contactPerimeter(grid)
        XCTAssert(p == 16, "P = 16 -> \(p)")
        XCTAssert(pc == 8, "PC = 8 -> \(pc)")
        
        grid = [
            [1, 1, 0],
            [1, 1, 1],
            [1, 1, 1]
        ]
        
        p = Geometry.perimeter(grid)
        pc = Geometry.contactPerimeter(grid)
        XCTAssert(p == 12, "P = 12 -> \(p)")
        XCTAssert(pc == 10, "PC = 10 -> \(pc)")
        
        grid = [
            [1, 1, 0],
            [1, 0, 1],
            [1, 1, 1]
        ]
        
        p = Geometry.perimeter(grid)
        pc = Geometry.contactPerimeter(grid)
        XCTAssert(p == 16, "P = 16 -> \(p)")
        XCTAssert(pc == 6, "PC = 6 -> \(pc)")
        
        grid = [
            [1, 1, 1, 0],
            [1, 1, 1, 0],
            [1, 1, 1, 0],
            [0, 0, 0, 1]
        ]
        
        p = Geometry.perimeter(grid)
        pc = Geometry.contactPerimeter(grid)
        XCTAssert(p == 16, "P = 16 -> \(p)")
        XCTAssert(pc == 12, "PC = 12 -> \(pc)")
        
        grid = [
            [1, 1, 1, 0],
            [1, 0, 1, 0],
            [1, 1, 1, 0],
            [0, 0, 0, 1]
        ]
        
        p = Geometry.perimeter(grid)
        pc = Geometry.contactPerimeter(grid)
        XCTAssert(p == 20, "P = 20 -> \(p)")
        XCTAssert(pc == 8, "PC = 8 -> \(pc)")
        
        grid = [
            [1, 1, 1, 1, 1],
            [1, 0, 1, 0, 1],
            [1, 1, 1, 1, 1]
        ]
        
        p = Geometry.perimeter(grid)
        pc = Geometry.contactPerimeter(grid)
        XCTAssert(p == 24, "P = 24 -> \(p)")
        XCTAssert(pc == 14, "PC = 14 -> \(pc)")
    }
    
    func testAdjacentSpaces() {
        var grid: [[Int]] = [
            [1, 1, 1],
            [1, 0, 1],
            [1, 1, 1]
        ]

        var sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 0, y: 0))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 0, y: 1))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 0, y: 2))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 1, y: 0))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 1, y: 1))
        XCTAssert(sol == 0, "0 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 1, y: 2))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 2, y: 0))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 2, y: 1))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 2, y: 2))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        
        grid = [
            [1, 1, 0],
            [1, 1, 1],
            [1, 1, 1]
        ]
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 0, y: 0))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 0, y: 1))
        XCTAssert(sol == 2, "1 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 0, y: 2))
        XCTAssert(sol == 0, "0 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 1, y: 0))
        XCTAssert(sol == 1, "1 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 1, y: 1))
        XCTAssert(sol == 0, "0 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 1, y: 2))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 2, y: 0))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 2, y: 1))
        XCTAssert(sol == 1, "1 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 2, y: 2))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
    }
    
    func testAdjacentPixels() {
        var grid: [[Int]] = [
            [1, 1, 1],
            [1, 0, 1],
            [1, 1, 1]
        ]
        
        var sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 0, y: 0))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 0, y: 1))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 0, y: 2))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 1, y: 0))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 1, y: 1))
        XCTAssert(sol == 0, "0 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 1, y: 2))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 2, y: 0))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 2, y: 1))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = Geometry.adjacentSpaces(grid, coordinate: Coordinate(x: 2, y: 2))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
    }
}
