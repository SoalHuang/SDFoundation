# SDFoundation

iOS基本库

### 结构
    |---- Core
    |       |---- SDExtensionBase.swift (基本拓展，类似作用域的作用)
    |       |---- Utils (工具类)
    |       |       |---- Global.swift (一些全局常量和方法)
    |       |       |---- Autoincrement.swift (自增数)
    |       |       |---- WeakBox.swift (弱引用盒子)
    |       |       |---- CancelablePerformBox.swift (和取消的perform盒子)
    |       |       |---- Resource.swift (资源定义)
    |       |       |---- Reachability.swift (网络状态)
    |       |       |---- Protector.swift (自动锁)
    |       |
    |       |---- Keychain (钥匙串)
    |
    |---- Inherit
    |       |---- Second.swift (时间转换)
    |       |---- SecondScheduler.swift (全局定时器)
    |       |---- PTByte.swift (字长度的表示)
    |
    |---- Extension
    |       |---- Foundation (Foundation的一些拓展)
    |       |---- CoreGraphics (CoreGraphics的一些拓展)
    |       |---- ObjectiveC (ObjectiveC的一些拓展)
    |       |---- Other (其他小众拓展)
