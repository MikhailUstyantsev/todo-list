//
//  NSCoder + Ext.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 26.08.2024.
//

import Foundation

extension NSCoder {
    
    static func fatalErrorNotImplemented() -> Never {
        fatalError("init(coder:) has not been implemented")
    }
}
