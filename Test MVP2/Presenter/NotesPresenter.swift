//
//  NotesRouter.swift
//  Test MVP2
//
//  Created by Nikita Shirobokov on 18.04.24.
//

import UIKit

// Протокол для презентера
protocol NotesPresenterProtocol: AnyObject {
    func viewDidLoad()
    func addNoteTapped()
    func numberOfNotes() -> Int
    func noteTitle(at index: Int) -> String
    func addNote(_ note: Note)
    func note(at index: Int) -> Note
    func didSelectNote(at index: Int)
}

class NotesPresenter: NotesPresenterProtocol, NotesRouterDelegate {
    weak var view: NotesViewProtocol?
    var model: NotesModelProtocol
    var router: NotesRouterProtocol?
    private var notes: [Note] = []
    
    init(view: NotesViewProtocol, model: NotesModelProtocol, router: NotesRouterProtocol) {
        self.view = view
        self.model = model
        self.router = router
        self.router?.delegate = self  // Прямое назначение делегата
    }
    
    func viewDidLoad() {
        model.addNote(Note(title: "Inital Note 1", content: "Initial Content 1"))
        reloadData()
    }
    
    func reloadData() {
        notes = model.fetchNotes()
        view?.displayNotes()
    }
    
    func addNoteTapped() {
        router?.presentAddNoteScreen()
    }
    
    func numberOfNotes() -> Int {
        return notes.count
    }
    
    func noteTitle(at index: Int) -> String {
        guard index < notes.count else { return "" }
        return notes[index].title
    }
    
    func note(at index: Int) -> Note {
        guard index < notes.count else { return Note(title: "", content: "") }
        return notes[index]
    }
    
    func addNote(_ note: Note) {
        model.addNote(note)
        reloadData()
    }
    
    func didSelectNote(at index: Int) {
        let note = self.note(at: index)
        router?.presentNoteDetailScreen(note: note)
    }
    
    // Обработка событий от роутера
    func didAddNote(note: Note) {
        addNote(note)
    }
}
