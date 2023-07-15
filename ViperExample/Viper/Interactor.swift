//
//  Interactor.swift
//  ViperExample
//
//  Created by Mehmet  on 14.07.2023.
//

import Foundation


protocol IUserInteractor : InteractorProtocol {
    func getUsers()
}


class UserInteractor : IUserInteractor {
    
    
    var presenter: UserPresenter?
    
    init() {
        getUsers()
    }
    
    func getUsers() {
        guard let url  = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { [self] data, _, error in
            guard data != nil, error == nil else {
                presenter?.interactorDidFetchUsers(with: .failure(error!))
                return }
            do {
                let entities = try JSONDecoder().decode([User].self, from: data!)
                presenter?.interactorDidFetchUsers(with: .success(entities))
            }catch {
                
            }
        }
    
        task.resume()
    }
}


