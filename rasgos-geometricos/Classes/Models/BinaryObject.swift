//
//  PixelGrid.swift
//  rasgos-geometricos
//
//  Created by Luis Flores on 2/3/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import Foundation

class BinaryObject {
    let grid: [[Int]]
    let rows: Int
    let columns: Int
    
    lazy var edges: Int = {
        return self.perimeter + self.contactPerimeter
    }()

    lazy var perimeter: Int = {
        var perimeter = 0

        for row in 0..<self.rows {
            for col in 0..<self.columns {
                perimeter += self.adjacentSpaces(self.grid, coordinate: Coordinate(x: row, y: col))
            }
        }
        
        return perimeter
    }()
    
    lazy var contactPerimeter: Int = {
        var contactPerimeter = 0
        let pixels = self.numberOfActivePixels()
        let valuePerimeter = self.perimeter
        // PC = 2 * N - (P / 2)
        return (2 * pixels) - (valuePerimeter / 2)
    }()
    
    lazy var centerOfMass:Coordinate = {
        var sumX = 0, x = 0
        var sumY = 0, y = 0

        for row in 0..<self.rows {
            for col in 0..<self.columns {
                if (self.grid[row][col] == 1) {
                    sumY += row
                    sumX += col
                    x++
                    y++
                }
            }
        }

        var centerX = round(Double(sumX) / Double(x))
        var centerY = round(Double(sumY) / Double(y))
        return Coordinate(x: Int(centerX), y: Int(centerY))
    }()

    init(grid: [[Int]]) {
        self.grid = grid
        self.rows = grid.count
        self.columns = (rows > 0) ? grid[0].count : 0
    }
    
    func numberOfActivePixels() -> Int {
        var numberOfActivePixels = 0
        
        for row in 0..<rows {
            for col in 0..<columns {
                if (grid[row][col] == 1) {
                    numberOfActivePixels++
                }
            }
        }
        
        return numberOfActivePixels
    }
    
    func adjacentSpaces(grid: [[Int]], coordinate:Coordinate) -> Int {
        var spaces = 0
        let row = coordinate.x
        let column = coordinate.y
        
        let rows = grid.count
        let columns = (rows > 0) ? grid[0].count : 0
        
        if grid[row][column] == 0 {
            return 0
        }
        
        // The point is on the left edge
        if row == 0 {
            spaces++
        }
        
        // The point is on the top edge
        if column == 0 {
            spaces++
        }
        
        // The point is on the right edge
        if row + 1 == rows {
            spaces++
        }
        
        // The point is on the bottom edge
        if column + 1 == columns {
            spaces++
        }
        
        if row + 1 < rows && grid[row + 1][column] == 0 {
            spaces++
        }
        
        if column + 1 < columns && grid[row][column + 1] == 0 {
            spaces++
        }
        
        if row > 0 && grid[row - 1][column] == 0 {
            spaces++
        }
        
        if column > 0 && grid[row][column - 1] == 0 {
            spaces++
        }
        
        return spaces
    }
}
