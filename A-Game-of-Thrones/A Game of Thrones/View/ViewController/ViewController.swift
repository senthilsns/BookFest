//
//  ViewController.swift
//  A Game of Thrones
//
//  Created by Senthil on 10/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var tableView: UITableView!
    
    // View model object
    var viewModel = BookViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Book Fest"
        self.navigationController?.navigationBar.tintColor = .black

        pageSetup()
    }

    
    //MARK: Initial page settings
    func pageSetup()  {
        activityIndicator.startAnimating()
        
        ///API calling from viewmodel class
        viewModel.readBookInfoFromAPI()
        closureSetUp()
    }
    
    //MARK: Closure Initialize
    func closureSetUp()  {
        viewModel.reloadList = { [weak self] ()  in
            ///UI chnages in main tread
            DispatchQueue.main.async {
                self?.tableView.isHidden = false
                self?.tableView.reloadData()
                self?.activityIndicator.stopAnimating()

            }
        }
        viewModel.errorMessage = { [] (message)  in
            DispatchQueue.main.async {
                print(message)
            }
        }
    }

}

//MARK: ViewController Extension
extension ViewController : UITableViewDelegate,UITableViewDataSource{
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return viewModel.arrayOfList.count
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 195
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing : BookCell.self)) as! BookCell
        cell.selectionStyle = .none

        let listObj = viewModel.arrayOfList[indexPath.row]
        
        cell.nameLabel.text = "Book Name:" + listObj.name!
        cell.autherLabel.text = "Auther:" + (listObj.authors?.first!)!
        cell.numberofPagesLabel.text = "No of Pages: \(listObj.numberOfPages!) "
        cell.isbnLabel.text = "ISBN:"+listObj.isbn!
        cell.publisherLabel.text = "Publisher Name:" + listObj.publisher!
        cell.countryLabel.text = "Country Name:" + listObj.country!
        
        // Cell background color change
        if ((indexPath.row % 2) != 0){
            cell.contentView.backgroundColor = .systemBlue
            cell.nameLabel.textColor = .white
            cell.autherLabel.textColor = .white
            cell.numberofPagesLabel.textColor = .white
            cell.isbnLabel.textColor = .white
            cell.publisherLabel.textColor = .white
            cell.countryLabel.textColor = .white
            
        }else{
            cell.contentView.backgroundColor = .clear
            cell.nameLabel.textColor = .black
            cell.autherLabel.textColor = .black
            cell.numberofPagesLabel.textColor = .black
            cell.isbnLabel.textColor = .black
            cell.publisherLabel.textColor = .black
            cell.countryLabel.textColor = .black
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "BookCharacterViewController") as? BookCharacterViewController
        let listObj = viewModel.arrayOfList[indexPath.row]
        vc?.cha_Array = listObj.characters!
        self.navigationController?.pushViewController(vc!, animated: true)
    }

}
