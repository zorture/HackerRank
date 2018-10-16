//
//  main.swift
//  MatrixLayerRotation
//
//  Created by Kanwar Zorawar Singh Rana on 10/11/18.
//  Copyright © 2018 Xorture. All rights reserved.
//

import Foundation

//print("Please enter M x N matrix with the no of Rotation")
//print("3 3 2")
let m = 4
let n = 4
var no = 1
var matrix = Array(repeating: Array(repeating: 0, count: n), count: m)

enum RotationDirection {
    case Up
    case Down
    case Left
    case Right
}

func matrixRotation(matrix: [[Int]], r: Int) -> Void {
    let m = matrix.count
    let n = matrix[0].count
    printMatrix(matrix: matrix)
    var direction:RotationDirection = .Down
    var matrix = matrix
    var shiftNo = -10
    var tempStore = 0
    let loop = (r*4)
    
    for _ in 0..<loop{
        switch direction{
        case .Up:
            for i in (0...m-2).reversed() {
                let nextUp = i
                tempStore = matrix[nextUp][n-1]
                matrix[nextUp][n-1] = shiftNo
                shiftNo = tempStore
                //printMatrix(matrix: matrix)
                if i == 0 {
                    direction = .Left
                }
            }
            break
        case .Down:
            for i in 0..<m{
                let nextDown = i
                if shiftNo > -1{
                    tempStore = matrix[nextDown][0]
                    matrix[nextDown][0] = shiftNo
                    shiftNo = tempStore
                }else{
                    shiftNo = matrix[i][0]
                }
                //printMatrix(matrix: matrix)
                if i == m-1 {
                    direction = .Right
                }
            }
            break
        case .Left:
            for i in (0...n-2).reversed() {
                let nextLeft = i
                tempStore = matrix[0][nextLeft]
                matrix[0][nextLeft] = shiftNo
                shiftNo = tempStore
                //printMatrix(matrix: matrix)
                if i == 0 {
                    direction = .Down
                }
            }
            break
        case .Right:
            for i in 1..<n{
                let nextRight = i
                tempStore = matrix[m-1][nextRight]
                matrix[m-1][nextRight] = shiftNo
                shiftNo = tempStore
                //printMatrix(matrix: matrix)
                if i == n-1 {
                    direction = .Up
                }
            }
            break
        }
    }
    printMatrix(matrix: matrix)
}

func printMatrix(matrix: [[Int]]){
    print("\n")
    
    for i in 0..<m{
        for j in 0..<n{
            print("", matrix[i][j], separator: " ", terminator:"")
        }
        print("\n")
    }
    
    //print(matrix)
}

for i in 0..<m{
    for j in 0..<n{
        matrix[i][j] = no
        no += 1
    }
}

//print(matrix)

matrixRotation(matrix: matrix, r: 1)

