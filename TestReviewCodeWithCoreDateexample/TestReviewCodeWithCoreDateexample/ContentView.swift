//
//  ContentView.swift
//  TestReviewCodeWithCoreDateexample
//
//  Created by naeem alabboodi on 8/22/23.
//

import SwiftUI
import CoreData


class ContentViewViewModel: ObservableObject {
    
    @Published var result : [EntityFirstClass] = []
    
    var context : NSPersistentContainer = NSPersistentContainer(name: "PersistenceData")
    init() {
        context.loadPersistentStores { (descr, error) in
            
        }
    }
    func fetchData() {
        let request: NSFetchRequest<EntityFirstClass> = NSFetchRequest(entityName: "EntityFirstClass")
        do{
            result = try context.viewContext.fetch(request)
        }catch {
            
        }
    }
    func addNewItem(name: String ) {
        let newEntity = EntityFirstClass(context: context.viewContext)
        newEntity.name = name
        save()
    }
    func  save() {
        do {
            try context.viewContext.save()
        }catch {
            
        }
    }
}

struct ContentView: View {
    
    @StateObject private var vm = ContentViewViewModel()
    @State var textName = ""
    var body: some View {
        NavigationStack {
            
            TextField("enter name", text: $textName)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.blue, lineWidth: 2)
                    
                }
                .padding()
            VStack {
                List {
                    ForEach(vm.result,id:\.self) {item in
                        Text("\(item.name ?? "")")
                    }
                }
            }
            .padding()
            .toolbar {
                ToolbarItem {
                    Button("Add") {
                        guard !textName.isEmpty else {return}
                        vm.addNewItem(name: textName)
                        vm.fetchData()
                        textName = ""
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
