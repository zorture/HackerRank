//
//  MatrixRotation.swift
//  HackerRank
//
//  Created by Kanwar Zorawar Singh Rana on 2/20/20.
//  Copyright © 2020 Kanwar Zorawar Singh Rana. All rights reserved.
//

import Cocoa

class Node {
    var value: Int?
    var next: Node?
    var prev: Node?
}

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

class MatrixRotation {
    
    var direction: Direction = .Down
    var matrix: [[Int]] = [[122,2,3,4,5],[6,7,8,9,10],[10,11,12,13,15]]
    var newMatrix: [[Int]]?
    
    class func matrixRotation(matrix: [[Int]], r: Int) -> Void {
        let obj = MatrixRotation()
        obj.matrix = matrix
        
        for i in obj.matrix {
            for j in i {
                print(j, terminator: " ")
            }
            print(" ")
        }
        
        print("\n")
        let rowRange = MatrixRange(min: 0, max: obj.matrix.count)
        let colRange = MatrixRange(min: 0, max: obj.matrix.first?.count ?? 0)
        let node1 = obj.createLinkList(rowRange: rowRange, colRange: colRange)
    
        let rowRange2 = MatrixRange(min: 1, max: obj.matrix.count-1)
        let colRange2 = MatrixRange(min: 1, max: obj.matrix.first!.count - 1 )
        let node2 = obj.createLinkList(rowRange: rowRange2, colRange: colRange2)
        
        let rotate = r
        
        guard var rotatedNodeRoot1 = node1 else { return }
        for _ in 0..<rotate {
            if let tempNode = rotatedNodeRoot1.prev as? MatrixNode {
                rotatedNodeRoot1 = tempNode
            }
        }
        
        guard var rotatedNodeRoot2 = node2 else { return }
        for _ in 0..<rotate {
            if let tempNode = rotatedNodeRoot2.prev as? MatrixNode {
                rotatedNodeRoot2 = tempNode
            }
        }
        
        // Create new array
        obj.newMatrix = Array(repeating: Array(repeating: 0, count: colRange.max), count: rowRange.max)
        
        obj.createMatrix(node: rotatedNodeRoot1, rowRange: rowRange, colRange: colRange)
        obj.createMatrix(node: rotatedNodeRoot2, rowRange: rowRange2, colRange: colRange2)

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
                if rootNode == nil {
                    rootNode = node
                    tempNode = node
                } else {
                    tempNode?.next = node
                    node.prev = tempNode
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
                if counterRow > rowRange.min + 1{
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
                    rootNode?.prev = tempNode
                }
            }
        }
        return rootNode
    }
    
}
