//
//  main.swift
//  TreeNodeDemo
//
//  Created by chenghao on 2022/3/22.
//

import Foundation


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int=0, _ left: TreeNode?=nil, _ right: TreeNode?=nil) {
      self.val = val
      self.left = left
      self.right = right
    }
}
 


public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param root TreeNode类
     * @return int整型一维数组
     */
    //BM23 二叉树的前序遍历
    //https://www.nowcoder.com/practice/5e2135f4d2b14eb8a5b06fab4c938635?tpId=295&tqId=2291302&ru=%2Fpractice%2F1291064f4d5d4bdeaefbf0dd47d78541&qru=%2Fta%2Fformat-top101%2Fquestion-ranking&sourceUrl=%2Fexam%2Foj
    func preorderTraversal ( _ root: TreeNode?) -> [Int] {
        var r : [Int] = []
        if(root?.val == nil) {
            return []
        } else {
            r.append(root!.val)
            r.append(contentsOf: preorderTraversal(root!.left))
            r.append(contentsOf: preorderTraversal(root!.right))
            return r
        }
    }
    
    //BM25 二叉树的后序遍历
    //https://www.nowcoder.com/practice/1291064f4d5d4bdeaefbf0dd47d78541?tpId=295&tqId=2291301&ru=%2Fpractice%2F5e2135f4d2b14eb8a5b06fab4c938635&qru=%2Fta%2Fformat-top101%2Fquestion-ranking&sourceUrl=%2Fexam%2Foj
    func postorderTraversal ( _ root: TreeNode?) -> [Int] {
        var r : [Int] = []
        if(root?.val == nil) {
            return []
        } else {
            r.append(contentsOf: postorderTraversal(root?.left))
            r.append(contentsOf: postorderTraversal(root?.right))
            r.append(root!.val)
            return r
        }
    }
    
    //中序遍历
    func middenTraversal ( _ root: TreeNode?) -> [Int] {
        var r : [Int] = []
        if(root?.val == nil) {
            return []
        } else {
            r.append(contentsOf: middenTraversal(root?.left))
            r.append(root!.val)
            r.append(contentsOf: middenTraversal(root?.right))
            return r
        }
    }
    
    //BM26 求二叉树的层序遍历
    //https://www.nowcoder.com/practice/04a5560e43e24e9db4595865dc9c63a3?tpId=295&tqId=644&ru=%2Fpractice%2F8b3b95850edb4115918ecebdf1b4d222&qru=%2Fta%2Fformat-top101%2Fquestion-ranking&sourceUrl=%2Fexam%2Foj
    func levelOrder1 ( _ root: TreeNode?) -> [[Int]] {
        // write code here
        var res = [[Int]]()
        if root == nil {
            return res
        }
        var queue = [root!] //定义一个TreeNode队列，后续就操作这个队列
        while !queue.isEmpty { //TreeNode不为空就遍历，queue中先有一个TreeNode就是root,第2次就两个，第3次4个,依次类推，同时res中一层层地输出
            let r = getNodes(queue)
            res.append(r.vals)
            queue = r.nodes
        }
        return res
    }
    
    //得到每一层的val和下一层的node
    func getNodes(_ nodes:[TreeNode]) -> (vals: [Int], nodes: [TreeNode]) {
        var values = [Int]()
        var nextNodes = [TreeNode]()
        for treeNode in nodes {
            values.append(treeNode.val)
            if let l = treeNode.left {
                nextNodes.append(l)
            }
            if let r = treeNode.right {
                nextNodes.append(r)
            }
        }
        return (values, nextNodes)
    }
    
    func levelOrder ( _ root: TreeNode?) -> [[Int]] {
        // write code here
        var res = [[Int]]()//最终结果
        iterationFunc(root, level: 0, res: &res)
        return res
    }
    
    func iterationFunc( _ root: TreeNode?, level: Int, res:inout [[Int]]) {
        if root == nil {
            return
        }
        if level >= res.count { //新的一层
            res.append([Int]()) //后面加一个空的[Int]数组
        }
        res[level].append(root!.val)//根结点添加到数组中
        iterationFunc(root?.left, level: level + 1, res: &res) //添加左子树
        iterationFunc(root?.right, level: level + 1, res: &res) //添加右子树
    }
    //BM28 二叉树的最大深度
    //https://www.nowcoder.com/practice/8a2b2bf6c19b4f23a9bdb9b233eefa73?tpId=295&tqId=642&ru=/exam/oj&qru=/ta/format-top101/question-ranking&sourceUrl=%2Fexam%2Foj
    func maxDepth ( _ root: TreeNode?) -> Int {
        // write code here
        if(root?.val == nil) {
            return 0
        }
        return 1 + max(maxDepth(root?.left),maxDepth(root?.right))
    }
    
    //BM29 二叉树中和为某一值的路径(一)
    //https://www.nowcoder.com/practice/508378c0823c423baa723ce448cbfd0c?tpId=295&tqId=634&ru=/exam/oj&qru=/ta/format-top101/question-ranking&sourceUrl=%2Fexam%2Foj%3Ftab%3D%25E7%25AE%2597%25E6%25B3%2595%25E7%25AF%2587%26topicId%3D295
    func hasPathSum ( _ root: TreeNode?,  _ sum: Int) -> Bool {
        // write code here
        if root == nil {
            return false
        }
        if root?.left == nil && root?.right == nil && sum - root!.val == 0 {
            return true
        }
        return hasPathSum(root?.left, sum-root!.val) || hasPathSum(root?.right, sum-root!.val)
    }
    
    //BM31 对称的二叉树
    //https://www.nowcoder.com/practice/ff05d44dfdb04e1d83bdbdab320efbcb?tpId=295&tqId=23452&ru=%2Fpractice%2F28eb3175488f4434a4a6207f6f484f47&qru=%2Fta%2Fformat-top101%2Fquestion-ranking&sourceUrl=%2Fexam%2Foj%3Ftab%3D%25E7%25AE%2597%25E6%25B3%2595%25E7%25AF%2587%26topicId%3D295
    func isSymmetrical ( _ pRoot: TreeNode?) -> Bool {
        // write code here
        if pRoot == nil {
            return true
        }
        return isSame(pRoot?.left, pRoot?.right)
    }
    
    func isSame(_ leftTreeNode: TreeNode?, _ rightTreeNode: TreeNode?) -> Bool {
        if leftTreeNode == nil && rightTreeNode == nil {
            return true
        }
        if leftTreeNode == nil || rightTreeNode == nil {
            return false
        }
        return leftTreeNode?.val == rightTreeNode?.val && isSame(leftTreeNode?.left, rightTreeNode?.right) && isSame(leftTreeNode?.right, rightTreeNode?.left)
    }
    
    
    //AB16 实现二叉树先序，中序和后序遍历
    //https://www.nowcoder.com/practice/a9fec6c46a684ad5a3abd4e365a9d362?tpId=308&tqId=1008937&ru=%2Fpractice%2Fd77d11405cc7470d82554cb392585106&qru=%2Fta%2Falgorithm-start%2Fquestion-ranking&sourceUrl=%2Fexam%2Foj%3Ftab%3D%25E7%25AE%2597%25E6%25B3%2595%25E7%25AF%2587%26topicId%3D308
    func threeOrders ( _ root: TreeNode?) -> [[Int]] {
        // write code here
        var r = [[Int]].init(repeating: [Int].init(repeating: 0, count: preorderTraversal(root).count), count: 0)
        r.append(preorderTraversal(root))
        r.append(middenTraversal(root))
        r.append(postorderTraversal(root))
        return r
    }
    
    //BM32 合并二叉树
    //https://www.nowcoder.com/practice/7298353c24cc42e3bd5f0e0bd3d1d759?tpId=295&tqId=1025038&ru=%2Fpractice%2Ff95dcdafbde44b22a6d741baf71653f6&qru=%2Fta%2Fformat-top101%2Fquestion-ranking&sourceUrl=%2Fexam%2Foj
    func mergeTrees ( _ t1: TreeNode?,  _ t2: TreeNode?) -> TreeNode? {
        // write code here
        if t1 == nil {
            return t2
        }
        if t2 == nil {
            return t1
        }
        return TreeNode(t1!.val+t2!.val, mergeTrees(t1?.left, t2?.left), mergeTrees(t1?.right, t2?.right))
    }
    
    //BM33 二叉树的镜像
    //https://www.nowcoder.com/practice/a9d0ecbacef9410ca97463e4a5c83be7?tpId=295&tqId=1374963&ru=%2Fpractice%2F7298353c24cc42e3bd5f0e0bd3d1d759&qru=%2Fta%2Fformat-top101%2Fquestion-ranking&sourceUrl=%2Fexam%2Foj
    func Mirror ( _ pRoot: TreeNode?) -> TreeNode? {
        // write code here
        if pRoot == nil {
            return nil
        }
        return TreeNode(pRoot!.val, Mirror(pRoot?.right), Mirror(pRoot?.left))
    }
    
    //BM34 判断是不是二叉搜索树
    //https://www.nowcoder.com/practice/a69242b39baf45dea217815c7dedb52b?tpId=295&tqId=2288088&ru=/exam/oj&qru=/ta/format-top101/question-ranking&sourceUrl=%2Fexam%2Foj
    var pre = Int.min
    func isValidBST ( _ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        if(!isValidBST(root?.left)) {
            return false
        }
        if root!.val <= pre {
            return false
        } else {
            pre = root!.val
        }
        return isValidBST(root?.right)
    }
    
    
    //BM27 按之字形顺序打印二叉树
    //https://www.nowcoder.com/practice/91b69814117f4e8097390d107d2efbe0?tpId=295&tqId=23454&ru=/exam/oj&qru=/ta/format-top101/question-ranking&sourceUrl=%2Fexam%2Foj
    //思路：把层序遍历的偶数层反转即可
    func Print ( _ pRoot: TreeNode?) -> [[Int]] {
        // write code here
        var res = [[Int]]()
        if pRoot == nil {
            return res
        }
        var queue = [pRoot!] //定义一个TreeNode队列，后续就操作这个队列
        var i = 1
        while !queue.isEmpty { //TreeNode不为空就遍历，queue中先有一个TreeNode就是root,第2次就两个，第3次4个,依次类推，同时res中一层层地输出
            let r = getNodes(queue)
            res.append((i%2 == 1) ? r.vals : rollbackArray(r.vals))
            queue = r.nodes
            i += 1
        }
        return res
    }
    
    func rollbackArray (_ array: [Int]) -> [Int] {
        if array.count == 0 || array.count == 1 {
            return array
        }
        var res: [Int] = [Int]()
        var temp = array
        while temp.count != 0 {
            res.append(temp.popLast()!)
        }
        return res
    }
    
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        return TreeNode(root!.val, invertTree(root!.right), invertTree(root!.left))
    }
}
