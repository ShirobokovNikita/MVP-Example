//
//  RootRouter.swift
//  Test MVP2
//
//  Created by Nikita Shirobokov on 19.04.24.
//

import UIKit

final class RootRouter {
    private weak var window: UIWindow?
    private let navigationController: UINavigationController
    private let factory: NotesFactory

    init(window: UIWindow, navigationController: UINavigationController, factory: NotesFactory) {
        self.window = window
        self.navigationController = navigationController
        self.factory = factory
    }

    func start() {
        let router = factory.makeNotesRouter(navigationController: navigationController)
        let notesVC = factory.makeNotesViewController(router: router)
        navigationController.viewControllers = [notesVC]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
