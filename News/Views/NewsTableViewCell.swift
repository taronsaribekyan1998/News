//
//  NewsTableViewCell.swift
//  News
//
//  Created by Taron on 19.07.22.
//

import UIKit

final class NewsTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "NewsCell"
    
    // MARK: Subviews
    
    @IBOutlet private var articleImageView: UIImageView!
    @IBOutlet private var sourceLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var articleLabel: UILabel!
    @IBOutlet private var viewsCountLabel: UILabel!
    @IBOutlet private var likesCountLabel: UILabel!
    @IBOutlet private var dislikesCountLabel: UILabel!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        articleImageView.layer.cornerRadius = 7
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Methods
    
    func populate(with article: News) {
        articleImageView.image = article.image
        sourceLabel.text = article.source
        dateLabel.text = article.publishDate
        articleLabel.text = article.articleText
        viewsCountLabel.text = article.viewsCount.roundedWithAbbreviations
        likesCountLabel.text = article.likesCount.roundedWithAbbreviations
        dislikesCountLabel.text = article.dislikesCount.roundedWithAbbreviations
    }
}
