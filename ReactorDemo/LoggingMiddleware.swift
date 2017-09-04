//
//  LoggingMiddleware.swift
//  ReactorDemo
//
//  Created by Michael Castillo on 9/3/17.
//  Copyright © 2017 Michael Castillo. All rights reserved.
//

import Foundation

struct LoggingMiddleware: Middleware {
    
    func process(event: Event, state: AppState) {
        switch event {
        case _ as IncrementCount:
            if state.count > 5 {
                print("BEAKFAST!")
            }
        default:
            break
        }
    }
}
