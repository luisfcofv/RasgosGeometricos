//
//  PixelGrid.swift
//  rasgos-geometricos
//
//  Created by Luis Flores on 2/3/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import Foundation

class BinaryObject {
    let rows: Int
    let columns: Int
    let grid: [[Int]]

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
}
