//
//  ViewController.swift
//  ex_5_PopoverVC
//
//  Created by Кох Александр Станиславович on 14.07.2023.
//

import UIKit

final class ViewController: UIViewController {

    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        button.frame = CGRect(x: view.bounds.midX - 50, y: 200, width: 100, height: 40)
        button.setTitle("Present", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.addTarget(self, action: #selector(showPopover(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc
    private func showPopover(_ sender: UIButton) {
        let popview = PopoverVc()
        
        popview.preferredContentSize = CGSize(width: 300, height: 280)
        popview.modalPresentationStyle = .popover
        popview.popoverPresentationController?.delegate = popview
        popview.popoverPresentationController?.permittedArrowDirections = .up
        popview.popoverPresentationController?.sourceView = button
        popview.popoverPresentationController?.sourceRect = sender.bounds
        
        present(popview, animated: false, completion: {
            popview.view.superview?.layer.cornerRadius = 4.0
        })
    }
}
