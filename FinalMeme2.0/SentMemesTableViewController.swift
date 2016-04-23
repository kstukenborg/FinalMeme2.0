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
        var memes: [Meme]{
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
        }
    
    @IBAction func exitApplicaton(sender: AnyObject) {
               exit(0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        cell.label.text = meme.topText + "..." + meme.bottomText
        return cell
    }
    
   //delete a row from the meme tablefield and shared data model
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            (UIApplication.sharedApplication().delegate as! AppDelegate).memes.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    //send selected row data to the detail view controller
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailController.displayMeme  = memes[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    
    
    
    
    

}