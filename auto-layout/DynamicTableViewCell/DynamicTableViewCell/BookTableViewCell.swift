//
//  BookTableViewCell.swift
//  DynamicTableViewCell
//
//  Created by Angelo Polotto on 02/02/20.
//  Copyright © 2020 Angelo Polotto. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(book: [String: String]) {
        guard
            let title = book["title"],
            let author = book["author"],
            let summary = book["summary"]
        else { return }
        
        titleLabel.text = title
        authorLabel.text = author
        summaryLabel.text = summary
    }

}
