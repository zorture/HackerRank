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
let m = 10
let n = 20
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
    var n = matrix[0].count
    var run = max(m, n)
    run = run/2
    printMatrix(matrix: matrix)
    var direction:RotationDirection = .Down
    var matrix = matrix
    var shiftNo = -10
    var tempStore = 0
    let loop = (r*4)
    for k in 0..<run{
        n = matrix[k].count
        for _ in 0..<loop{
            switch direction{
            case .Up:
                let low = k
                let up = m-2-k
                if low<=up{
                    for i in (low...up).reversed() {
                        let nextUp = i
                        if shiftNo > -1{
                            tempStore = matrix[nextUp][n-1-k]
                            matrix[nextUp][n-1-k] = shiftNo
                            shiftNo = tempStore
                        }else{
                            shiftNo = matrix[i][k]
                        }
                        //printMatrix(matrix: matrix)
                        if i == k {
                            direction = .Left
                        }
                    }
                }
                else{
                    direction = .Left
                }
                break
            case .Down:
                let low = k
                let up = m-k
                if low<=up{
                    for i in low..<up{
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
                }else {
                    direction = .Right
                }
                break
            case .Left:
                let low = k
                let up = n-2-k
                if low<=up{
                    for i in (low...up).reversed() {
                        let nextLeft = i
                        if shiftNo > -1{
                            tempStore = matrix[k][nextLeft]
                            matrix[k][nextLeft] = shiftNo
                            shiftNo = tempStore
                        }else{
                            shiftNo = matrix[k][i]
                        }
                        //printMatrix(matrix: matrix)
                        if i == k {
                            direction = .Down
                            shiftNo = -10
                        }
                    }
                } else {
                    direction = .Down
                }
                break
            case .Right:
                let low = k+1
                let up = n-k
                if low<up{
                    for i in low..<up{
                        let nextRight = i
                        if shiftNo > -1{
                            tempStore = matrix[m-1-k][nextRight]
                            matrix[m-1-k][nextRight] = shiftNo
                            shiftNo = tempStore
                        }else{
                            shiftNo = matrix[i][k]
                        }
                        //printMatrix(matrix: matrix)
                        if i == n-1-k {
                            direction = .Up
                        }
                    }
                } else {
                    direction = .Up
                }
                break
            }
        }
        printMatrix(matrix: matrix)
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

matrixRotation(matrix: matrix, r: 1)


