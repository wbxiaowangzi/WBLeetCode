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
    
    
    /// 给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。
    ///
    /// - Parameter s: 给定的字符串
    /// - Returns: 是否是回文字符串
    let NAndC:[Character] = ["1","2","3","4","5","6","7","8","9","0","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    func isPalindrome(_ s: String) -> Bool {
        var arr = stringToArr(s.lowercased())
        arr = arr.filter({NAndC.contains($0)})
        var i = 0
        let c = arr.count
        while i < c/2 {
            if arr[i] != arr[c - 1 - i]{
                return false
            }
            i += 1
        }
        return true
    }
    
    /// 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
    ///
    /// - Parameter nums: 数组
    /// - Returns: 只出现一次的元素
    func singleNumber(_ nums: [Int]) -> Int {
        let newarr = nums.sorted()
        var i = 0
        while i + 1 < newarr.count {
            let a = newarr[i]
            let b = newarr[i + 1]
            if a == b{
                i += 2
            }else{
                return a
            }
        }
        return newarr[i]
    }
    
}
