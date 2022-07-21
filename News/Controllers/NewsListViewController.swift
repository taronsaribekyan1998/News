//
//  NewsListViewController.swift
//  News
//
//  Created by Taron on 18.07.22.
//

import UIKit

final class NewsListViewController: UIViewController {
    
    private let searchController = UISearchController()
    
    private var news = News.dummy { didSet { tableView.reloadData() } }
    
    // MARK: Subviews
    
    @IBOutlet private var segmentedControl: UISegmentedControl!
    @IBOutlet private var tableView: UITableView! { didSet {
        tableView.delegate = self
        tableView.dataSource = self }
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Actions
    
    @IBAction func searchBarButtonTapped(_ sender: UIBarButtonItem) {
        navigationItem.searchController == nil ? createSearchController() : (navigationItem.searchController = nil)
    }
    
    // MARK: Methods
    //Method's being called when tapping search button
    private func createSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    // MARK: Navigation
    
    @IBSegueAction func showNewsDetailVC(_ coder: NSCoder, sender: Any?) -> NewsDetailViewController? {
        guard let cell = sender as? NewsTableViewCell, let indexPath = tableView.indexPath(for: cell) else { fatalError() }
        tableView.deselectRow(at: indexPath, animated: true)
        
        return NewsDetailViewController(article: news[indexPath.row], coder: coder)
    }
}

// MARK: SearchBar

extension NewsListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let search = searchController.searchBar.text, !search.isEmpty {
            news = News.dummy.filter { article in
                article.articleText.lowercased().contains(search.lowercased())
            }
        } else {
            news = News.dummy
        }
        resignFirstResponder()
    }
}

// MARK: TableView Delegate and DataSource Methods

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.reuseIdentifier, for: indexPath) as? NewsTableViewCell else { fatalError() }
        
        let article = news[indexPath.row]
        cell.populate(with: article)
        return cell
    }
}
