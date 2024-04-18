//
//  NotesAssembly.swift
//  Test MVP2
//
//  Created by Nikita Shirobokov on 18.04.24.
//

import UIKit

final class ModuleBuilder {
    func createNotesModule() -> UIViewController {
        let view = NotesViewController()
        let model = NotesModel()
        let router = NotesRouter()
        let presenter = NotesPresenter(view: view, model: model, router: router)
        view.presenter = presenter
        router.viewController = view
        return view
    }
}
