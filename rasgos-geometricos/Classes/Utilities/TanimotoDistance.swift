//
//  TanimotoDistance.swift
//  rasgos-geometricos
//
//  Created by Luis Flores on 3/7/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import UIKit

class TanimotoDistance: NSObject {
   
    class func tanimotoDistance(objectA:BinaryObject, objectB:BinaryObject) -> Double {
        
        var sharedPixels = 0
        var diff = Coordinate(x: objectB.centerOfMass.x - objectA.centerOfMass.x,
                              y: objectB.centerOfMass.y - objectA.centerOfMass.y)

        for row in 0..<objectB.rows {
            for col in 0..<objectB.columns {
                if row - diff.y < 0 || row - diff.y >= objectA.rows
                    || col - diff.x < 0 || col - diff.y >= objectA.columns {
                    continue
                }

                if objectA.grid[row - diff.y][col - diff.x] == 1
                    && objectB.grid[row][col] == 1 {
                    sharedPixels++
                }
            }
        }
        
        var activePixels = objectA.activePixels + objectB.activePixels
        return Double(activePixels - 2 * sharedPixels) / Double(activePixels - sharedPixels)
    }
}
