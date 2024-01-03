//
//  DetailController.swift
//  SelfSizeDemo
//
//  Created by Andrew on 2016/10/26.
//  Copyright © 2016年 Andrew. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    var selectedArtist: Artist!
    
    let moreInfoText = "Select For More Info >"
    
    var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedArtist.name
        
        initView()
       
    }
    func initView() -> Void {
        let rect = CGRect(x: 0, y: 0, width: screen_width, height: screen_height)
        tableView = UITableView(frame: rect, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
    }
    

}

extension DetailController:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedArtist.works.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil {
          cell = WorkCell(style: .default, reuseIdentifier: "Cell")
        }
        
        let work = selectedArtist.works[indexPath.row]
        
       (cell as! WorkCell).setDataSource(work: work)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard  let cell = tableView.cellForRow(at: indexPath) as? WorkCell else {
            return
        }
        var work = selectedArtist.works[indexPath.row]
        // 2
        work.isExpanded = !work.isExpanded
        selectedArtist.works[indexPath.row] = work
        
        // 3
        cell.moreInfoTextView.text = work.isExpanded ? work.info : moreInfoText
        cell.moreInfoTextView.textAlignment = work.isExpanded ? .left : .center
        
        // 4
        tableView.beginUpdates()
        tableView.endUpdates()
        
        // 5
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)

    }
    
}








