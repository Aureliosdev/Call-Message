//
//  HomeViewController.swift
//  Twitter UIKit
//
//  Created by Aurelio Le Clarke on 19.09.2022.
//

import UIKit

class HomeViewController: UIViewController {

    private let timelineTableView: UITableView = {
        let table = UITableView()
        table.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
        
        return table
        
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(timelineTableView)
        timelineTableView.delegate  = self
        timelineTableView.dataSource = self
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        timelineTableView.frame = view.frame
    }



}
extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier,for: indexPath) as? TweetTableViewCell else { return UITableViewCell()}
        
        
        
        return cell
    }
  
    
    
    
    
}
