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
    
    func testEdges() {
        var grid: [[Int]] = [
            [1, 1, 1],
            [1, 1, 1],
            [1, 1, 1]
        ]
        
        var binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.edges == 24, "Edges = 24 -> \(binaryObject.edges)")
    
        grid = [
            [1, 1, 1],
            [1, 0, 1],
            [1, 1, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.edges == 24, "binaryObject.edges = 24 -> \(binaryObject.edges)")
        
        grid = [
            [1, 1, 1],
            [0, 0, 1],
            [1, 1, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.edges == 22, "binaryObject.edges = 22 -> \(binaryObject.edges)")
        
        grid = [
            [1, 1, 1],
            [0, 0, 1],
            [0, 0, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.edges == 16, "binaryObject.edges = 16 -> \(binaryObject.edges)")
        
        grid = [
            [1, 0, 1],
            [0, 1, 0],
            [1, 0, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.edges == 20, "binaryObject.edges = 20 -> \(binaryObject.edges)")
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
    
    func testPerimeter() {
        var grid: [[Int]] = [
            [1, 1, 1],
            [1, 1, 1],
            [1, 1, 1]
        ]
        
        var binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.perimeter == 12, "P = 12 -> \(binaryObject.perimeter)")
        XCTAssert(binaryObject.contactPerimeter == 12, "PC = 12 -> \(binaryObject.contactPerimeter)")
        grid = [
            [1, 1, 1],
            [1, 0, 1],
            [1, 1, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.perimeter == 16, "P = 16 -> \(binaryObject.perimeter)")
        XCTAssert(binaryObject.contactPerimeter == 8, "PC = 8 -> \(binaryObject.contactPerimeter)")
        
        grid = [
            [1, 1, 0],
            [1, 1, 1],
            [1, 1, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.perimeter == 12, "P = 12 -> \(binaryObject.perimeter)")
        XCTAssert(binaryObject.contactPerimeter == 10, "PC = 10 -> \(binaryObject.contactPerimeter)")
        
        grid = [
            [1, 1, 0],
            [1, 0, 1],
            [1, 1, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.perimeter == 16, "P = 16 -> \(binaryObject.perimeter)")
        XCTAssert(binaryObject.contactPerimeter == 6, "PC = 6 -> \(binaryObject.contactPerimeter)")
        
        grid = [
            [1, 1, 1, 0],
            [1, 1, 1, 0],
            [1, 1, 1, 0],
            [0, 0, 0, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.perimeter == 16, "P = 16 -> \(binaryObject.perimeter)")
        XCTAssert(binaryObject.contactPerimeter == 12, "PC = 12 -> \(binaryObject.contactPerimeter)")
        
        grid = [
            [1, 1, 1, 0],
            [1, 0, 1, 0],
            [1, 1, 1, 0],
            [0, 0, 0, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.perimeter == 20, "P = 20 -> \(binaryObject.perimeter)")
        XCTAssert(binaryObject.contactPerimeter == 8, "PC = 8 -> \(binaryObject.contactPerimeter)")
        
        grid = [
            [1, 1, 1, 1, 1],
            [1, 0, 1, 0, 1],
            [1, 1, 1, 1, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.perimeter == 24, "P = 24 -> \(binaryObject.perimeter)")
        XCTAssert(binaryObject.contactPerimeter == 14, "PC = 14 -> \(binaryObject.contactPerimeter)")
    }
    
    func testAdjacentSpaces() {
        var grid: [[Int]] = [
            [1, 1, 1],
            [1, 0, 1],
            [1, 1, 1]
        ]
        
        var binaryObject = BinaryObject(grid:grid)
        var sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 0, y: 0))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 0, y: 1))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 0, y: 2))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 1, y: 0))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 1, y: 1))
        XCTAssert(sol == 0, "0 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 1, y: 2))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 2, y: 0))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 2, y: 1))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 2, y: 2))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        
        grid = [
            [1, 1, 0],
            [1, 1, 1],
            [1, 1, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 0, y: 0))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 0, y: 1))
        XCTAssert(sol == 2, "1 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 0, y: 2))
        XCTAssert(sol == 0, "0 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 1, y: 0))
        XCTAssert(sol == 1, "1 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 1, y: 1))
        XCTAssert(sol == 0, "0 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 1, y: 2))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 2, y: 0))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 2, y: 1))
        XCTAssert(sol == 1, "1 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 2, y: 2))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
    }
    
    func testAdjacentPixels() {
        var grid: [[Int]] = [
            [1, 1, 1],
            [1, 0, 1],
            [1, 1, 1]
        ]
        
        var binaryObject = BinaryObject(grid:grid)
        var sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 0, y: 0))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 0, y: 1))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 0, y: 2))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 1, y: 0))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 1, y: 1))
        XCTAssert(sol == 0, "0 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 1, y: 2))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 2, y: 0))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 2, y: 1))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(grid, coordinate: Coordinate(x: 2, y: 2))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
    }

}
