//
//  ViewController.swift
//  LeetCodeDemo
//
//  Created by WangBo on 2019/4/18.
//  Copyright © 2019 YingZi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startClick(_ sender: Any) {
        testSolution()
    }
    
    func testSolution(){
        //print(Solution.mySqrt(10))
        //let node = TreeNode.nodeFromArr(arr: [1,2,2,3,4,4,3])
        //Solution.Instance.singleNumber([2,1,2,1,3])
        //Solution.Instance.sortedArrayToBST([1,2,3,4,5,6,7,8,9])
        //let n0 = Solution.Instance.node(from: [1])
        //let n1 = Solution.Instance.node(from: [9,9])
        //Solution.Instance.addTwoNumbers(n0, n1)?.printNode()
        //print(Solution.Instance.maxProfit([7,6,5,4,8]))
        //Solution.Instance.myAtoi("0-1")
        //Solution.Instance.updateMatrix3([[0,0,0],[0,1,0],[0,0,0]])
        Solution.Instance.merge2([[1,3],[2,6],[8,10],[15,18]])
    }

}
