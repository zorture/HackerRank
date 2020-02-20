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
    case Stop

}

struct MatrixRange {
    let min: Int?
    let max: Int?
}

class MatrixRotation: BaseClass {
    
    var direction: Direction = .Down
    var matrix: [[Int]] = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
    class override func run() {
        //let ar = [[1,2,3],[4,5,6],[7,8,9]]
        //let ar = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
        let obj = MatrixRotation()
        //let rowRange = MatrixRange(min: 0, max: obj.matrix.count)
        //let colRange = MatrixRange(min: 0, max: obj.matrix.first?.count ?? 0)
        let node1 = obj.createLinkList(rowCount: obj.matrix.count, colCount: obj.matrix.first?.count ?? 0)
        
        //let node2 = obj.createLinkList(matrix: ar, rowCount: <#T##Int#>, colCount: <#T##Int#>)
    }
    // Complete the matrixRotation function below.
    func matrixRotation(matrix: [[Int]], r: Int) -> Void {
        print("1 1")
        print("1 1")
    }

    
    func createLinkList(rowCount: Int, colCount: Int) -> Node? {
        
        var rootNode: Node?
        var tempNode: Node?
        //let rowCount = matrix.count
        //var colCount = matrix.first?.count ?? 0
        var condition = true
        var counterRow = 0
        var counterCol = 0
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
                if counterRow < rowCount - 1 {
                    counterRow += 1
                } else {
                    counterCol += 1
                    direction = .Left
                }
            case .Left:
                if counterCol < colCount - 1 {
                    counterCol += 1
                } else {
                    counterRow -= 1
                    direction = .Up
                }
            case .Up:
                if counterRow > 0 {
                    counterRow -= 1
                } else {
                    counterCol -= 1
                    direction = .Right
                }
            case .Right:
                if counterCol > 1 {
                    counterCol -= 1
                } else {
                    direction = .Stop
                    condition = false
                }
            case .Stop:
                condition = false
            }
        }
        return rootNode
    }
    
}
