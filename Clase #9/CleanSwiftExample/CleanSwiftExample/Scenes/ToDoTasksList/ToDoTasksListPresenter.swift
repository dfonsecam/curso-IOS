//
//  ToDoTasksListPresenter.swift
//  CleanSwiftExample
//
//  Created by Diego Fonseca Marín on 6/6/17.
//  Copyright (c) 2017 Diego Fonseca Marín. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol ToDoTasksListPresenterInput {
    func responseTestInformation(response: ToDoTasksList.TestInformation.Response)
    func responseDatasource(response: ToDoTasksList.DataSource.Response)
}

protocol ToDoTasksListPresenterOutput: class {
    func displayTestInformation(viewModel: ToDoTasksList.TestInformation.ViewModel)
    func displayDatasource(viewModel: ToDoTasksList.DataSource.ViewModel)
}

class ToDoTasksListPresenter: ToDoTasksListPresenterInput {
    weak var output: ToDoTasksListPresenterOutput!
    
    // MARK: Presentation logic
    
    func responseTestInformation(response: ToDoTasksList.TestInformation.Response) {
        let viewModel = ToDoTasksList.TestInformation.ViewModel(numberText: "\(response.number)")
        output.displayTestInformation(viewModel: viewModel)
    }
    
    func responseDatasource(response: ToDoTasksList.DataSource.Response) {
        let viewModel = ToDoTasksList.DataSource.ViewModel(tasks: response.tasks.map {
            ToDoTasksList.TaskModelCell(text: $0.text, counter: $0.counter)
        })
        output.displayDatasource(viewModel: viewModel)
    }
}
