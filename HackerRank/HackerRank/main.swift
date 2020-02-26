//
//  main.swift
//  HackerRank
//
//  Created by Kanwar Zorawar Singh Rana on 2/20/20.
//  Copyright © 2020 Kanwar Zorawar Singh Rana. All rights reserved.
//

import Foundation


// Complete the matrixRotation function below.
func matrixRotation(matrix: [[Int]], r: Int) -> Void {
    MatrixRotation.matrixRotation(matrix: matrix, r: r)
}

var matrix: [[Int]] = [[1,2,3,4,5],[6,7,8,9,10],[10,11,12,13,15],[16,17,18,19,20]]

matrixRotation(matrix: matrix, r: 4)
