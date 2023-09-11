//
//  BookCharacterViewController.swift
//  A Game of Thrones
//
//  Created by Senthil on 10/09/23.
//

import UIKit

class BookCharacterViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var cha_Array: [String] = []
    
    // View model object
    var viewModel = CharacterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Character"
        pageSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.tintColor = .black
    }
    

    //MARK: Initial page settings
    func pageSetup()  {
        
        ///API calling from viewmodel class
        for i in 0...cha_Array.count-1 {
            
            viewModel.readBookCharacterInfoFromAPI(character_APIString: cha_Array[i])
        }
        
        closureSetUp()
    }
    
    //MARK: Closure Initialize
    func closureSetUp()  {
        viewModel.reloadList = { [weak self] ()  in
            ///UI chnages in main tread
            DispatchQueue.main.async {
                self?.tableView.isHidden = false
                self?.tableView.reloadData()
            }
        }
        viewModel.errorMessage = { [] (message)  in
            DispatchQueue.main.async {
                print(message)
            }
        }
    }

}


//MARK: BookCharacterViewController Extension
extension BookCharacterViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return viewModel.characterDetailList.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing : CharacterCell.self)) as! CharacterCell
        cell.selectionStyle = .none
        
        let listObj = viewModel.characterDetailList[indexPath.row]
        cell.BookCharacterLabel.text = listObj.name!
        
        // Cell background color change
        if ((indexPath.row % 2) != 0){
            cell.contentView.backgroundColor = .systemBlue
            cell.BookCharacterLabel.textColor = .white

        }else{
            cell.contentView.backgroundColor = .clear
            cell.BookCharacterLabel.textColor = .black
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CharacterDetailViewController") as? CharacterDetailViewController
        let listObj = viewModel.characterDetailList[indexPath.row]
        
        let tempArr: [String] = listObj.playedBy!
        let tempArr1: [String] = listObj.titles!
        vc?.characterArr.append(DetailModel(name: listObj.name ?? "", gender: listObj.gender ?? "", culture: listObj.culture ?? "", born: listObj.born  ?? "", died: listObj.died ?? "", titles: tempArr1, aliases:["s"], father: listObj.father ?? "", mother: listObj.mother ?? "", playedBy: tempArr))
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
