//
//  NameCellCollectionViewCell.swift
//  uuuu
//
//  Created by Евгения Аникина on 29.07.2022.
//

import UIKit


class CellViewController: UICollectionViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override var isSelected: Bool {
        didSet{
            if self.isSelected {
                self.outline(borderWidth: 1.0, borderColor: .white)
            }
            else {
                self.outline(borderWidth: 1.0, borderColor: .gray)
            }
        }
    }
    func configure(_ title: NewViewName) {
        self.labelName.text = title.name
    }
}
