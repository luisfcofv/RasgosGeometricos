//
//  ViewController.swift
//  rasgos-geometricos
//
//  Created by Luis Flores on 1/27/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        var grid: [[Int]] = [   [1, 0, 0, 0, 1],
                                [0, 0, 0, 0, 0],
                                [0, 0, 0, 0, 0],
                                [0, 0, 0, 0, 1]
                            ]

        let floodFill = FloodFill(grid: grid)
        print(floodFill.numberOfComponents())
    }
}

