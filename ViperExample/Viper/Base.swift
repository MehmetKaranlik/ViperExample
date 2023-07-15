//
//  Base.swift
//  ViperExample
//
//  Created by Mehmet  on 14.07.2023.
//

import Foundation
import UIKit

protocol PresenterProtocol {
    associatedtype I = InteractorProtocol
    associatedtype R = RouterProcotol
    associatedtype V = ViewProtocol
    var router : R? { get set }
    var interactor : I? { get set }
    var view : V? { get set }
}


protocol InteractorProtocol {
    associatedtype T : PresenterProtocol
    var presenter : T? { get set }
}


protocol RouterProcotol {
    var view : ViewProtocol? { get set }
    
    static func start() -> RouterProcotol
}


protocol ViewProtocol where Self : UIViewController {
    var presenter : (any PresenterProtocol) { get set }
}
