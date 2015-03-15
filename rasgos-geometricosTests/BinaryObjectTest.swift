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
        XCTAssert(binaryObject.activePixels == 4, "4 pixels")
        
        grid = [
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.activePixels == 0, "0 pixels")
        
        grid = [
            [1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.activePixels == 5*4, "20 pixels")
        
        grid = [
            [1, 1, 0, 1, 1],
            [1, 1, 0, 1, 1],
            [1, 1, 0, 1, 1],
            [1, 1, 0, 1, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.activePixels == 16, "16 pixels")
    }
    
    func testTetraPixels() {
        var grid: [[Int]] = [
            [1, 1, 1],
            [1, 1, 1],
            [1, 1, 1]
        ]
        
        var binaryObject = BinaryObject(grid:grid)
        XCTAssertTrue(binaryObject.isTetraPixel(Coordinate(x: 0, y: 0)))
        XCTAssertTrue(binaryObject.isTetraPixel(Coordinate(x: 1, y: 0)))
        XCTAssertTrue(binaryObject.isTetraPixel(Coordinate(x: 0, y: 1)))
        XCTAssertTrue(binaryObject.isTetraPixel(Coordinate(x: 1, y: 1)))
        
        XCTAssert(binaryObject.tetraPixels == 4, "Tetrapixels = 4 -> \(binaryObject.tetraPixels)")
        
        grid = [
            [1, 1, 1],
            [1, 0, 1],
            [1, 1, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssertFalse(binaryObject.isTetraPixel(Coordinate(x: 0, y: 0)))
        XCTAssertFalse(binaryObject.isTetraPixel(Coordinate(x: 1, y: 0)))
        XCTAssertFalse(binaryObject.isTetraPixel(Coordinate(x: 0, y: 1)))
        XCTAssertFalse(binaryObject.isTetraPixel(Coordinate(x: 1, y: 1)))
        
        XCTAssert(binaryObject.tetraPixels == 0, "Tetrapixels = 0 -> \(binaryObject.tetraPixels)")
        
        grid = [
            [1, 1, 1, 1],
            [1, 0, 1, 1],
            [1, 0, 0, 1],
            [1, 1, 1, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.tetraPixels == 1, "Tetrapixels = 1 -> \(binaryObject.tetraPixels)")
        
        grid = [
            [1, 1, 1, 1],
            [1, 1, 0, 1],
            [1, 0, 0, 1],
            [1, 1, 1, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.tetraPixels == 1, "Tetrapixels = 1 -> \(binaryObject.tetraPixels)")
        
        grid = [
            [1, 1, 1, 0],
            [1, 0, 1, 1],
            [1, 0, 0, 1],
            [1, 1, 1, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.tetraPixels == 0, "Tetrapixels = 0 -> \(binaryObject.tetraPixels)")
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
        XCTAssert(binaryObject.edges == 24, "Edges = 24 -> \(binaryObject.edges)")
        
        grid = [
            [1, 1, 1],
            [0, 0, 1],
            [1, 1, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.edges == 22, "Edges = 22 -> \(binaryObject.edges)")
        
        grid = [
            [1, 1, 1],
            [0, 0, 1],
            [0, 0, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.edges == 16, "Edges= 16 -> \(binaryObject.edges)")
        
        grid = [
            [1, 0, 1],
            [0, 1, 0],
            [1, 0, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.edges == 20, "Edges = 20 -> \(binaryObject.edges)")
    }
    
    func testVertex() {
        var grid: [[Int]] = [
            [1, 1, 1],
            [1, 1, 1],
            [1, 1, 1]
        ]
        
        var binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.vertex == 16, "Vertex = 16 -> \(binaryObject.vertex)")
        
        grid = [
            [1, 1, 1],
            [1, 0, 1],
            [1, 1, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.vertex == 16, "Vertex = 16 -> \(binaryObject.vertex)")
        
        grid = [
            [1, 1, 1],
            [0, 0, 1],
            [1, 1, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.vertex == 16, "Vertex = 16 -> \(binaryObject.vertex)")
        
        grid = [
            [1, 1, 1],
            [0, 0, 1],
            [0, 0, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        XCTAssert(binaryObject.vertex == 12, "Vertex = 12 -> \(binaryObject.vertex)")
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
    
    func testAdjacentPixels() {
        var grid: [[Int]] = [
            [1, 1, 1],
            [1, 0, 1],
            [1, 1, 1]
        ]
        
        var binaryObject = BinaryObject(grid:grid)
        var sol = binaryObject.adjacentSpaces(Coordinate(x: 0, y: 0))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(Coordinate(x: 0, y: 1))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(Coordinate(x: 0, y: 2))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(Coordinate(x: 1, y: 0))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(Coordinate(x: 1, y: 1))
        XCTAssert(sol == 0, "0 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(Coordinate(x: 1, y: 2))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(Coordinate(x: 2, y: 0))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(Coordinate(x: 2, y: 1))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(Coordinate(x: 2, y: 2))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        
        grid = [
            [1, 1, 0],
            [1, 1, 1],
            [1, 1, 1]
        ]
        
        binaryObject = BinaryObject(grid:grid)
        sol = binaryObject.adjacentSpaces(Coordinate(x: 0, y: 0))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(Coordinate(x: 0, y: 1))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(Coordinate(x: 0, y: 2))
        XCTAssert(sol == 0, "0 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(Coordinate(x: 1, y: 0))
        XCTAssert(sol == 1, "1 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(Coordinate(x: 1, y: 1))
        XCTAssert(sol == 0, "0 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(Coordinate(x: 1, y: 2))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(Coordinate(x: 2, y: 0))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(Coordinate(x: 2, y: 1))
        XCTAssert(sol == 1, "1 Adjacent Pixels")
        
        sol = binaryObject.adjacentSpaces(Coordinate(x: 2, y: 2))
        XCTAssert(sol == 2, "2 Adjacent Pixels")
    }

}
