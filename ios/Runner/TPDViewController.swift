//
//  TPDViewController.swift
//  Runner
//
//  Created by 戴汝羽 on 2023/4/23.
//

import UIKit
import TPDirect

protocol TPDViewControllerDelegate: AnyObject {
    func getPrimeSuccess(prime: String)
    func getPrimeFail(errorMsg: String)
}

class TPDViewController: UIViewController {
    
    var tpdForm: TPDForm?
    var tpdCard: TPDCard?
    weak var delegate: TPDViewControllerDelegate?
    
    lazy var cardView = makeCardView()
    lazy var confirmButton = makeConfirmButton()
    lazy var resultTextView = makeResultTextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

extension TPDViewController {
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cardView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 260).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 80).isActive = true

        view.addSubview(confirmButton)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(resultTextView)
        resultTextView.translatesAutoresizingMaskIntoConstraints = false
        resultTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        resultTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        resultTextView.topAnchor.constraint(equalTo: confirmButton.bottomAnchor, constant: 10).isActive = true
        resultTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        
        setTPDForm(view: cardView)
    }
    
    private func setTPDForm(view: UIView) {
        guard let tpdForm = TPDForm.setup(withContainer: view) else { return }
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
        tpdCard?.onSuccessCallback({ [weak self] (prime, cardInfo, cardIdentifier, merchantReferenceInfo)  in
            let result = "Prime : \(prime!),\n card identifier : \(cardIdentifier!),\n merchantReferenceInfo : \(merchantReferenceInfo["affiliateCodes"]!),\nLastFour : \(cardInfo!.lastFour!),\n Bincode : \(cardInfo!.bincode!),\n Issuer : \(cardInfo!.issuer!),\n Issuer_zh_tw : \(cardInfo!.issuerZhTw),\n bank_id : \(cardInfo!.bankId),\n cardType : \(cardInfo!.cardType),\n funding : \(cardInfo!.cardType),\n country : \(cardInfo!.country!),\n countryCode : \(cardInfo!.countryCode!),\n level : \(cardInfo!.level!)"

            self?.delegate?.getPrimeSuccess(prime: prime!)

            DispatchQueue.main.async { [weak self] in
                self?.dismiss(animated: true)
            }
            
        }).onFailureCallback({ [weak self] (status, message) in
            let errorMsg = "status : \(status) , Message : \(message)"
            self?.delegate?.getPrimeFail(errorMsg: errorMsg)

            DispatchQueue.main.async { [weak self] in
                self?.dismiss(animated: true)
            }
        })
    }
    
    private func makeCardView() -> UIView {
        let view = UIView()
        return view
    }

    private func makeConfirmButton() -> UIButton {
        let button = UIButton()
        button.setTitle("確認", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(tapConfirmButton), for: .touchUpInside)
        return button
    }
    
    private func makeResultTextView() -> UITextView {
        let textView = UITextView()
        return textView
    }
    
    @objc private func tapConfirmButton() {
        tpdCard?.getPrime()
    }
}
