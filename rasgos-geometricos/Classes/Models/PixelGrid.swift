//
//  PixelGrid.swift
//  rasgos-geometricos
//
//  Created by Luis Flores on 2/3/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import Foundation

class PixelGrid {
    let rows: Int
    let columns: Int
    let grid: [[Int]]
    
    init(grid: [[Int]]) {
        self.grid = grid
        self.rows = grid.count
        self.columns = (rows > 0) ? grid[0].count : 0
    }
    
    func numberOfPixels() -> Int {
        var numberOfPixels = 0
        
        for row in 0..<rows {
            for col in 0..<columns {
                if (grid[row][col] == 1) {
                    numberOfPixels++
                }
            }
        }
        
        return numberOfPixels
    }
}