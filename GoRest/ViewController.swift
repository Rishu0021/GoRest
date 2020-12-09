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

        // Get Users list
        //self.getUsers()
        
        // Get Posts
        //self.getPosts()
        
        // Get Comments
        //self.getComments()
        
        // Get Todos
        //self.getTodos()
        
        // Get Categories
        //self.getCategories()
        
        // Get Products
        //self.getProducts()
        
        // Get Product Categories
        self.getProductCategories()
                
    }

    @IBAction func buttonHandlerCreateUser(_ sender: Any) {
        // Create new user (Post Request)
        self.createUser()
    }
    @IBAction func buttonHandlerUpdateUser(_ sender: Any) {
        // Update user (Put Request)
        self.updateUser()
    }
    @IBAction func buttonHandlerDeleteUser(_ sender: Any) {
        // Delete user (delete Request)
        self.deleteUser()
    }
    
}

//MARK:- API Calls
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
    
    func createUser() {
        let userData = UserRequest(name: "Arjun Reddy", gender: "Male", email: "arjun.reddy@15ce.com", status: "Active")
        //let userData = UserRequest(name: nil, gender: nil, email: nil, status: nil)
        self.sendRequest(route: .createUser, UserResponseModel.self, userData) { (result) in
            switch result {
            case .failure(let error):
                print("Error:", error.errorDescription ?? "")
            case .success(let data):
                if let userId = data.data?.id {
                    UserDefaults.standard.setValue(userId, forKey: "UserId")
                }
                print("Response:", data)
            }
        }
    }
    
    func updateUser() {
        guard let userId = UserDefaults.standard.string(forKey: "UserId") else { return }
        let userData = UserRequest(name: "Arjun Raman", email: "arjun.raman@15ce.com", status: "Active")
        self.sendRequest(route: .updateUser(userId), UserResponseModel.self, userData) { (result) in
            switch result {
            case .failure(let error):
                print("Error:", error.errorDescription ?? "")
            case .success(let data):
                print("Response:", data)
            }
        }
    }
    
    func deleteUser() {
        guard let userId = UserDefaults.standard.string(forKey: "UserId") else { return }
        self.sendRequest(route: .deleteUser(userId), UserResponseModel.self) { (result) in
            switch result {
            case .failure(let error):
                print("Error:", error.errorDescription ?? "")
            case .success(let data):
                if data.code == 204 {
                    UserDefaults.standard.removeObject(forKey: "UserId")
                    print("User has been deleted successfully")
                }
                print("Response:", data)
            }
        }
    }
}
