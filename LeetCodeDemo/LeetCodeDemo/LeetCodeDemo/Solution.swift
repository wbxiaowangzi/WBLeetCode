//
//  Solution.swift
//  LeetCodeDemo
//
//  Created by WangBo on 2019/4/18.
//  Copyright © 2019 YingZi. All rights reserved.
//

import Foundation

class Solution {
    
    /// 牛顿迭代法：计算并返回 x 的平方根，其中 x 是非负整数。
    ///
    /// - Parameter x: 整数
    /// - Returns: 整数
    static func mySqrt(_ x: Int) -> Int {
        if x <= 1{
            return x
        }
        var r = x
        while r > x/r {
            r = (r+x/r)/2
        }
        return Int(r)
    }
    
}
