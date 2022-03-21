//
//  main.c
//  用栈实现队列
//
//  Created by ws on 2022/3/3.
//

#include <stdio.h>
#include <stdlib.h>

typedef struct {
    // 数组
    int *next;
    // 实际使用大小
    int size;
    // 容量大小
    int capacity;
} Stack;


// 构建一个空栈
Stack* stackCreate(int cpacity) {
    Stack *stk = malloc(sizeof(Stack));
    stk->next = malloc(sizeof(int) * cpacity);
    stk->size = 0;
    stk->capacity = cpacity;
    return stk;
}

// 插入元素为新栈顶元素
void stackPush(Stack* obj, int x) {
    obj->size = obj->size % obj->capacity;
    obj->next[obj->size] = x;
    obj->size++;
}

// 删除栈顶元素
void stackPop(Stack* obj) {
    obj->size--;
}

// 获取栈顶
int stackTop(Stack* obj) {
    return obj->next[obj->size - 1];
}

// 判断顺序栈是否为空;
int stackEmpty(Stack* obj) {
    return obj->size == 0;
}

// 将栈置空
void stackFree(Stack* obj) {
    free(obj->next);
}

typedef struct {
    // push
    Stack* pushStack;
    // pop
    Stack* popStack;
} MyQueue;


MyQueue* myQueueCreate(void) {
    MyQueue* queue = malloc(sizeof(MyQueue));
    queue->pushStack = stackCreate(100);
    queue->popStack = stackCreate(100);
    return queue;
}

void pushStackToPopStack(MyQueue* obj) {
    while (!stackEmpty(obj->pushStack)) {
        stackPush(obj->popStack, stackTop(obj->pushStack));
        stackPop(obj->pushStack);
    }
}

// 将元素 x 推到队列的末尾
void myQueuePush(MyQueue* obj, int x) {
    stackPush(obj->pushStack, x);
}

// 从队列的开头移除并返回元素
int myQueuePop(MyQueue* obj) {
    if (stackEmpty(obj->popStack)) {
        pushStackToPopStack(obj);
    }
    int x = stackTop(obj->popStack);
    stackPop(obj->popStack);
    return x;
}

// 返回队列开头的元素
int myQueuePeek(MyQueue* obj) {
    if (stackEmpty(obj->popStack)) {
        pushStackToPopStack(obj);
    }
    return stackTop(obj->popStack);
}

int myQueueEmpty(MyQueue* obj) {
    return stackEmpty(obj->pushStack) && stackEmpty(obj->popStack);
}

void myQueueFree(MyQueue* obj) {
    stackFree(obj->pushStack);
    stackFree(obj->popStack);
}



int main(int argc, const char * argv[]) {
    
    MyQueue *myQueue = myQueueCreate();
    myQueuePush(myQueue, 1); // queue is: [1]
    myQueuePush(myQueue, 2); // queue is: [1, 2] (leftmost is front of the queue)
    int peek = myQueuePeek(myQueue); // return 1
    int pop = myQueuePop(myQueue); // return 1, queue is [2]
    int peek2 = myQueuePeek(myQueue);
    int empty = myQueueEmpty(myQueue); // return false

    
    return 0;
}
