//
//  MatrixRotation.swift
//  HackerRank
//
//  Created by Kanwar Zorawar Singh Rana on 2/20/20.
//  Copyright © 2020 Kanwar Zorawar Singh Rana. All rights reserved.
//

import Cocoa

class MatrixNode: Node {
    var isStart = false
}

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
    var newMatrix: [[Int]]?
    class override func run() {
        let obj = MatrixRotation()
        

        for i in obj.matrix {
            for j in i {
                print(j, terminator: " ")
            }
            print(" ")
        }
        
        let rowRange = MatrixRange(min: 0, max: obj.matrix.count)
        let colRange = MatrixRange(min: 0, max: obj.matrix.first?.count ?? 0)
        let node1 = obj.createLinkList(rowRange: rowRange, colRange: colRange)
    
        let rowRange2 = MatrixRange(min: 1, max: obj.matrix.count-1)
        let colRange2 = MatrixRange(min: 1, max: obj.matrix.first!.count - 1 )
        let node2 = obj.createLinkList(rowRange: rowRange2, colRange: colRange2)
        
        let rotate = 4
        
        guard var rotatedNodeRoot1 = node1 else { return }
        for _ in 0..<rotate {
            if let tempNode = rotatedNodeRoot1.next as? MatrixNode {
                rotatedNodeRoot1 = tempNode
            }
        }
        
        guard var rotatedNodeRoot2 = node2 else { return }
        for _ in 0..<rotate {
            if let tempNode = rotatedNodeRoot2.next as? MatrixNode {
                rotatedNodeRoot2 = tempNode
            }
        }
        
        // Create new array
        obj.newMatrix = Array(repeating: Array(repeating: 0, count: colRange.max), count: rowRange.max)
        
        obj.createMatrix(node: rotatedNodeRoot1, rowRange: rowRange, colRange: colRange)
        obj.createMatrix(node: rotatedNodeRoot2, rowRange: rowRange2, colRange: colRange2)
        
        print("\n\n\n")
        
        for i in obj.newMatrix! {
            for j in i {
                print(j, terminator: " ")
            }
            print(" ")
        }
        
    }
    
    func createMatrix(node: MatrixNode, rowRange: MatrixRange, colRange: MatrixRange) {
        
        var currentNode = node
        var condition = true
        var skip = false
        var counterRow = rowRange.min
        var counterCol = colRange.min
        direction = .Down
        
        while condition {
            
            if !skip {
                if let value = currentNode.value {
                    newMatrix![counterRow][counterCol] = value
                    currentNode = currentNode.next! as! MatrixNode
                }
            } else {
                skip = false
            }
            
            switch direction {
            case .Down:
                if counterRow < rowRange.max - 1 {
                    counterRow += 1
                } else {
                    skip = true
                    direction = .Left
                }
            case .Left:
                if counterCol < colRange.max - 1 {
                    counterCol += 1
                } else {
                    skip = true
                    direction = .Up
                }
            case .Up:
                if counterRow > rowRange.min {
                    counterRow -= 1
                } else {
                    skip = true
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
    }
    
    // Complete the matrixRotation function below.
    func matrixRotation(matrix: [[Int]], r: Int) -> Void {

    }

    
    func createLinkList(rowRange: MatrixRange, colRange: MatrixRange) -> MatrixNode? {
        
        var rootNode: MatrixNode?
        var tempNode: MatrixNode?
        var condition = true
        var skip = false
        var counterRow = rowRange.min
        var counterCol = colRange.min
        direction = .Down
        while condition {
            
            if !skip {
                let node = MatrixNode()
                node.value = matrix[counterRow][counterCol]
                //print("\(node.value ?? -1)")
                if rootNode == nil {
                    rootNode = node
                    tempNode = node
                } else {
                    tempNode?.next = node
                    tempNode = node
                }
            } else {
                skip = false
            }
            
            switch direction {
            case .Down:
                if counterRow < rowRange.max - 1 {
                    counterRow += 1
                } else {
                    skip = true
                    direction = .Left
                }
            case .Left:
                if counterCol < colRange.max - 1 {
                    counterCol += 1
                } else {
                    skip = true
                    direction = .Up
                }
            case .Up:
                if counterRow > rowRange.min {
                    counterRow -= 1
                } else {
                    skip = true
                    direction = .Right
                }
            case .Right:
                if counterCol > colRange.min + 1 {
                    counterCol -= 1
                } else {
                    direction = .Down
                    condition = false
                    tempNode?.next = rootNode
                }
            }
        }
        return rootNode
    }
    
}
