//
//  ViewController.swift
//  SelfSizeDemo
//
//  Created by Andrew on 2016/10/26.
//  Copyright © 2016年 Andrew. All rights reserved.
//

import UIKit

let screen_width = UIScreen.main.bounds.width
let screen_height = UIScreen.main.bounds.height

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView:UITableView!
    let artists = Artist.artistsFromBundle()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.addObserver(forName: UIContentSizeCategory.didChangeNotification, object: .none, queue: OperationQueue.main) { [weak self] _ in
            self?.tableView.reloadData()
        }
    }
    
    func initView() -> Void {
        let rect = CGRect(x: 0, y: 0, width: screen_width, height: screen_height)
        tableView = UITableView(frame: rect, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 140
    }
    
    
    
    //MARK: - UITableView dataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "cellId"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        
        if cell == nil{
            cell = ArtistCell(style: .default, reuseIdentifier: cellId)
        }
        
        let artist = artists[indexPath.row]
        (cell as! ArtistCell).setDataSource(artist: artist)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = artists[indexPath.row]
        let destination = DetailController()
        destination.selectedArtist = item
        
        self.navigationController?.pushViewController(destination, animated: true)
    }
    


}

