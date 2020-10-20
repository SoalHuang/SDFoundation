//
//  NSObject+Notification.swift
//  SDFoundation
//
//  Created by SoalHunag on 2018/4/26.
//  Copyright © 2018年 SoalHuang. All rights reserved.
//

import Foundation

public extension SDExtension where T: NSObject {
    
    @discardableResult
    func addNotification(name: NSNotification.Name?, object anObject: Any?, _ closure: @escaping (Notification) -> Void) -> SDExtension {
        var temp: [ObserverNotificationTarget] = base.kit_notificationTargets ?? []
        let target = ObserverNotificationTarget(name: name, object: anObject) {
            closure($0)
        }
        temp.append(target)
        base.kit_notificationTargets = temp
        return self
    }
    
    @discardableResult
    func removeNotification() -> SDExtension {
        base.kit_notificationTargets?.forEach({ $0.dispose() })
        base.kit_notificationTargets?.removeAll()
        return self
    }
    
    @discardableResult
    func removeNotification(name: NSNotification.Name?) -> SDExtension {
        base.kit_notificationTargets?.filter({ $0.name == name || $0.callback == nil }).forEach({ $0.dispose() })
        base.kit_notificationTargets = base.kit_notificationTargets?.filter({ $0.name != name && $0.callback != nil })
        return self
    }
}

fileprivate extension NSObject {
    
    var kit_notificationTargets: [ObserverNotificationTarget]? {
        get { return sd.binded(for: &ObserverNotificationTarget.targetKey) }
        set { sd.bind(object: newValue, for: &ObserverNotificationTarget.targetKey, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
}

final fileprivate class ObserverNotificationTarget: NSObject {
    
    fileprivate static var targetKey: String = "observer.notification.target.key"
    
    let selector: Selector = #selector(ObserverNotificationTarget.eventHandler(_:))
    let name: Notification.Name?
    var object: Any?
    var callback: ((Notification) -> Void)?
    
    fileprivate init(name: Notification.Name?, object: Any?, callback: ((Notification) -> Void)?) {
        self.name = name
        self.object = object
        self.callback = callback
        super.init()
        NotificationCenter.default.addObserver(self, selector: selector, name: name, object: object)
    }
    
    @objc private func eventHandler(_ notification: Notification) {
        callback?(notification)
    }
    
    fileprivate func dispose() {
        NotificationCenter.default.removeObserver(self, name: name, object: object)
        self.callback = nil
    }
}

public extension SDExtension where T == NotificationCenter {
    
    func addObserver(_ observer: Any,
                     selector aSelector: Selector,
                     name aName: NSNotification.Name?,
                     object anObject: Any? = nil) {
        base.addObserver(observer, selector: aSelector, name: aName, object: anObject)
    }
    
    func removeObserver(_ observer: Any?) {
        if let obs = observer { base.removeObserver(obs) }
    }
    
    func removeObserver(_ observer: Any,
                        name aName: NSNotification.Name?,
                        object anObject: Any? = nil) {
        base.removeObserver(observer, name: aName, object: anObject)
    }
    
    func post(queue: DispatchQueue,
              _ notification: Notification) {
        queue.async { [weak base] in base?.post(notification) }
    }
    
    func post(queue: DispatchQueue,
              name aName: NSNotification.Name,
              object anObject: Any? = nil) {
        queue.async { [weak base] in base?.post(name: aName, object: anObject) }
    }
    
    func post(queue: DispatchQueue,
              name aName: NSNotification.Name,
              object anObject: Any? = nil,
              userInfo aUserInfo: [AnyHashable : Any]? = nil) {
        queue.async { [weak base] in base?.post(name: aName, object: anObject, userInfo: aUserInfo) }
    }
    
    @available(iOS 4.0, *)
    @discardableResult
    func addObserver(forName name: NSNotification.Name?,
                     object obj: Any? = nil,
                     queue: OperationQueue? = .main,
                     using block: @escaping (Notification) -> Void) -> NSObjectProtocol {
        return base.addObserver(forName: name, object: obj, queue: queue, using: block)
    }
}
