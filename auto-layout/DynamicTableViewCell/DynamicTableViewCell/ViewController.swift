//
//  ViewController.swift
//  DynamicTableViewCell
//
//  Created by Angelo Polotto on 02/02/20.
//  Copyright © 2020 Angelo Polotto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let books = [
        ["title": "The Ice Monster", "summary": "When Elsie, an orphan on the streets of Victorian London, hears about the mysterious Ice Monster – a woolly mammoth found at the North Pole – she’s determined to discover more… A chance encounter brings Elsie face to face with the creature, and sparks the adventure of a lifetime – from London to the heart of the Arctic!", "author": "By David Walliams"],
        ["title": "Wundersmith: The Calling of Morrigan Crow", "summary": "Morrigan Crow has been invited to join the prestigious Wundrous Society, a place that promised her friendship, protection and belonging for life. She's hoping for an education full of wunder, imagination and discovery - but all the Society want to teach her is how evil Wundersmiths are. And someone is blackmailing Morrigan's unit, turning her last few loyal friends against her. Has Morrigan escaped from being the cursed child of Wintersea only to become the most hated figure in Nevermoor?", "author": "By Jessica Townsend"],
        ["title": "Diary of a Wimpy Kid: The Meltdown", "summary": "When snow shuts down Greg Heffley's middle school, his neighborhood transforms into a wintry battlefield. Rival groups fight over territory, build massive snow forts, and stage epic snowball fights. And in the crosshairs are Greg and his trusty best friend, Rowley Jefferson.", "author": "By Jeff Kinney"],
        ["title": "Good Night Stories for Rebel Girls", "summary": "Good Night Stories for Rebel Girls introduces us to one hundred remarkable women and their extraordinary lives. From Marie Curie to Malala, Ada Lovelace to Zaha Hadid, this book brings together the stories of scientists, artists, politicians, pirates and spies. Each double-page spread contains a mini-biography written in the style of a modern fairy tale and a full-page portrait capturing the spirit of each heroine, by one of the sixty female artists from across the globe who were commissioned to illustrate the book.", "author": "By Elena Favilli"],
        ["title": "The 104-Storey Treehouse", "summary": "Join Andy and Terry in their wonderfully wild and wacky 104-storey treehouse. You can throw some refrigerators, make some money with the money-making machine (or honey if you'd prefer-it makes that too), climb the never-ending staircase, have a bunfight, deposit some burps in the burp bank, get totally tangled up in the tangled-up level, or just take some time out and relax in the peaceful sunny meadow full of buttercups, butterflies and bluebirds.", "author": "By: Andy Griffiths"]
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookTableViewCell
        
        let book = books[indexPath.row]
        
        cell.configureCell(book: book)
        
        return cell
    }
}
