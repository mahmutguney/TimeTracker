//
//  TaskListView.swift
//  TimeTracker
//
//  Created by Mahmut Güney on 29.10.2021.
//

import SwiftUI
import CoreData

struct TaskListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TaskDetail.name, ascending: true)],
        animation: .default)
    private var tasks: FetchedResults<TaskDetail>
    
    
    var body: some View {
        
        List {
            ForEach(tasks) { task in
                Text(task.name ?? "")
            }
        }
        
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
