//
//  NotesModel.swift
//  Test MVP2
//
//  Created by Nikita Shirobokov on 18.04.24.
//

import Foundation

struct Note {
    var title: String
    var content: String
}

protocol NotesModelProtocol {
    func fetchNotes() -> [Note]
    func addNote(_ note: Note)
}

class NotesModel: NotesModelProtocol {
    private var notes: [Note] = []

    func fetchNotes() -> [Note] {
        return notes
    }

    func addNote(_ note: Note) {
        notes.append(note)
    }
}
