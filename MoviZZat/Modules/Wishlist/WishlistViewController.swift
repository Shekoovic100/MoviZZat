//
//  WishlistVc.swift
//  MoviZZat
//
//  Created by sherif on 24/08/2022.
//

import UIKit
import CoreData

class WishlistViewController: UIViewController {

    @IBOutlet weak var wishlistTableView: UITableView!
    var arr : [NSManagedObject]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Wishlist"
        wishlistTableView.separatorStyle = .singleLine
        arr = CoreDataStack.Shared.getSavedProducts()
        DispatchQueue.main.async {
        
            self.wishlistTableView.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // arr = CoreDataStack.Shared.getSavedProducts()
      
    }
   
 
}

extension WishlistViewController :UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arr?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.wishlistCellId, for: indexPath)as? WishListTableViewCell else {return
            UITableViewCell()
        }
      
        if let  stringa = arr?[indexPath.row].value(forKey: "movieImage")as? String{
            
            cell.wishlistMovieImageView.sd_setImage(with:URL(string:  Constants.imageUrl + stringa ) ,placeholderImage: UIImage(named: Constants.placeHolder))
        }
    
        
        if  let name = arr?[indexPath.row].value(forKey: "movieName") as? String {
            cell.wishlistMovieName.text = name
        }
         
         return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            arr?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            CoreDataStack.Shared.delete()
            DispatchQueue.main.async {
                self.wishlistTableView.reloadData()
            }
            do {
               try  CoreDataStack.Shared.context?.save()
            }catch{
                print("Error")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        } else {
            return 40
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
   
    
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.setEditing(true, animated: true)
    }

    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        if let indexPath = indexPath {
            let cell = tableView.cellForRow(at: indexPath)
            cell?.setEditing(false, animated: true)
        }
    }
}
