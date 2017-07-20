//
//  ToDoTasksListViewController.swift
//  CleanSwiftExample
//
//  Created by Diego Fonseca Marín on 6/6/17.
//  Copyright (c) 2017 Diego Fonseca Marín. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol ToDoTasksListViewControllerInput {
    func displayTestInformation(viewModel: ToDoTasksList.TestInformation.ViewModel)
    func displayDatasource(viewModel: ToDoTasksList.DataSource.ViewModel)
}

protocol ToDoTasksListViewControllerOutput {
    func requestTestInformation(request: ToDoTasksList.TestInformation.Request)
    func requestDatasource(request: ToDoTasksList.DataSource.Request)
}

class ToDoTasksListViewController: UIViewController, ToDoTasksListViewControllerInput {
    var output: ToDoTasksListViewControllerOutput!
    var router: ToDoTasksListRouter!
    
    var taskList: [ToDoTasksList.TaskModelCell]?
    
    @IBOutlet weak var tableView: UITableView!
    // MARK: Object lifecycle
    
    override func awakeFromNib(){
        super.awakeFromNib()
        ToDoTasksListConfigurator.sharedInstance.configure(viewController: self)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCustomCell(identifier: TodoTaskCustomCell.getIdentifier())
//        requestTestInformation(number: "5")
        requestDatasource()
    }
    
    // MARK: Event handling
    
    func requestTestInformation(number: String) {
        let request = ToDoTasksList.TestInformation.Request(numberText: number)
        output.requestTestInformation(request: request)
    }
    
    func requestDatasource() {
        let request = ToDoTasksList.DataSource.Request()
        output.requestDatasource(request: request)
    }
    
    // MARK: Display logic
    
    func displayTestInformation(viewModel: ToDoTasksList.TestInformation.ViewModel) {
        print("EL RESULTADO ES \(viewModel.numberText)")
    }
    
    func displayDatasource(viewModel: ToDoTasksList.DataSource.ViewModel) {
        taskList = viewModel.tasks
//        print("EL RESULTADO ES \(viewModel.tasks.count)")
    }
}


extension ToDoTasksListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tasks = taskList else {
            return 0
        }
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodoTaskCustomCell.getIdentifier()) as! TodoTaskCustomCell
        cell.setupCell(task: taskList![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}