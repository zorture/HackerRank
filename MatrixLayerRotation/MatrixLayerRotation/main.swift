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
let n = 5
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
    var run = max(m, n)
    run = run/2
    printMatrix(matrix: matrix)
    var direction:RotationDirection = .Down
    var matrix = matrix
    var shiftNo = -10
    var tempStore = 0
    let loop = (r*4)
    for k in 0..<run{
        for _ in 0..<loop{
            switch direction{
            case .Up:
                for i in (k...m-2-k).reversed() {
                    let nextUp = i
                    tempStore = matrix[nextUp][n-1-k]
                    matrix[nextUp][n-1-k] = shiftNo
                    shiftNo = tempStore
                    //printMatrix(matrix: matrix)
                    if i == k {
                        direction = .Left
                    }
                }
                break
            case .Down:
                for i in k..<m-k{
                    let nextDown = i
                    if shiftNo > -1{
                        tempStore = matrix[nextDown][k]
                        matrix[nextDown][k] = shiftNo
                        shiftNo = tempStore
                    }else{
                        shiftNo = matrix[i][k]
                    }
                    //printMatrix(matrix: matrix)
                    if i == m-1-k {
                        direction = .Right
                    }
                }
                break
            case .Left:
                for i in (k...n-2-k).reversed() {
                    let nextLeft = i
                    tempStore = matrix[k][nextLeft]
                    matrix[k][nextLeft] = shiftNo
                    shiftNo = tempStore
                    //printMatrix(matrix: matrix)
                    if i == k {
                        direction = .Down
                        shiftNo = -10
                    }
                }
                break
            case .Right:
                for i in 1+k..<n-k{
                    let nextRight = i
                    tempStore = matrix[m-1-k][nextRight]
                    matrix[m-1-k][nextRight] = shiftNo
                    shiftNo = tempStore
                    //printMatrix(matrix: matrix)
                    if i == n-1-k {
                        direction = .Up
                    }
                }
                break
            }
        }
        //printMatrix(matrix: matrix)
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
}

for i in 0..<m{
    for j in 0..<n{
        matrix[i][j] = no
        no += 1
    }
}

matrixRotation(matrix: matrix, r: 2)

