//
//  ViewController.swift
//  ReactorDemo
//
//  Created by Michael Castillo on 9/3/17.
//  Copyright © 2017 Michael Castillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    
    let core = App.sharedCore
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        core.add(subscriber: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        core.remove(subscriber: self)
    }
    
    @IBAction func upButtonPressed(_ sender: Any) {
        core.fire(event: IncrementCount())
    }
    @IBAction func downButtonPressed(_ sender: Any) {
        core.fire(event: DecrementCount())
    }
}

extension ViewController: Subscriber {
    
    func update(with state: AppState) {
        countLabel.text = String(state.count)
        view.backgroundColor = state.count % 2 == 0 ? .blue : .green
    }
    
}
