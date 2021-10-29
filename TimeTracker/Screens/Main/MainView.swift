//
//  MainView.swift
//  TimeTracker
//
//  Created by Mahmut Güney on 29.10.2021.
//

import SwiftUI
import CoreData

struct MainView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State private var isShowSheet = false
    @State private var isShowAddButton = true
    @State private var selectedTab = 1
    
    var body: some View {
        
        NavigationView {
            TabView(selection: $selectedTab) {
                TaskListView().environment(\.managedObjectContext, viewContext)
                    .tabItem { Text("TaskList View") }.tag(1)
                TimerView()
                    .tabItem { Text("Timer View") }.tag(2)
                ReportsView()
                    .tabItem { Text("Reports View") }.tag(3)
            }.onChange(of: selectedTab, perform: { new in
                isShowAddButton = new == 1
            })
            .navigationBarTitle("Time Tracker")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if isShowAddButton {
                    Button("Add") {
                        isShowSheet.toggle()
                    }
                    .sheet(isPresented: $isShowSheet, onDismiss: {
                        
                    }) {
                        TaskDetailView()
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
