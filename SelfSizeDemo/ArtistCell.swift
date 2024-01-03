//
//  ArtistCell.swift
//  SelfSizeDemo
//
//  Created by Andrew on 2016/10/26.
//  Copyright © 2016年 Andrew. All rights reserved.
//

import UIKit
import SnapKit

class ArtistCell: UITableViewCell {
    
      var bioLabel: UILabel!
      var nameLabel: UILabel!
      var artistImageView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        artistImageView = UIImageView()
        self.addSubview(artistImageView)
        
        artistImageView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(10)
            make.bottom.equalTo(-50)
            make.width.equalTo(180)
        }
        
        nameLabel = UILabel()
        nameLabel.backgroundColor = UIColor.orange
        self.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(artistImageView.snp.left)
            make.top.equalTo(artistImageView.snp.bottom).offset(10)
            make.width.equalTo(artistImageView.snp.width)
            make.height.equalTo(20)
        }
        
        bioLabel = UILabel()
        bioLabel.backgroundColor = UIColor.yellow
        bioLabel.lineBreakMode = .byCharWrapping
        bioLabel.numberOfLines = 0
        self.addSubview(bioLabel)
        
        bioLabel.snp.makeConstraints { (make) in
            make.left.equalTo(artistImageView.snp.right).offset(5)
            make.top.equalTo(artistImageView.snp.top)
            make.bottom.equalTo(-10)
            make.right.equalTo(-10)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDataSource(artist:Artist) -> Void {
        bioLabel.text = artist.bio
        artistImageView.image = artist.image
        nameLabel.text = artist.name
        
        bioLabel.textColor = UIColor(white: 114/255, alpha: 1)
        nameLabel.backgroundColor = UIColor(red: 1, green: 152/255, blue: 0, alpha: 1)
        nameLabel.textColor = UIColor.white
        nameLabel.textAlignment = .center
        selectionStyle = .none
        
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        bioLabel.font = UIFont.preferredFont(forTextStyle: .body)

    }

}
