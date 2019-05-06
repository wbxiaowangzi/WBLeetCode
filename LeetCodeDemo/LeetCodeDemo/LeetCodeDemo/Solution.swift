//
//  Solution.swift
//  LeetCodeDemo
//
//  Created by WangBo on 2019/4/18.
//  Copyright © 2019 YingZi. All rights reserved.
//

import Foundation

class Solution {
    
    static let Instance:Solution = Solution()
    private init() {
    }
    
    /// 字符串转字符数组
    ///
    /// - Parameter str: 字符串
    /// - Returns: 字符数组
    func stringToArr(_ str: String) -> [Character] {
        var arr = [Character]()
        for c in str{
            arr.append(c)
        }
        return arr
    }
    
    
    /// 牛顿迭代法：计算并返回 x 的平方根，其中 x 是非负整数。
    ///
    /// - Parameter x: 整数
    /// - Returns: 整数
    func mySqrt(_ x: Int) -> Int {
        if x <= 1{
            return x
        }
        var r = x
        while r > x/r {
            r = (r+x/r)/2
        }
        return Int(r)
    }
    
    
    /// 给定一个二叉树，检查它是否是镜像对称的
    ///
    /// - Parameter root: 二叉树
    /// - Returns: 是否对称
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isMirror(p: root?.left, q: root?.right)
    }
    
    private func isMirror(p:TreeNode?, q:TreeNode?) -> Bool {
        if p == nil && q == nil{
            return true
        }
        if p?.val != q?.val{
            return false
        }
        if p?.val == q?.val{
          return isMirror(p: p?.left, q: q?.right) && isMirror(p: p?.right, q: q?.left)
        }
        return false
    }
    
    /// 给定一个二叉树，找出其最大深度。
    ///
    /// - Parameter root: root
    /// - Returns: 深度
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil{
            return 0
        }
        let depth = max(maxDepth(root?.left), maxDepth(root?.right)) + 1
        return depth
    }
    
}
