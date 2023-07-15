//
//  Router.swift
//  ViperExample
//
//  Created by Mehmet  on 14.07.2023.
//

import Foundation
import UIKit


class UserRouter : RouterProcotol {
    var view: ViewProtocol?
    
    static func start() -> RouterProcotol {
        let router = UserRouter()
     
        let view = UserViewController()
        let presenter  = UserPresenter()
        let interactor    = UserInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.view = view

        return router
    }
}
