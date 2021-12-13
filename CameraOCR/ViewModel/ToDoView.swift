//
//  ToDoView.swift
//  CameraOCR
//
//  Created by Zisis Kostakakis on 28/01/2022.
//
//This is optinal function for taking picture and extracting the text in the form of a to do list
//if statement checking if ocr is triggered and text does not include email
//extract the tesk into a list
//foreach item in the list
//newItem.name = list[i]
//try viewContext.save()
import SwiftUI

struct ToDoView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @FocusState private var nameIsFocused: Bool
    @FetchRequest(fetchRequest: ToDoListItem.getAllToDoListItems())
    var items: FetchedResults<ToDoListItem>
    
    @State var text: String = ""
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("New Item")) {
                    HStack{
                        TextField("Enter New Item...", text: $text)
                            .focused($nameIsFocused)
                        Button(action: {
                            if !text.isEmpty {
                                let newItem = ToDoListItem(context: viewContext)
                                newItem.name = text
                                newItem.createAt = Date()
                                do {
                                    try viewContext.save()
                                } catch {
                                    print(error)
                                }
                                text = ""
                                nameIsFocused = false
                            }
                        },
                               label: {Text("Save")})
                    }
                }
                Section {
                    Text("These are your To Do List Items").font(.largeTitle.bold())
                    .onAppear{
                        let sentence = values.sentence
                        let lines = sentence.split(whereSeparator: \.isNewline)
                        if values.useToDo == true {
                            for lines in lines {
                                let temp = String(lines)
                                let newItem = ToDoListItem(context: viewContext)
                                newItem.name = temp
                                newItem.createAt = Date()
                                do {
                                    try viewContext.save()
                                } catch {
                                    print(error)
                                }
                            }
                            values.useToDo = false
                        }
                    }
                    ForEach(items) {toDoListItem in
                        VStack(alignment: .leading){
                            Text(toDoListItem.name!)
                                .font(.headline)
                            Text("\(toDoListItem.createAt!)")
                        }
                    }.onDelete(perform: {indexSet in
                        guard let index = indexSet.first else {
                            return
                        }
                        let itemToDelete = items[index]
                        viewContext.delete(itemToDelete)
                        do {
                            try viewContext.save()
                        } catch {
                            print(error)
                        }
                    })
                }
            }.navigationTitle("To Do List")
        }
    }
}
struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
