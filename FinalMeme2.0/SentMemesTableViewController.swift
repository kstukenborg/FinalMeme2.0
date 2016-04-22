//
//  SentMemesTableViewController.swift
//  memekss
//
//  Created by Kathleen Stukenborg on 4/10/16.
//  Copyright © 2016 Kathleen Stukenborg. All rights reserved.
//

import Foundation
import UIKit
/* This class handles the sent memes that are stored in the tableView controller.
 */
class SentMemesTableViewController: UITableViewController {
    
   
   // @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    var memes: [Meme]{
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes

        
    }
    @IBAction func exitApplicaton(sender: AnyObject) {
               exit(0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // let space: CGFloat = 2.0
       // let dimension = (self.view.frame.size.width - (2*space)) / 3.0
        //make height the same as dimentsion so a square will be shown.
        //let height = (self.view.frame.size.width - ( 2 * space)) / 3.0
       // flowLayout.minimumInteritemSpacing = space
       // flowLayout.minimumLineSpacing = space
       // flowLayout.itemSize = CGSizeMake(dimension, height)

    }
    override func viewDidAppear(animated: Bool) {
            tabBarController?.tabBar.hidden = false
            navigationController?.navigationBarHidden = false
            tableView.reloadData()

    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ViewCellTable")! as! ViewCellTable
        let meme = memes[indexPath.row]
        cell.memeImage.image = meme.memedImage
        cell.memeImage.contentMode = UIViewContentMode.ScaleAspectFill
        cell.label.text = meme.topText + " " + meme.bottomText
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailController.displayMeme  = memes[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    
    
    
    
    

}