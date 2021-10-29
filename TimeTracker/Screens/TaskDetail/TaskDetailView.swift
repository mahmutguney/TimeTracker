//
//  TaskDetailView.swift
//  TimeTracker
//
//  Created by Mahmut Güney on 30.10.2021.
//

import SwiftUI

struct TaskDetailView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.managedObjectContext) private var viewContext
    @State private var name: String = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                TextField("Name", text: $name).padding()
                Spacer()
            }.toolbar {
                Button("Save") {
                    addTask()
                    
                }
            }
        }
        .navigationTitle("New Task")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func addTask() {
        let newTask = TaskDetail(context: viewContext)
        newTask.name = name

        do {
            try viewContext.save()
            self.presentationMode.wrappedValue.dismiss()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView()
    }
}
