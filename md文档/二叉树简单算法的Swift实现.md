### 一、构造二叉树

```swift
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
```

### 二、遍历二叉树

#### 2.1、前序遍历（根-左-右）

```swift
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
```

#### 2.2、中序遍历（左-根-右）

```swift
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
```

#### 2.3、后序遍历（左-右-根）

```swift
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
```

#### 2.4、层序遍历（根结点逐层遍历）

```swift
func levelOrder ( _ root: TreeNode?) -> [[Int]] {
    // write code here
    var res = [[Int]]()
    if root == nil {
        return res
    }
    var queue = [root!] //定义一个TreeNode队列，后续就操作这个队列
    while !queue.isEmpty { 
      //TreeNode不为空就遍历，queue中先有一个TreeNode就是root,第2次就两个，第3次4个,依次类推，同时res中一层层地输出
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
```

``二叉树的遍历的顺序是相对于根结点来说的，根在前就是前序，根在中为中序，中在后为后序``

### 三、二叉树的特性判断

#### 3.1、求二叉树的最大深度

深度是指树的根节点到任一叶子节点路径上节点的数量，最大深度是所有叶子节点的深度的最大值。

```swift
func maxDepth ( _ root: TreeNode?) -> Int {
    // write code here
    if(root?.val == nil) {
        return 0
    }
    return 1 + max(maxDepth(root?.left),maxDepth(root?.right))
}
```

#### 3.2、二叉树中某一路径和是否有某一值

给定一个二叉树root和一个值 sum ，判断是否有从根节点到叶子节点的节点值之和等于 sum

简化为左右子树中和是否有sum-root.val值，然后递归解决

```swift
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
```

#### 3.3、二叉树是否是对称

即是左右子树是否对称

```swift
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
```

#### 3.4、合并二叉树

合并两个二叉树，都存在的结点，就将结点值加起来，否则空的位置就由另一个树的结点来代替

```swift
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
```

#### 3.5、二叉树的镜像

操作给定的二叉树，将其变换为源二叉树的镜像。

```swift
func Mirror ( _ pRoot: TreeNode?) -> TreeNode? {
    // write code here
    if pRoot == nil {
        return nil
    }
    return TreeNode(pRoot!.val, Mirror(pRoot?.right), Mirror(pRoot?.left))
}
```

### 四、总结

1. 二叉树的问题一般先考虑空，然后根结点的处理，再处理左右子树
2. 左右子树又分别是一个二叉树，所以二叉树的问题一般都是用递归处理
3. 二叉树问题用递归
4. 递归
5. 递归
6. 递归