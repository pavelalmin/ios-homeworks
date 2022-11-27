//
//  PostTableViewCell.swift
//  navigation
//
//  Created by Pavel Almin on 27.11.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    var post: DataSource? {
        didSet {
            guard let postItem = post else {return}
            if let author = postItem.author {
                authorPost.text = author
            }
            if let image = postItem.image {
                postImageView.image = UIImage(named: image)
            }
            if let description = postItem.description {
                descriptionPost.text = description
            }
            if let likes = postItem.likes {
                likesViewLabel.text = "Likes \(likes)"
            }
            if let views = postItem.views {
                viewsViewLabel.text = "Views \(views)"
            }
        }
    }

    private lazy var authorPost: UILabel = {
        let authorPost = UILabel()
        authorPost.translatesAutoresizingMaskIntoConstraints = false
        authorPost.font = .systemFont(ofSize: 20, weight: .bold)
        authorPost.textColor = .black
        authorPost.numberOfLines = 2
        return authorPost
    }()

    private lazy var postImageView: UIImageView = {
        let postImageView = UIImageView()
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        postImageView.contentMode = .scaleAspectFit
        postImageView.backgroundColor = .black
        return postImageView
    }()

    private lazy var descriptionPost: UILabel = {
        let descriptionPost = UILabel()
        descriptionPost.translatesAutoresizingMaskIntoConstraints = false
        descriptionPost.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descriptionPost.textColor = .systemGray
        descriptionPost.numberOfLines = 0
        return descriptionPost
    }()

    private lazy var likesViewLabel: UILabel = {
        let likesViewLabel = UILabel()
        likesViewLabel.translatesAutoresizingMaskIntoConstraints = false
        likesViewLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        likesViewLabel.textColor = .black
        likesViewLabel.numberOfLines = 1
        return likesViewLabel
    }()

    private lazy var viewsViewLabel: UILabel = {
        let viewsViewLabel = UILabel()
        viewsViewLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsViewLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        viewsViewLabel.textColor = .black
        viewsViewLabel.numberOfLines = 1
        return viewsViewLabel
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupContentView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupContentView() {
        self.contentView.addSubview(self.authorPost)
        self.contentView.addSubview(self.descriptionPost)
        self.contentView.addSubview(self.postImageView)
        self.contentView.addSubview(self.viewsViewLabel)
        self.contentView.addSubview(self.likesViewLabel)


        NSLayoutConstraint.activate([

            self.authorPost.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            self.authorPost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.authorPost.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.authorPost.bottomAnchor.constraint(equalTo: self.postImageView.topAnchor, constant: -8),

            self.postImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.postImageView.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor),
            self.postImageView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor),
            self.postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),

            self.descriptionPost.centerYAnchor.constraint(equalTo: self.descriptionPost.centerYAnchor),
            self.descriptionPost.topAnchor.constraint(equalTo: self.postImageView.bottomAnchor, constant: 16),
            self.descriptionPost.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.descriptionPost.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),

            self.likesViewLabel.topAnchor.constraint(equalTo: self.descriptionPost.bottomAnchor, constant: 16),
            self.likesViewLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.likesViewLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),

            self.viewsViewLabel.topAnchor.constraint(equalTo: self.descriptionPost.bottomAnchor, constant: 16),
            self.viewsViewLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.viewsViewLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16)
        ])
    }

}
