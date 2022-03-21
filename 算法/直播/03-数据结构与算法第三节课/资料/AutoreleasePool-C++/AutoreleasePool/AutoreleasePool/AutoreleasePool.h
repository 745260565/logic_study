//
//  AutoreleasePool.h
//  AutoreleasePool
//
//  Created by ws on 2021/12/31.
//

#ifndef AutoreleasePool_h
#define AutoreleasePool_h


extern
void * _Nonnull
objc_autoreleasePoolPush(void);

extern
void
objc_autoreleasePoolPop(void * _Nonnull context);

extern id
objc_autorelease(id obj);
#endif /* AutoreleasePool_h */
