//
//  ToDoTasksListWorker.swift
//  CleanSwiftExample
//
//  Created by Diego Fonseca Marín on 6/6/17.
//  Copyright (c) 2017 Diego Fonseca Marín. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

class ToDoTasksListWorker{
    // MARK: Business Logic
    
    func multiply(number: String) -> Int {
        return Int(number)! * 2
    }
    
    func getDummiesTaks() -> [ToDoTasksList.Task] {
        let task1 = ToDoTasksList.Task(text: "Tarea 1", counter: 1)
        let task2 = ToDoTasksList.Task(text: "Tarea 2", counter: 2)
        let task3 = ToDoTasksList.Task(text: "Tarea 3", counter: 3)
        return [task1, task2, task3]
    }
}
