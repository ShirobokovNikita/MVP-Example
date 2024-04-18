//
//  NotesRouter.swift
//  Test MVP2
//
//  Created by Nikita Shirobokov on 18.04.24.
//

import UIKit

protocol NotesRouterDelegate: AnyObject {
    func didAddNote(note: Note)
    func didShowNoteDetail()
}

class NotesRouter: NotesRouterProtocol {
    weak var viewController: UIViewController?
    weak var delegate: NotesRouterDelegate?
    
    func presentAddNoteScreen() {
        let addNoteVC = AddNoteViewController()
        addNoteVC.saveNoteClosure = { [weak self] note in
            self?.delegate?.didAddNote(note: note)
        }
        viewController?.navigationController?.pushViewController(addNoteVC, animated: true)
    }
    
    func presentNoteDetailScreen(note: Note) {
        let detailVC = NoteDetailViewController()
        detailVC.note = note
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
