//
//  main.swift
//  NodeDemo
//
//  Created by chenghao on 2022/7/26.
//

import Foundation


public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
        
    }
}

func preorder(_ root: Node?) -> [Int] {
    if root == nil {
        return []
    }
    var res : [Int] = []
    res.append(root!.val)
    for head in root!.children {
        res.append(contentsOf: preorder(head))
    }
    return res
}

func postorder(_ root: Node?) -> [Int] {
    if root == nil {
        return []
    }
    var res : [Int] = []
    for subRoot in root!.children {
        res.append(contentsOf: postorder(subRoot))
    }
    res.append(root!.val)
    return res
}

