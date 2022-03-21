//
//  main.c
//  002--邻接表
//
//  Created by CC老师 on 2019/12/21.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#include "stdio.h"
#include "stdlib.h"

#include "math.h"
#include "time.h"


#define M 100
#define true 1
#define false 0

typedef char Element;
typedef int BOOL;
//邻接表的节点
typedef struct Node{
    int adj_vex_index;  //弧头的下标，也就是被指向的下标
    Element data;       //权重值
    struct Node * next; //边指针
}EdgeNode;

//顶点节点表
typedef struct vNode{
    Element data;          //顶点的权值
    EdgeNode * firstedge;  //顶点下一个是谁？
}VertexNode, Adjlist[M];

//总图的一些信息
typedef struct Graph{
    Adjlist adjlist;       //顶点表
    int arc_num;           //边的个数
    int node_num;          //节点个数
    BOOL is_directed;      //是不是有向图
}Graph, *GraphLink;

void creatGraph(GraphLink *g){
    int i,j,k;
    EdgeNode *p;
    
    //1. 顶点,边,是否有向
    printf("输入顶点数目,边数和有向？：\n");
    scanf("%d %d %d", &(*g)->node_num, &(*g)->arc_num, &(*g)->is_directed);
    
    //2.顶点表
     printf("输入顶点信息：\n");
    for (i = 0; i < (*g)->node_num; i++) {
        getchar();
        scanf("%c", &(*g)->adjlist[i].data);
        (*g)->adjlist[i].firstedge = NULL;
    }
    
    //3.
    printf("输入边信息：\n");
    for (k = 0; k < (*g)->arc_num; k++){
        getchar();
        scanf("%d %d", &i, &j);
        
        //①新建一个节点
        p = (EdgeNode *)malloc(sizeof(EdgeNode));
        //②弧头的下标
        p->adj_vex_index = j;
        //③头插法插进去，插的时候要找到弧尾，那就是顶点数组的下标i
        p->next = (*g)->adjlist[i].firstedge;
        //④将顶点数组[i].firstedge 设置为p
        (*g)->adjlist[i].firstedge = p;
        
        //j->i
        if(!(*g)->is_directed)
        {
            // j -----> i
            //①新建一个节点
            p = (EdgeNode *)malloc(sizeof(EdgeNode));
            //②弧头的下标i
            p->adj_vex_index = i;
            //③头插法插进去，插的时候要找到弧尾，那就是顶点数组的下标i
            p->next = (*g)->adjlist[j].firstedge;
            //④将顶点数组[i].firstedge 设置为p
            (*g)->adjlist[j].firstedge = p;
        }
    }
}

void putGraph(GraphLink g){
    int i;
    printf("邻接表中存储信息:\n");
    //遍历一遍顶点坐标，每个再进去走一次
    for (i = 0; i < g->node_num; i++) {
        EdgeNode * p = g->adjlist[i].firstedge;
        while (p) {
            printf("%c->%c ", g->adjlist[i].data, g->adjlist[p->adj_vex_index].data);
            p = p->next;
        }
        printf("\n");
    }
}

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("邻接表实现图的存储\n");
    /*
     邻接表实现图的存储
     输入顶点数目,边数和有向？：
     4 5 0
     输入顶点信息：
     0 1 2 3
     输入边信息：
     0 1 0 2 0 3 2 1 2 3
     邻接表中存储信息:
     0->3 0->2 0->1
     1->2 1->0
     2->3 2->1 2->0
     3->2 3->0
    */
    /*
     邻接表实现图的存储
     输入顶点数目,边数和有向？：
     4 5 1
     输入顶点信息：
     0 1 2 3
     输入边信息：
     1 0 1 2 2 1 2 0 0 3
     邻接表中存储信息:
     0->3
     1->2 1->0
     2->0 2->1
     */
    GraphLink g = (Graph *)malloc(sizeof(Graph));
    creatGraph(&g);
    putGraph(g);
    return 0;
}
