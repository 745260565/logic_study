//
//  MxSynchronizedFixedQueue.h
//  MxCSSParserKit
//
//  Created by 016 on 2018/9/30.
//  Copyright © 2018 016. All rights reserved.
//



#import <mutex>
#import <deque>
//#include "MxThreadSafeRefCounted.h"
namespace MX
{
    template<typename T, size_t BufferSize>
//    class SynchronizedFixedQueue:public ThreadSafeRefCounted<SynchronizedFixedQueue<T, BufferSize>> {
    class SynchronizedFixedQueue {
    public:
        static std::shared_ptr<SynchronizedFixedQueue> create()
        {
            std::shared_ptr<SynchronizedFixedQueue> c = std::make_shared<SynchronizedFixedQueue>();
            return c;
        }
      
        void open()
        {
            std::lock_guard<std::mutex> lockHolder(m_mutex);
            if (m_open)
                return;
            
            // Restore the queue to its original state.
            m_open = true;
            m_queue.clear();
        }
        
        void close()
        {
            std::lock_guard<std::mutex> lockHolder(m_mutex);
            if (!m_open)
                return;
            
            // Wake all the sleeping threads up with a closing state.
            m_open = false;
            m_condition.notify_all();
        }
        
        bool isOpen()
        {
            std::lock_guard<std::mutex> lockHolder(m_mutex);
            return m_open;
        }
        
        bool enqueue(const T& value)
        {
            std::unique_lock<std::mutex> lockHolder(m_mutex);
            // Wait for an empty place to be available in the queue.
            m_condition.wait(lockHolder, [this]() { return !m_open || m_queue.size() < BufferSize; });
            
            // The queue is closing, exit immediately.
            if (!m_open)
                return false;
            
            // Add the item in the queue.
            m_queue.push_back(value);

            // Notify the other threads that an item was added to the queue.
            m_condition.notify_all();
            return true;
        }
        
        bool dequeue(T& value)
        {
            std::unique_lock<std::mutex> lockHolder(m_mutex);

            // Wait for an item to be added.
            m_condition.wait(lockHolder, [this]() { return !m_open || m_queue.size(); });
            
            // The queue is closing, exit immediately.
            if (!m_open)
                return false;
            
            // Get a copy from m_queue.first and then remove it.
            value = m_queue.front();
            m_queue.erase(m_queue.begin());

            // Notify the other threads that an item was removed from the queue.
            m_condition.notify_all();
            return true;
        }
        
    private:
        
        
        std::mutex m_mutex;
        std::condition_variable m_condition;
        
        bool m_open { true };
        std::deque<T> m_queue;
    };
}



