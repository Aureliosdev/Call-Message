//
//  TweetTableViewCell.swift
//  Twitter UIKit
//
//  Created by Aurelio Le Clarke on 20.09.2022.
//

import UIKit

protocol TweetTableViewCellDelegate: AnyObject {
    func tweetTableViewCellDidTapReply()
    func tweetTableViewCellDidTapReTweet()
    func tweetTableViewCellDidTapLike()
    func tweetTableViewCellDidTapShare()
    
}


class TweetTableViewCell: UITableViewCell {

    weak var delegate: TweetTableViewCellDelegate?
    
    static let identifier = "TweetTableViewCell"
    private let actionSpacing: CGFloat = 60
    
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
    
    private let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "bubble.left"), for: .normal)
        
        button.tintColor = .systemGray2
        
        return button
        
    }()

    private let reTweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.2.squarepath"), for: .normal)
        
        button.tintColor = .systemGray2
        
        return button
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        
        button.tintColor = .systemGray2
        
        return button
    }()
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemGray2
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(displayNameLabel)
        contentView.addSubview(userName)
        contentView.addSubview(tweetContentLabel)
        contentView.addSubview(likeButton)
        contentView.addSubview(shareButton)
        contentView.addSubview(reTweetButton)
        contentView.addSubview(replyButton)
        configureConsts()
        configureButtons()
    }
    @objc private func didTapReply() {
        delegate?.tweetTableViewCellDidTapReply()
    }
    @objc private func didTapreTweet() {
        delegate?.tweetTableViewCellDidTapReTweet()
    }
    
    @objc private func didTapLike() {
        delegate?.tweetTableViewCellDidTapLike()
    }
    
    @objc private func didTapShare() {
        delegate?.tweetTableViewCellDidTapShare()
    }
    
    private func configureButtons() {
        replyButton.addTarget(self, action: #selector(didTapReply), for: .touchUpInside)
        reTweetButton.addTarget(self, action: #selector(didTapreTweet), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)
      
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
             
        ]
        
        let replyButtonConsts = [
            replyButton.leadingAnchor.constraint(equalTo: tweetContentLabel.leadingAnchor),
            replyButton.topAnchor.constraint(equalTo: tweetContentLabel.bottomAnchor,constant: 10),
            replyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -15)
        
        ]
        
        let retweetButtonConsts = [
            reTweetButton.leadingAnchor.constraint(equalTo: replyButton.trailingAnchor,constant: actionSpacing),
            reTweetButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor),
             
        ]
        
        let likeButtonConsts = [
            likeButton.leadingAnchor.constraint(equalTo: reTweetButton.trailingAnchor,constant: actionSpacing),
            likeButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor),
            
        
        ]
        
        let shareButtonConsts = [
            shareButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor,constant: actionSpacing),
            shareButton.centerYAnchor.constraint(equalTo: replyButton.centerYAnchor),
        
        ]
        NSLayoutConstraint.activate(avatarImageViewConsts)
        NSLayoutConstraint.activate(displayNameConsts)
        NSLayoutConstraint.activate(userNameConsts)
        NSLayoutConstraint.activate(tweetLabelConsts)
        NSLayoutConstraint.activate(replyButtonConsts)
        NSLayoutConstraint.activate(likeButtonConsts)
        NSLayoutConstraint.activate(retweetButtonConsts)
        NSLayoutConstraint.activate(shareButtonConsts)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
