//
//  NotesFactory.swift
//  Test MVP2
//
//  Created by Nikita Shirobokov on 19.04.24.
//

import UIKit

protocol NotesFactory {
    func makeNotesRouter(navigationController: UINavigationController) -> NotesRouter
    func makeNotesViewController(router: NotesRouter) -> NotesViewController
    func makeAddNoteViewController() -> AddNoteViewController
    func makeNoteDetailViewController(note: Note) -> NoteDetailViewController
}

final class Factory: NotesFactory {
    func makeNotesRouter(navigationController: UINavigationController) -> NotesRouter {
        return NotesRouter()
    }

    func makeNotesViewController(router: NotesRouter) -> NotesViewController {
        let viewController = NotesViewController()
        let model = NotesModel()
        let presenter = NotesPresenter(view: viewController, model: model, router: router)
        viewController.presenter = presenter
        router.viewController = viewController
        return viewController
    }

    func makeAddNoteViewController() -> AddNoteViewController {
        return AddNoteViewController()
    }

    func makeNoteDetailViewController(note: Note) -> NoteDetailViewController {
        let viewController = NoteDetailViewController()
        viewController.note = note
        return viewController
    }
}
