//
//  SomeClass.swift
//  LeetCodeDemo
//
//  Created by WangBo on 2019/5/6.
//  Copyright © 2019 YingZi. All rights reserved.
//

import Foundation

/**
 * Definition for a binary tree node.
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    static func nodeFromArr(arr:[Int])->TreeNode?{
        if arr.first == nil{
            return nil
        }
        let node = TreeNode.init(arr.first!)
        var i = 1,j = 0
        var nodes = [node]
        while i<arr.count {
            let tempNode = nodes[j]
            let left = TreeNode(arr[i])
            tempNode.left = left
            nodes.append(left)
            i += 1
            if i < arr.count{
                let right = TreeNode(arr[i])
                tempNode.right = right
                nodes.append(right)
            }
            i += 1
            j += 1
        }
        return node
    }
}


//  Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    static func nodeFromArr(arr:[Int])->ListNode?{
        if arr.first == nil{
            return nil
        }
        let node = ListNode.init(arr.first!)
        var i = 1,j = 0
        var nodes = [node]
        while i<arr.count {
            let tempNode = nodes[j]
            let next = ListNode(arr[i])
            tempNode.next = next
            nodes.append(next)
            i += 1
            j += 1
        }
        return node
    }
}
