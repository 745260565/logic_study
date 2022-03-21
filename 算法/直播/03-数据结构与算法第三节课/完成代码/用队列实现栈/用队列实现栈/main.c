//
//  main.c
//  用队列实现栈
//
//  Created by ws on 2022/3/3.
//

#include <stdio.h>
#include <stdlib.h>


typedef struct queue {
    int *data;
    //  头
    int head;
    // 实际使用大小， 尾
    int rear;
    // 容量大小
    int capacity;
}Queue;

Queue *queueCreate(int cpacity) {
    Queue *queue = malloc(sizeof(Queue));
    queue->data = (int *)malloc(cpacity * sizeof(int));
    queue->head = queue->rear = -1;
    queue->capacity = cpacity;
    return queue;
}

void enQueue(Queue *obj, int e) {
    if (obj->head == -1) {
        obj->head = 0;
    }
    // 超出限制从头开始
    obj->rear = (obj->rear + 1) % obj->capacity;
    obj->data[obj->rear] = e;
}

int deQueue(Queue *obj) {
    int a = obj->data[obj->head];
    if (obj->head == obj->rear) {
        obj->rear = -1;
        obj->head = -1;
        return a;
    }
    // 超出限制从头开始
    obj->head = (obj->head + 1) % obj->capacity;
    return a;
}


int queueEmpty(Queue *obj) {
    return obj->head == -1;
}

int queueGetHead(Queue *obj){
    if (queueEmpty(obj)) {
        return 0;
    }
    return obj->data[obj->head];
}

int queueGetRear(Queue *obj){
    if (queueEmpty(obj)) {
        return 0;
    }
    return obj->data[obj->rear];
}


// 将queue置空
void queueFree(Queue* obj) {
    free(obj->data);
}


typedef struct {
    Queue *queue1, *queue2;
}MyStack;


MyStack *myStackCreate(void) {
    MyStack *obj = (MyStack *)malloc(sizeof(MyStack));
    obj->queue1 = queueCreate(100);
    obj->queue2 = queueCreate(100);
    return obj;
}

void myStackPush(MyStack *obj, int x) {
    if (queueEmpty(obj->queue1)) {
        enQueue(obj->queue2, x);
    } else {
        enQueue(obj->queue1, x);
    }
}

int myStackPop(MyStack *obj) {
    if (queueEmpty(obj->queue1)) {
        // 只剩一个元素
        while (obj->queue2->head != obj->queue2->rear) {
            enQueue(obj->queue1, deQueue(obj->queue2));
        }
        return deQueue(obj->queue2);
    }
    // 只剩一个元素
    while (obj->queue1->head != obj->queue1->rear) {
        enQueue(obj->queue2, deQueue(obj->queue1));
    }
    return deQueue(obj->queue1);
}


int myStackTop(MyStack *obj) {
    if (queueEmpty(obj->queue1)) {
        return queueGetRear(obj->queue2);
    }
    return queueGetRear(obj->queue1);
}

int myStackEmpty(MyStack *obj) {
    return queueEmpty(obj->queue1) && queueEmpty(obj->queue2);
}

void myStackFree(MyStack *obj) {
    queueFree(obj->queue1);
    queueFree(obj->queue2);
}


int main(int argc, const char * argv[]) {
    
    MyStack *myStack = myStackCreate();
    myStackPush(myStack, 1);
    myStackPush(myStack, 2);
    int top = myStackTop(myStack); // 返回 2
    int pop = myStackPop(myStack); // 返回 2
    int empty = myStackEmpty(myStack); // 返回 0

    return 0;
}
