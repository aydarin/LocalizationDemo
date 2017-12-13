//
//  PluralsViewController.swift
//  LocalizationDemo
//
//  Created by Aydar Mukhametzyanov on 12/8/17.
//  Copyright © 2017 Aydar Mukhametzyanov. All rights reserved.
//

import UIKit

class PluralsViewController: UIViewController {
    
    private var count = 0 {
        didSet {
            updateTextLabel()
        }
    }
    
    @IBOutlet private weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTextLabel()
    }
    
    private func updateTextLabel() {
        let format = NSLocalizedString("days", comment: "")
        textLabel.text = String.localizedStringWithFormat(format, count)
    }
    
    // MARK: - Actions

    @IBAction private func minusPressed(_ sender: Any) {
        count -= 1
    }
    
    @IBAction private func plusPressed(_ sender: Any) {
        count += 1
    }
}
