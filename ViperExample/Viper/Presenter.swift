//
//  Presenter.swift
//  ViperExample
//
//  Created by Mehmet  on 14.07.2023.
//

import Foundation

protocol IUserPresenter : PresenterProtocol {
    func interactorDidFetchUsers(with result: Result<[User], Error>)
}

class UserPresenter : IUserPresenter {
    var router: UserRouter?
    var interactor: (any IUserInteractor)?
    var view: IUserView?

    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
            
        case .success(let users):
            view?.update(with: users)
        case .failure(let error ):
            view?.update(with:error)
        }
    }
}
