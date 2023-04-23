//
//  TPDViewController.swift
//  Runner
//
//  Created by 戴汝羽 on 2023/4/23.
//

import UIKit
import TPDirect

class TPDViewController: UIViewController {
    
    var tpdForm: TPDForm?
    var tpdCard: TPDCard?
    
    lazy var confirmButton = makeConfirmButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

extension TPDViewController {
    
    private func setupUI() {
        view.backgroundColor = .white
        setTPDForm()
        
        view.addSubview(confirmButton)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func setTPDForm() {
        guard let tpdForm = TPDForm.setup(withContainer: self.view) else { return }
        tpdForm.setErrorColor(UIColor.red)
        tpdForm.setOkColor(UIColor.green)
        tpdForm.setNormalColor(UIColor.black)
        tpdForm.onFormUpdated { (status) in
            if (status.isCanGetPrime()) {
                // Can make payment.
                print("isCanGetPrime")
            } else {
                // Can't make payment.
                print("isCan'tGetPrime")
            }
        }
        tpdForm.setIsUsedCcv(true)
        
        self.tpdCard = TPDCard.setup(tpdForm)
        tpdCard?.onSuccessCallback({ (prime, cardInfo, cardIdentifier, _)  in
            print("Prime : \(prime!), cardInfo : \(cardInfo), cardIdentifier : \(cardIdentifier)")
        }).onFailureCallback({ (status, message) in
            print("status : \(status) , Message : \(message)")
        })
    }
    
    private func makeConfirmButton() -> UIButton {
        let button = UIButton()
        button.setTitle("確認", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(tapConfirmButton), for: .touchUpInside)
        return button
    }
    
    @objc private func tapConfirmButton() {
        tpdCard?.getPrime()
    }
}
