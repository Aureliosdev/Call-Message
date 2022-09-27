//
//  ProfleViewController.swift
//  Twitter UIKit
//
//  Created by Aurelio Le Clarke on 23.09.2022.
//

import UIKit

class ProfleViewController: UIViewController {

    private var isStatusBarHidden: Bool = true
    
    private let statusBar: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.opacity  = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    private let profileTableView: UITableView = {
        let table = UITableView()
        table.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Profile"
        view.addSubview(profileTableView)
        view.addSubview(statusBar)
        profileTableView.delegate = self
        profileTableView.dataSource = self
        configureConsts()
        let header = ProfileHeader(frame: CGRect(x:  0, y: 0, width: profileTableView.frame.width, height: 400))
        profileTableView.tableHeaderView  = header
        navigationController?.navigationBar.isHidden = true
        profileTableView.contentInsetAdjustmentBehavior = .never
    }
    
    private func configureConsts() {
        let profileTableViewConsts = [
            profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileTableView.topAnchor.constraint(equalTo: view.topAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ]
        
        let  statusBarConsts = [
            statusBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusBar.topAnchor.constraint(equalTo: view.topAnchor),
            statusBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusBar.heightAnchor.constraint(equalToConstant: view.bounds.height > 800 ? 40 : 20) //If height more than 800 specify statusbar
        
        
        ]
        NSLayoutConstraint.activate(profileTableViewConsts)
        NSLayoutConstraint.activate(statusBarConsts)
    
    }
    
    
    
}
extension ProfleViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier,for: indexPath) as? TweetTableViewCell else { return UITableViewCell()}
     
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yPos = scrollView.contentOffset.y
        
        if yPos > 150 && isStatusBarHidden {
            isStatusBarHidden = false
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear) { [ weak self] in
                self?.statusBar.layer.opacity = 1
            } completion: { _ in}

        }else if yPos < 0 && !isStatusBarHidden  {
            isStatusBarHidden = true
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear) { [ weak self] in
                self?.statusBar.layer.opacity = 0
            } completion: { _ in }
        }
    }
}
