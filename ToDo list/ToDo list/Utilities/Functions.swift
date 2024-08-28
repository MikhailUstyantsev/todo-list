//
//  Functions.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 25.08.2024.
//

import Foundation

func afterDelay(_ seconds: Double, run: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: run)
}
