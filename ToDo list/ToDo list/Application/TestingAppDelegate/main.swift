//
//  main.swift
//  ToDo list
//
//  Created by Mikhail Ustyantsev on 31.08.2024.
//

import UIKit

let appDelegateClass: AnyClass = NSClassFromString("TestingAppDelegate") ?? AppDelegate.self
        UIApplicationMain(
            CommandLine.argc,
            CommandLine.unsafeArgv,
            nil,
            NSStringFromClass(appDelegateClass)
        )
