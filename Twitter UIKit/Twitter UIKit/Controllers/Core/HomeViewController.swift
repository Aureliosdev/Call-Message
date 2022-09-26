//
//  HomeViewController.swift
//  Twitter UIKit
//
//  Created by Aurelio Le Clarke on 19.09.2022.
//

import UIKit


class HomeViewController: UIViewController {

    private func configureNavigationBar() {
        let size: CGFloat = 36
        let logo = UIImageView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        logo.image = UIImage(named: "logotwitter")
        logo.contentMode = .scaleAspectFill
        
        //расположение по центру в navigationbar
        let middleView  = UIView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        middleView.addSubview(logo)
        
        navigationItem.titleView = middleView
        
        let profileImage = UIImage(systemName: "person")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: profileImage, style: .plain, target: self, action: #selector(didTapProfile))
         
    }
    
    @objc private func didTapProfile() {
        let vc = ProfleViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
  
    
    
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
        configureNavigationBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        timelineTableView.frame = view.frame
    }

    let myarray = ["I like hamburgers.My favourite brands is Lotteria","Sometimes i listen Korean music.KPop is nice","I play and create app about Dota2.Thats my main focus","Russians send their people for war! Shame","Weather in Astana is 18 degrees below","Im tired from photoshop"]
   
    let namesArray = ["John","Steve","Mark","Tony Stark","Thor","Richard"]
    
    let picturesArray = [
        UIImage(named: "deposit"),
        UIImage(named: "pepsi"),
        UIImage(named: "superman"),
        UIImage(named: "flutter"),
        UIImage(named: "starbucks"),
        UIImage(named: "bts")
    ]
}
extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myarray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier,for: indexPath) as? TweetTableViewCell else { return UITableViewCell()}
          
        cell.delegate = self
        
        cell.configure(text: myarray[indexPath.row], displayNameLabels: namesArray[indexPath.row], avatarImage: picturesArray[indexPath.row] ?? UIImage())
       
            
            return cell
    }
  

    
    
    
}

extension HomeViewController: TweetTableViewCellDelegate {
    func tweetTableViewCellDidTapReply() {
        print("Reply")
    }
    
    func tweetTableViewCellDidTapReTweet() {
        print("reTweet")
    }
    
    func tweetTableViewCellDidTapLike() {
        print("Like")
    }
    
    func tweetTableViewCellDidTapShare() {
        print("Share")
    }
    
    
}
