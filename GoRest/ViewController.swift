//
//  ViewController.swift
//  GoRest
//
//  Created by Rishu Gupta on 28/11/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.getCreateUser()
    }


}

extension ViewController: APIRequestHandler {
    
    func getUsers() {
        self.sendRequest(route: .users, UsersModel.self) { (result) in
            switch result {
            case .failure(let error):
                print("Error:", error.errorDescription ?? "")
            case .success(let data):
                print("Response:", data)
            }
        }
    }
    
    func getPosts() {
        self.sendRequest(route: .posts, PostsModel.self) { (result) in
            switch result {
            case .failure(let error):
                print("Error:", error.errorDescription ?? "")
            case .success(let data):
                print("Response:", data)
            }
        }
    }
    
    func getComments() {
        self.sendRequest(route: .comments, CommentsModel.self) { (result) in
            switch result {
            case .failure(let error):
                print("Error:", error.errorDescription ?? "")
            case .success(let data):
                print("Response:", data)
            }
        }
    }
    
    func getTodos() {
        self.sendRequest(route: .todos, TodosModel.self) { (result) in
            switch result {
            case .failure(let error):
                print("Error:", error.errorDescription ?? "")
            case .success(let data):
                print("Response:", data)
            }
        }
    }
    
    func getCategories() {
        self.sendRequest(route: .categories, CategoriesModel.self) { (result) in
            switch result {
            case .failure(let error):
                print("Error:", error.errorDescription ?? "")
            case .success(let data):
                print("Response:", data)
            }
        }
    }
    
    func getProducts() {
        self.sendRequest(route: .products, ProductsModel.self) { (result) in
            switch result {
            case .failure(let error):
                print("Error:", error.errorDescription ?? "")
            case .success(let data):
                print("Response:", data)
            }
        }
    }
    
    func getProductCategories() {
        self.sendRequest(route: .productCategories, ProductCategoriesModel.self) { (result) in
            switch result {
            case .failure(let error):
                print("Error:", error.errorDescription ?? "")
            case .success(let data):
                print("Response:", data)
            }
        }
    }
    
    func getCreateUser() {
        let userData = CreateUserRequest(name: "Tenali Raman", gender: "Male", email: "tenali.raman@15ce.com", status: "Active")
        //let userData = CreateUserRequest(name: nil, gender: nil, email: nil, status: nil)
        self.sendRequest(route: .createUser, CreateUserModel.self, userData) { (result) in
            switch result {
            case .failure(let error):
                print("Error:", error.errorDescription ?? "")
            case .success(let data):
                print("Response:", data)
            }
        }
    }
}
