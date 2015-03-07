//
//  Coordinate.swift
//  rasgos-geometricos
//
//  Created by Luis Flores on 1/27/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import Foundation

struct Coordinate : Printable {
    var x: Int = 0;
    var y: Int = 0;
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    var description: String {
        return "x:\(x) y:\(y)"
    }
}

func ==(lhs: Coordinate, rhs: Coordinate) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y;
}