//
//  WorkCell.swift
//  SelfSizeDemo
//
//  Created by Andrew on 2016/10/26.
//  Copyright © 2016年 Andrew. All rights reserved.
//

import UIKit
import SnapKit

let moreInfoText = "Select For More Info >"

class WorkCell: UITableViewCell {
    
    var workImageView: UIImageView!
    var workTitleLabel: UILabel!
    var moreInfoTextView: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        workImageView = UIImageView()
        self.addSubview(workImageView)
        
        workImageView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(10)
        }
        
        workTitleLabel = UILabel()
        self.addSubview(workTitleLabel)
        
        workTitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(workImageView.snp.bottom).offset(15)
            make.right.equalTo(-10)
            make.height.equalTo(30)
        }
        
        moreInfoTextView = UILabel()
        moreInfoTextView.numberOfLines = 0
        moreInfoTextView.lineBreakMode = .byCharWrapping
        self.addSubview(moreInfoTextView)
        
        moreInfoTextView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(workTitleLabel.snp.bottom).offset(10)
            make.bottom.equalTo(-10)
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

    }
    
    func setDataSource(work:Work) -> Void {
        workTitleLabel.text = work.title
        workImageView.image = work.image
        
        workTitleLabel.backgroundColor = UIColor(white: 204/255, alpha: 1)
        workTitleLabel.textAlignment = .center
        
        moreInfoTextView.textColor = UIColor.red
        selectionStyle = .none
        
        moreInfoTextView.text = work.isExpanded ? work.info : moreInfoText
        moreInfoTextView.textAlignment = work.isExpanded ? .left : .center
    }

}
