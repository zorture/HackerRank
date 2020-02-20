//
//  MatrixRotation.swift
//  HackerRank
//
//  Created by Kanwar Zorawar Singh Rana on 2/20/20.
//  Copyright © 2020 Kanwar Zorawar Singh Rana. All rights reserved.
//

import Cocoa

enum Direction {
    case Down
    case Left
    case Up
    case Right
}

struct MatrixRange {
    var min: Int = 0
    var max: Int = 0
    
}

class MatrixRotation: BaseClass {
    
    var direction: Direction = .Down
    var matrix: [[Int]] = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
    class override func run() {
        //let ar = [[1,2,3],[4,5,6],[7,8,9]]
        //let ar = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
        let obj = MatrixRotation()
        let rowRange = MatrixRange(min: 0, max: obj.matrix.count)
        let colRange = MatrixRange(min: 0, max: obj.matrix.first?.count ?? 0)
        let node1 = obj.createLinkList(rowRange: rowRange, colRange: colRange)
        print("\n\n\n")
        let rowRange2 = MatrixRange(min: 1, max: obj.matrix.count-1)
        let colRange2 = MatrixRange(min: 1, max: obj.matrix.first!.count - 1 ?? 0)
        let node2 = obj.createLinkList(rowRange: rowRange2, colRange: colRange2)
    }
    // Complete the matrixRotation function below.
    func matrixRotation(matrix: [[Int]], r: Int) -> Void {
        print("1 1")
        print("1 1")
    }

    
    func createLinkList(rowRange: MatrixRange, colRange: MatrixRange) -> Node? {
        
        var rootNode: Node?
        var tempNode: Node?
        var condition = true
        var counterRow = rowRange.min
        var counterCol = colRange.min
        direction = .Down
        while condition {
            
            let node = Node()
            node.value = matrix[counterRow][counterCol]
            print("\(node.value ?? -1)")
            if rootNode == nil {
                rootNode = node
                tempNode = node
            } else {
                tempNode?.next = node
                tempNode = node
            }
            
            switch direction {
            case .Down:
                if counterRow < rowRange.max - 1 {
                    counterRow += 1
                } else {
                    counterCol += 1
                    direction = .Left
                }
            case .Left:
                if counterCol < colRange.max - 1 {
                    counterCol += 1
                } else {
                    counterRow -= 1
                    direction = .Up
                }
            case .Up:
                if counterRow > rowRange.min {
                    counterRow -= 1
                } else {
                    counterCol -= 1
                    direction = .Right
                }
            case .Right:
                if counterCol > colRange.min + 1 {
                    counterCol -= 1
                } else {
                    direction = .Down
                    condition = false
                }
            }
        }
        return rootNode
    }
    
}
