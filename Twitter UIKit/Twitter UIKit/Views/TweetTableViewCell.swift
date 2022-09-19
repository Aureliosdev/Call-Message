//
//  TweetTableViewCell.swift
//  Twitter UIKit
//
//  Created by Aurelio Le Clarke on 20.09.2022.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    
    static let identifier = "TweetTableViewCell"
    
    
    private let avatarImageView: UIImageView = {
        let image  = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius  =  25
        image.layer.masksToBounds = true
        image.clipsToBounds =  true
        image.image = UIImage(systemName: "person")
        image.backgroundColor = .red
        return image
    }()
    
    
    private let displayNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Abylay iOS Dev"
        label.font = .systemFont(ofSize: 18, weight: .semibold )
        label.translatesAutoresizingMaskIntoConstraints = false
    
        return label
        
    }()
    
    private let userName: UILabel = {
        let label = UILabel()
        label.text = "@Aureliola"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16,weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private let tweetContentLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This is just an example of how article is shows. Don't bother yourself to understand it"
        label.numberOfLines = 0
        
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(displayNameLabel)
        contentView.addSubview(userName)
        contentView.addSubview(tweetContentLabel)
    
        configureConsts()
    }
    
    private func configureConsts() {
        let avatarImageViewConsts = [
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 14),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50)
        ]
        
        let displayNameConsts = [
            displayNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor,constant: 20),
            displayNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20)
        ]
        
        let userNameConsts = [
            userName.leadingAnchor.constraint(equalTo: displayNameLabel.trailingAnchor,constant: 10),
            userName.centerYAnchor.constraint(equalTo: displayNameLabel.centerYAnchor)
            
        ]
        
        let tweetLabelConsts = [
            tweetContentLabel.leadingAnchor.constraint(equalTo: displayNameLabel.leadingAnchor,constant: 10),
            tweetContentLabel.topAnchor.constraint(equalTo: displayNameLabel.bottomAnchor,constant: 10),
            tweetContentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -15),
            tweetContentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -15)
    
        ]
        
        NSLayoutConstraint.activate(avatarImageViewConsts)
        NSLayoutConstraint.activate(displayNameConsts)
        NSLayoutConstraint.activate(userNameConsts)
        NSLayoutConstraint.activate(tweetLabelConsts)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
