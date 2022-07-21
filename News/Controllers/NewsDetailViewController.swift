//
//  NewsDetailViewController.swift
//  News
//
//  Created by Taron on 19.07.22.
//

import UIKit
import SafariServices

final class NewsDetailViewController: UIViewController {
    
    let article: News
    
    init?(article: News, coder: NSCoder) {
        self.article = article
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Subviews
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var viewsCountLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var articleTitleLabel: UILabel!
    @IBOutlet private var articleTextLabel: UILabel!
    @IBOutlet private var sourceLabel: UILabel!
    @IBOutlet private var moreButton: UIButton! { didSet { configureMoreButton() }}
    @IBOutlet private var likesCountLabel: UILabel!
    @IBOutlet private var dislikesCountLabel: UILabel!
    @IBOutlet private var tagsCollectionView: UICollectionView! { didSet {
        viewDidLayoutSubviews()
        tagsCollectionView.layer.cornerRadius = 8
        tagsCollectionView.delegate = self
        tagsCollectionView.dataSource = self }
    }
    @IBOutlet private var collectionViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: Lifecycle
    
    // set dynamic height for tagsCollectionView
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionViewHeightConstraint.constant = tagsCollectionView.collectionViewLayout.collectionViewContentSize.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: Actions
    
    // Opens Safari and shows the source page of an article
    @IBAction func moreButtonTapped() {
        guard let url = URL(string: article.sourceURL) else { return }
        let safariVC = SFSafariViewController(url: url)
        safariVC.modalPresentationStyle = .pageSheet
        present(safariVC, animated: true)
    }
    
    // MARK: Methods
    
    private func updateUI() {
        imageView.image = article.image
        viewsCountLabel.text = article.viewsCount.roundedWithAbbreviations
        dateLabel.text = article.publishDate
        articleTitleLabel.text = article.articleTitle
        articleTextLabel.text = article.articleText
        sourceLabel.text = article.source
        likesCountLabel.text = article.likesCount.roundedWithAbbreviations
        dislikesCountLabel.text = article.dislikesCount.roundedWithAbbreviations
    }
    
    private func configureMoreButton() {
        moreButton.layer.borderWidth = 1
        moreButton.layer.borderColor = UIColor(red: 0.118, green: 0.596, blue: 0.608, alpha: 1).cgColor
        moreButton.layer.cornerRadius = 7
    }
}

// MARK: CollectionView Delegate and DataSource Methods

extension NewsDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        article.tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = tagsCollectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionVIewCell.reuseIdentifier, for: indexPath) as? TagCollectionVIewCell else { fatalError() }
        
        cell.tagLabel.text = article.tags[indexPath.row]
        return cell
    }
}
