### 课程二：GCD死锁

```swift
- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_sync(dispatch_get_main_queue(), ^{

    });
}
```

![1653468198569](/Users/chenghao/Desktop/1653468198569.jpg)

源码中全局搜索__DISPATCH_WAIT_FOR_QUEUE__,

```c++
__DISPATCH_WAIT_FOR_QUEUE__(dispatch_sync_context_t dsc, dispatch_queue_t dq)
{
	uint64_t dq_state = _dispatch_wait_prepare(dq);
	if (unlikely(_dq_state_drain_locked_by(dq_state, dsc->dsc_waiter))) {
		DISPATCH_CLIENT_CRASH((uintptr_t)dq_state,
				"dispatch_sync called on queue"
				"already owned by current thread");
	}
```

```swift
//示例1:
dispatch_queue_t t = dispatch_queue_create(@"abc", DISPATCH_QUEUE_SERIAL);
dispatch_sync(t, ^{
  dispatch_sync(dispatch_get_main_queue(), ^{

  });
});
//示例2:
dispatch_queue_t t = dispatch_queue_create(@"abc", DISPATCH_QUEUE_SERIAL);
dispatch_async(t, ^{
  dispatch_sync(t, ^{

  });
});
```

以上两个示例都发生了死锁

结论：在当前线程(和当前队列相关的)同步的向串行队列里添加任务，就会死锁

### 函数

###### 同步函数：

立即执行，阻赛当前线程，不具备开辟子线程的能力

源码搜索dispatch_sync(dis，定位到同步函数源码

```c++
DISPATCH_NOINLINE
void
dispatch_sync(dispatch_queue_t dq, dispatch_block_t work)
{
	uintptr_t dc_flags = DC_FLAG_BLOCK;
	if (unlikely(_dispatch_block_has_private_data(work))) {
		return _dispatch_sync_block_with_privdata(dq, work, dc_flags);
	}
	_dispatch_sync_f(dq, work, _dispatch_Block_invoke(work), dc_flags);
}
#endif // __BLOCKS__
```



###### 异步函数：

可以开辟子线程，不会立即执行，不会阻塞当前线程

### 课程三：

### 单例

源码搜索dispatch_once(dis

```swift
dispatch_once(dispatch_once_t *val, dispatch_block_t block)
{
	dispatch_once_f(val, block, _dispatch_Block_invoke(block));
}
```

```swift
DISPATCH_NOINLINE
void
dispatch_once_f(dispatch_once_t *val, void *ctxt, dispatch_function_t func)
{
	dispatch_once_gate_t l = (dispatch_once_gate_t)val;

#if !DISPATCH_ONCE_INLINE_FASTPATH || DISPATCH_ONCE_USE_QUIESCENT_COUNTER
	uintptr_t v = os_atomic_load(&l->dgo_once, acquire);
	if (likely(v == DLOCK_ONCE_DONE)) {
		return;
	}
#if DISPATCH_ONCE_USE_QUIESCENT_COUNTER
	if (likely(DISPATCH_ONCE_IS_GEN(v))) {
		return _dispatch_once_mark_done_if_quiesced(l, v);
	}
#endif
#endif
	if (_dispatch_once_gate_tryenter(l)) {
		return _dispatch_once_callout(l, ctxt, func);
	}
	return _dispatch_once_wait(l);
}
```

