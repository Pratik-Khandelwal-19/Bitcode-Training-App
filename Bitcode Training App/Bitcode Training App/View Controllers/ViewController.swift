//
//  ViewController.swift
//  Bitcode Training App
//
//  Created by Mac on 12/04/22.
//

import UIKit

class ViewController: UIViewController, SecondDataPassProtocol, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    // MARK : TableView Outlet
    @IBOutlet weak var bitcodeStudentList: UICollectionView!
    var nameArray: [String] = []
    var technologyArray: [String] = []
    var ageArray: [String] = []
    var phoneNoArray : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Welcome To Bitcode"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButton))
        bitcodeStudentList.dataSource = self
        bitcodeStudentList.delegate = self
    }
    
    // MARK: Outlet for VC1 to VC2
    @IBAction func addButton(){
        if let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController{
            secondVC.delegateSVC = self
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
        else{
            print("secondVC object has no value")
        }
    }
    
    // MARK : Create Empty Label Method
    private func showEmptyLAbel(){
        let rect = CGRect(x: 0, y:0, width: self.bitcodeStudentList.bounds.size.width, height: self.bitcodeStudentList.bounds.size.height)
        
        let noDataLabel : UILabel = UILabel(frame: rect)
        noDataLabel.text = "Click on '+' and Enroll Your Details for Admission "
        noDataLabel.textColor = UIColor.black
        noDataLabel.textAlignment = NSTextAlignment.center
        self.bitcodeStudentList.backgroundView = noDataLabel
    }
    
    //MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int{
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if nameArray.count > 0{
            self.bitcodeStudentList.backgroundView = nil
            return nameArray.count
        }
        showEmptyLAbel()
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.bitcodeStudentList.dequeueReusableCell(withReuseIdentifier:  "BitcodeStudentListCollectionViewCell", for: indexPath) as?  BitcodeStudentListCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.nameLabel.text = nameArray[indexPath.row]
        cell.technologyLabel.text = technologyArray[indexPath.row]
        cell.ageLabel.text = ageArray[indexPath.row]
        cell.phoneNoLabel.text = phoneNoArray[indexPath.row]
        return cell
    }
    
    //MARK: Data Passing from VC2 to VC1
    func passData(name: String?, technology: String?, age: String?, phoneNo: String?) {
        self.nameArray.append(name ?? "")
        self.technologyArray.append(technology ?? "")
        self.ageArray.append(age ?? "")
        self.phoneNoArray.append(phoneNo ?? "")
        bitcodeStudentList.reloadData()
    }
    
    //MARK : UICollectionView DelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize (width: 350, height: 250)
    }
}
