//
//  Created by Pavel Sharanda on 17.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import Foundation


class Signal<T> {
    
    private var value: T?
    
    private var callbacks: [(T)->Void] = []
    
    var lastValue: T? {
        return value
    }

    func subscribe(_ callback: @escaping (T)->Void) {
        
        callbacks.append(callback)
        
        if let value = value {
            callback(value)
        }
    }
    
    func update(_ newValue: T) {
        value = newValue
        
        callbacks.forEach {
            $0(newValue)
        }
    }
}
