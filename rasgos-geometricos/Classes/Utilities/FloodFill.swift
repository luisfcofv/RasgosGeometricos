//
//  FloodFill.swift
//  rasgos-geometricos
//
//  Created by Luis Flores on 1/27/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import Foundation

public class FloodFill {
    let dr = [1, 1, 0,-1,-1,-1, 0, 1]
    let dc = [0, 1, 1, 1, 0,-1,-1,-1]

    let rows: Int
    let columns: Int
    let grid: [[Int]]
    var mutableGrid: [[Int]]
    
    init(grid: [[Int]]) {
        self.grid = grid
        self.mutableGrid = grid
        self.rows = grid.count
        self.columns = (rows > 0) ? grid[0].count : 0
    }
    
    private func numberOfElementsInComponent(coordinate: Coordinate) -> Int {
        let x = coordinate.x
        let y = coordinate.y
    
        if x < 0 || x >= rows || y < 0 || y >= columns || self.mutableGrid[x][y] == 0 {
            return 0
        }

        self.mutableGrid[x][y] = 0
        
        var numberOfElements = 1
        for index in 0..<dr.count {
            let newCoordinate = Coordinate(x: x + dr[index], y: y + dc[index])
            numberOfElements += numberOfElementsInComponent(newCoordinate)
        }
        
        return numberOfElements;
    }
    
    public func numberOfComponents() -> Int {
        self.mutableGrid = self.grid
        var components = 0
        
        for row in 0..<rows {
            for col in 0..<columns {
                let coordinate = Coordinate(x: row, y: col)
                components += min(1, numberOfElementsInComponent(coordinate))
            }
        }

        return components
    }
}