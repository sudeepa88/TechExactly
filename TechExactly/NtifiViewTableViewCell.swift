//
//  NtifiViewTableViewCell.swift
//  TechExactly
//
//  Created by Sudeepa Pal on 25/10/24.
//

import UIKit

class NtifiViewTableViewCell: UITableViewCell {
    
    let profileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.crop.circle.fill")
        image.tintColor = #colorLiteral(red: 0.1490196078, green: 0.6, blue: 0.9843137255, alpha: 1)
        //image.backgroundColor = #colorLiteral(red: 0.1760970056, green: 0.5901255608, blue: 0.8185432553, alpha: 1)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let notLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.text = "Notification Title"
        lbl.textColor = #colorLiteral(red: 0.1490196078, green: 0.6, blue: 0.9843137255, alpha: 1)
        return lbl
        
    }()
    
    let dateLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 12)
        lbl.text = "21 March"
        lbl.textColor = #colorLiteral(red: 0.1490196078, green: 0.6, blue: 0.9843137255, alpha: 1)
        return lbl
        
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setConsts() {
        contentView.addSubview(profileImage)
        contentView.addSubview(notLbl)
        contentView.addSubview(dateLbl)
        
        
        NSLayoutConstraint.activate([
            profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            profileImage.heightAnchor.constraint(equalToConstant: 50),
            profileImage.widthAnchor.constraint(equalToConstant: 50),
            profileImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            notLbl.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10),
            notLbl.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 5),
           // notLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            notLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            dateLbl.topAnchor.constraint(equalTo: notLbl.bottomAnchor, constant: 3),
            dateLbl.leadingAnchor.constraint(equalTo: notLbl.leadingAnchor),
            
        ])
    }
    
}
