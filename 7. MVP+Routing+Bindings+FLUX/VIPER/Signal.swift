//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import Foundation

class Signal<T> {
    
    private var _value: T?
    
    private var _callbacks: [(T)->Void] = []
    
    var lastValue: T? {
        return _value
    }

    func subscribe(_ callback: @escaping (T)->Void) {
        
        _callbacks.append(callback)
        
        if let value = _value {
            callback(value)
        }
    }
    
    func update(_ newValue: T) {
        _value = newValue
        
        _callbacks.forEach {
            $0(newValue)
        }
    }
}
