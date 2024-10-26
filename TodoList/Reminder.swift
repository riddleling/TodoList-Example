//
//  Reminder.swift
//  TodoList
//
//  Created by Riddle Ling on 2024/10/26.
//

import Foundation


struct Reminder: Identifiable{
    let id = UUID()
    var title: String
    var isCompleted = false
}


extension Reminder {
    static let samples = [
        Reminder(title: "Build sample app", isCompleted: true),
        Reminder(title: "Create tutorial"),
        Reminder(title: "???"),
        Reminder(title: "PROFIT!"),
    ]
}
