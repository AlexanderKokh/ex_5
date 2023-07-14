//
//  PopoverVC.swift
//  ex_5_PopoverVC
//
//  Created by Кох Александр Станиславович on 14.07.2023.
//

import UIKit

final class PopoverVc: UIViewController {
    
    private lazy var switchControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["280pt", "150pt"])
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .close)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(close), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        close()
    }
    
    private func configure() {
        view.addSubview(switchControl)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            switchControl.heightAnchor.constraint(equalToConstant: 30),
            switchControl.widthAnchor.constraint(equalToConstant: 120),
            switchControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            switchControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.widthAnchor.constraint(equalToConstant: 30),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
    @objc
    private func switchValueChanged() {
        if switchControl.selectedSegmentIndex == 0 {
            preferredContentSize = CGSize(width: 300, height: 280)
        } else {
            preferredContentSize = CGSize(width: 300, height: 150)
        }
    }
    
    @objc
    private func close() {
        dismiss(animated: false, completion: nil)
    }
}

extension PopoverVc: UIPopoverPresentationControllerDelegate {

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        popoverPresentationController.containerView?.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    }
}
