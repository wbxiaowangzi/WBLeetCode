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
    
    
    /// 将有序数组转换为一个高度平衡的二叉搜索树
    ///
    /// - Parameter nums: 有序数组
    /// - Returns: 二叉搜索树
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.count > 0{
            let tn = TreeNode(nums[nums.count/2])
            tn.left = sortedArrayToBST(Array(nums.prefix(upTo: nums.count/2)))
            tn.right = sortedArrayToBST(Array(nums.suffix(from: nums.count/2+1)))
            return tn
        }else{
            return nil
        }
    }
    
    
    /// 翻转字符串里的单词
    ///
    /// - Parameter s: 字符串
    /// - Returns: 翻转后的字符串
    func reverseWords(_ s: String) -> String {
        let arr = s.components(separatedBy: " ").filter({$0 != " " && $0.count > 0}).reversed()
        return arr.joined(separator: " ")
    }
    
    /*
     给你两个 非空 链表来代表两个非负整数。数字最高位位于链表开始位置。它们的每个节点只存储一位数字。将这两数相加会返回一个新的链表。
     你可以假设除了数字 0 之外，这两个数字都不会以零开头。
     */
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var arr0 = [Int]()
        var arr1 = [Int]()
        var n0 = l1
        var n1 = l2
        while n0 != nil || n1 != nil{
            if n0 != nil{
                arr0.append(n0!.val)
                n0 = n0?.next
            }else{
                arr0.insert(0, at: 0)
            }
            if n1 != nil{
                arr1.append(n1!.val)
                n1 = n1?.next
            }else{
                arr1.insert(0, at: 0)
            }
        }
        
        var res = [Int]()
        var i = arr0.count-1
        var carry = 0
        while i>=0 {
            let sum = arr1[i]+arr0[i]+carry
            res.insert(sum%10, at: 0)
            carry = sum/10
            i -= 1
        }
        if carry > 0 {
            res.insert(carry, at: 0)
        }
        //思路1：给长度不足的node添加value为0的node 然后直接给两个node按位相加对十取余
        //思路2：给所有的value提取成两个数组，然后让两个数组按约定相加，最后用结果创建新的node
        return node(from: res)
    }
    
    func node(from arr:[Int])->ListNode?{
        var result:ListNode?
        var currentNode:ListNode?
        for i in arr{
            let node = ListNode(i)
            if result == nil{
                result = node
                currentNode = node
            }else{
                currentNode!.next = node
                currentNode = node
            }
        }
        return result
    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count <= 1 {
            return 0
        }
        var minP = prices[0]
        var maxP = 0
        
        for i in 1..<prices.count{
            maxP = max(maxP, prices[i]-minP)
            minP = min(prices[i], minP)
        }
        return maxP
    }
    
    
    func myAtoi(_ str: String) -> Int {
        let dic = ["0":0,"1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9]
        var result = 0
        var hadBegin = false
        var sign = 1
        for c in str{
            if c == " ",!hadBegin{
                continue
            }
            if (c == "-" || c == "+") && !hadBegin {
                if c == "-"{
                    sign = -1
                }
                hadBegin = true
            }else {
                if let i = dic[String.init(c)]{
                    let v = result*10 + i
                    if sign == -1, v > 2147483648{
                        result = 2147483648
                        break
                    }else if sign == 1,v > 2147483647{
                        result = 2147483647
                        break
                    }
                    result = v
                    hadBegin = true
                }else{
                    break
                }
            }
        }
        result *= sign
        return result
    }
}
