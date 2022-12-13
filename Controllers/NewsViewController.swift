//
//  NewsViewController.swift
//  Newsticker
//
//  Created by Stefan Schreiber on 13.12.22.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var newsTableView: UITableView!
    var articles: [Article]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.dataSource = self
        articles = [Article(title: "Artikel 1"), Article(title: "Article 2")]

      
    }
}

// Mark: Datasource
extension NewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath)
        guard let article = articles?[indexPath.row] else {return cell}
        
        var content = cell.defaultContentConfiguration()
        content.text = article.title ?? "Unbekannter Titel"
        cell.contentConfiguration = content
        
        return cell
        }
    }

