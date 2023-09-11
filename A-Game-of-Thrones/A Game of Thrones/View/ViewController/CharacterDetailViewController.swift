//
//  CharacterDetailViewController.swift
//  A Game of Thrones
//
//  Created by Senthil on 10/09/23.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var bornLabel: UILabel!
    @IBOutlet var diedLabel: UILabel!
    @IBOutlet var fatherLabel: UILabel!
    @IBOutlet var motherLabel: UILabel!
    @IBOutlet var cultureLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var playedLabel: UILabel!
    
    var characterArr: [DetailModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation Bar title
        self.title = "Character Detail"
        self.pageSetup()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.tintColor = .white

    }
    
    
    func pageSetup() {
        
        // Set Character Detail
        nameLabel.text = "Name : " + (characterArr[0].name ?? "")
        genderLabel.text = "Gender : " + (characterArr[0].gender ?? "")
        bornLabel.text = "Born : " + (characterArr[0].born ?? "")
        diedLabel.text = "Died : " + (characterArr[0].died ?? "")
        fatherLabel.text = "Father : " + (characterArr[0].father ?? "")
        motherLabel.text = "Mother : " + (characterArr[0].mother ?? "")
        cultureLabel.text = "Culture : " + (characterArr[0].culture ?? "")
        titleLabel.text = "Title : " + characterArr[0].titles![0]
        playedLabel.text = "Played By : " + characterArr[0].playedBy![0]
        
    }

}
