//
//  Geometry.swift
//  rasgos-geometricos
//
//  Created by Luis Flores on 1/28/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import Foundation

class Geometry {

    class func perimeter(grid: [[Int]]) -> Int {
        var perimeter = 0
        
        let rows = grid.count
        let columns = (rows > 0) ? grid[0].count : 0
        
        for row in 0..<rows {
            for col in 0..<columns {
                perimeter += adjacentSpaces(grid, coordinate: Coordinate(x: row, y: col))
            }
        }

        return perimeter
    }
    
    class func contactPerimeter(grid: [[Int]]) -> Int {
        var contactPerimeter = 0
        let pixelGrid = PixelGrid(grid: grid)
        let pixels = pixelGrid.numberOfPixels()
        let valuePerimeter = perimeter(grid)
        // PC = 2 * N - (P / 2)
        return (2 * pixels) - (valuePerimeter / 2)
    }
    
    class func adjacentSpaces(grid: [[Int]], coordinate:Coordinate) -> Int {
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