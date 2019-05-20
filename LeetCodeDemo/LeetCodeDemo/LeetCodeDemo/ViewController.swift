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
        Solution.Instance.singleNumber([2,1,2,1,3])
        
    }

}

