//
//  Sitter_PetInfo.swift
//  Sitter_PetTab
//
//  Created by MU IT Program on 3/30/16.
//  Copyright © 2016 Megan Cochran. All rights reserved.
//

import UIKit

class PetInfoSitter: UIViewController {
    
    @IBOutlet weak var petAge: UILabel!
    @IBOutlet weak var petSpecies: UILabel!
    @IBOutlet weak var petPersonalityLabel: UILabel!
    @IBOutlet weak var petFoodLabel: UILabel!
    @IBOutlet weak var petNotes: UILabel!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var petBreedLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var personalityHeader: UILabel!
    @IBOutlet weak var foodHeader: UILabel!
    @IBOutlet weak var noteHeader: UILabel!
    
    
    var petName: String?
    var petID: Int?
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        if let fetchedPets = appDelegate.getPets(){
            for pet in fetchedPets{
                if (pet.petID == petID){
                    petNameLabel.text = pet.name
                    petAge.text = pet.age
                    petSpecies.text = pet.species
                    petBreedLabel.text = pet.breed
                    petPersonalityLabel.text = pet.personality
                    print(pet.personality)
                    petFoodLabel.text = pet.food
                    petNotes.text = pet.notes
                    imageView.image = self.appDelegate.pickPetPicture(petSpecies.text!)
                    
                    if(pet.personality?.characters.count == 0){
                        personalityHeader.text = ""
                    }
                    if(pet.food?.characters.count == 0){
                        foodHeader.text = ""
                    }
                    if(pet.notes?.characters.count == 0){
                        noteHeader.text = ""
                    }
                    if(pet.age == "0")
                    {
                        petAge.text = ""
                    }
                    
                    
                    self.title = pet.name
                    
                }
            }
        }

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "toPet"){
            let viewController = segue.destinationViewController as! PetInfoSitter
            if let buttonTitle = (sender as? UIButton)?.titleLabel?.text{
                viewController.petName = buttonTitle
            }}
    }*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
