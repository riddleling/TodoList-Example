//
//  ReminderView.swift
//  TodoList
//
//  Created by Riddle Ling on 2024/10/26.
//

import SwiftUI

struct ReminderView: View {
    enum FocusableField: Hashable {
        case title
    }

    @FocusState private var focusedField: FocusableField?
    
    @State private var reminder = Reminder(title: "")
    
    @Environment(\.dismiss) private var dismiss
    
    var onCommit: (_ reminder: Reminder) -> Void
    
    private func commit() {
        onCommit(reminder)
        dismiss()
    }
    
    private func cancel() {
        dismiss()
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $reminder.title)
                    .focused($focusedField, equals: .title)
            }
            .navigationTitle("New Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: cancel) {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: commit) {
                        Text("Add")
                    }
                    .disabled(reminder.title.isEmpty)
                }
            }
            .onAppear {
                focusedField = .title
            }
        }
    }
}

#Preview {
    ReminderView { reminder in
        print("You added a new reminder titled \(reminder.title)")
    }
}
