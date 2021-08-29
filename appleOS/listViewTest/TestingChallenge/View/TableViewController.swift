//
//  TableViewController.swift
//  TestingChallenge
//
//  Created by Christian Lobach on 23.11.18.
//  Copyright © 2018 Blinks Labs GmbH. All rights reserved.
//

import UIKit
import SafariServices

class TableViewController: UITableViewController {

    private let youtubeURL = URL(string: "https://www.youtube.com/watch?v=2jg33NUsCAg")!

    private let booksService = BooksService()

    private var books: [Book]? {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "YouTube", style: .plain, target: self, action: #selector(showVideo))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }

    @objc func showVideo() {

        let safariViewController = SFSafariViewController(url: youtubeURL)
        present(safariViewController, animated: true, completion: nil) 
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books?.count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as? BookCell,
            let book = books?[indexPath.row] else {
                fatalError()
        }

        cell.titleLabel?.text = book.name
        cell.authorLabel?.text = book.author
        cell.coverImageView?.setImage(from: book.coverImageUrl)

        return cell
    }

    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let book = books?[indexPath.row] else { return }

        let message = "You clicked on the \(book.name) book"

        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let alert = UIAlertController(title: "Notice", message: message, preferredStyle: .alert)
        alert.addAction(okAction)

        present(alert, animated: true, completion: nil)
    }

    // MARK: - Load Data

    @objc func loadData() {

        booksService.getAllBooks { [weak self] books in
            self?.books = books
            self?.refreshControl?.endRefreshing()
        }
    }

}
