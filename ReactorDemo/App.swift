//
//  App.swift
//  ReactorDemo
//
//  Created by Michael Castillo on 9/3/17.
//  Copyright © 2017 Michael Castillo. All rights reserved.
//

import Foundation

enum App {
    static let sharedCore = Core(state: AppState(), middlewares: [LoggingMiddleware()])
}

struct AppState: State {
    
    var count = 0
    
    mutating func react(to event: Event) {
        switch event {
        case _ as IncrementCount:
            count += 1
        case _ as DecrementCount:
            count -= 1
        default:
            break
        }
    }
}

struct IncrementCount: Event { }

struct DecrementCount: Event { }
