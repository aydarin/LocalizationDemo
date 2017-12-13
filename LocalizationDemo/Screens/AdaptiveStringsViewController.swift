//
//  AdaptiveStringsViewController.swift
//  LocalizationDemo
//
//  Created by Aydar Mukhametzyanov on 12/8/17.
//  Copyright © 2017 Aydar Mukhametzyanov. All rights reserved.
//

import UIKit

class AdaptiveStringsViewController: UIViewController {

    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var mLabel: UILabel!
    @IBOutlet private weak var labelWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet private weak var widthSlider: UISlider!
    @IBOutlet private weak var fontSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = NSLocalizedString("gdp", comment: "")
        
        updateLabel()
        setupMString()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        updateLabel()
    }
    
    private func setupMString() {
        let systemFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        
        let mString = "MMMMMMMMMM"
        let blackString = NSAttributedString(string: mString, attributes: [.foregroundColor : UIColor.black,
                                                                           NSAttributedStringKey.font: systemFont])
        let grayString = NSAttributedString(string: mString, attributes: [.foregroundColor : UIColor.lightGray,
                                                                          NSAttributedStringKey.font: systemFont])
        
        let coloredString = NSMutableAttributedString(attributedString: blackString)
        coloredString.append(grayString)
        
        for _ in 0..<4 {
            coloredString.append(coloredString)
        }
        
        mLabel.attributedText = coloredString
    }
    
    private func updateLabel() {
        labelWidthConstraint.constant = view.frame.width * CGFloat(widthSlider.value)
        textLabel.font = textLabel.font.withSize(CGFloat(fontSlider.value * 100))
    }
    
    // MARK: - Actions

    @IBAction private func widthSliderValueChanged(_ sender: Any) {
        updateLabel()
    }
    
    @IBAction private func fontSliderValueChanged(_ sender: Any) {
        updateLabel()
    }
}
