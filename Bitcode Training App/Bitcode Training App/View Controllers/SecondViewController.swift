//
//  SecondViewController.swift
//  Bitcode Training App
//
//  Created by Mac on 12/04/22.
//

import UIKit

class SecondViewController: UIViewController {
    // MARK: TextFields Outlets
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var technologyTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var phoneNoTF: UITextField!
    
    // MARK: Linking Protocol With VC2
    weak var delegateSVC : SecondDataPassProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Enter Student Details"
        
        navigationItem.hidesBackButton = true
    }
    
    // MARK: SaveButton Outlet
    func showSaveAlert(){
        let alert = UIAlertController(title: "SaveButtonTapped", message: "StudentDataSavedSucessfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "GoodToGo", style: .default, handler: {[weak self]action in
            guard let delegate = self?.delegateSVC
            else{
                print("delegate object has no value")
                return
            }
            let ndata = self?.nameTF.text
            let tdata = self?.technologyTF.text
            let adata = self?.ageTF.text
            let phdata = self?.phoneNoTF.text
            
            delegate.passData(name: ndata, technology: tdata, age: adata , phoneNo:  phdata)
            self?.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true)
    }
    func showDismissAlert(){
        let alert = UIAlertController(title: "SaveButtonTapped", message: "CompleteTheStudentDetails", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated:true)
    }
    
    @IBAction func saveButton(){
        let ndata = nameTF.text
        let tdata = technologyTF.text
        let adata = ageTF.text
        let phdata = phoneNoTF.text
        // MARK: Alerts
        if ((ndata !=  "") && (tdata != "") && (adata != "") && (phdata != "")) {
            showSaveAlert()
        }
        else{
            showDismissAlert()
        }
    }
    
}


