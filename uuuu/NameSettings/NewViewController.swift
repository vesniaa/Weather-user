//
//  NameSettingsViewController.swift
//  uuuu
//
//  Created by Евгения Аникина on 29.07.2022.
//

import UIKit

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var segmentControll: UISegmentedControl!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var segmentNon: UIView!
    @IBOutlet weak var segmentNew: UIView!
    
    
    @IBOutlet weak var collectionNew: UICollectionView!
    var flowLayout: UICollectionViewLayout!
    
    var nameSettings: [NewViewName] = []
    //1) empty array
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldDelegateConnect()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getNameSettings()
        self.setNameSettings()
    }
    
    private func getNameSettings() {
        self.nameSettings = DB.getNameSettings()
        self.collectionNew.reloadData()
        //set dannie v massiv
    }
    private func setNameSettings() {
        let name = NameSettings(name: "ff", id: "id33")
        DB.setNameSettings(name: name)
    }
    private func configureCollectionNew() {
        self.cv.backgroundColor = view.backgroundColor
        self.cv.delegate = self
        self.cv.dataSource = self
        self.cv.keyboardDismissMode = .onDrag
        self.cv.register(UINib(nibName: "CellViewController", bundle: nil), forCellWithReuseIdentifier: "CellViewController")
        flowLayout = self.cv.collectionViewLayout as? UICollectionViewFlowLayout
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        if nameTF.text?.count ?? 0 != 0 {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                let nameAttributes = ["custom: name": self.nameTF.text ?? ""]
                
                AWSMobileClient.default().updateNameAttributes(attributeMap: nameAttributes) { code, error in
                    if error != nil {
                        self.showErrorMessage(message: error?.localizedDescription ?? "")
                    } else {
                        name.updateInDB()
                    }
                }
       
                self.dismiss(animated: true)
                
            }
        } else {
            nameTF.backgroundColor = UIHelper.controllRedColor
        }
    }
    

    @IBAction func segmentButton(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.segmentNew.isHidden = false
            self.segmentNon.isHidden = true
        case 1:
            self.segmentNew.isHidden = true
            self.segmentNon.isHidden = false
        default:
            self.segmentNew.isHidden = false
            self.segmentNon.isHidden = true
            
        }
    }
    //подключение делегата текстового поля
     func textFieldDelegateConnect() {
         nameTF.delegate = self
    }
    //текстовое Поле Завершило Редактирование
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.outline(borderWidth: 1.0, borderColor: .gray)
        textField.round(radiusType: .textField)
    }
    //текстовое Поле Действительно Начало Редактироваться
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.outline(borderWidth: 1.0, borderColor: .white)
        textField.round(radiusType: .textField)
    }
    //текстовое Поле Должно Возвращать
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
//количество
extension NewViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameSettings.count
    }
    //ячейка /стиль
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell: CellViewController = collectionView.getCell(.nameSettings, indexPath)
            cell.outline(borderWidth: 1.0, borderColor: .gray)
            cell.round(radiusType: .defaultControll)
            cell.configure(nameSettings[indexPath.item])
        
        return cell
    }
    //размер
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.cv.frame.width) - 3, height: 65)
    }
    
}
