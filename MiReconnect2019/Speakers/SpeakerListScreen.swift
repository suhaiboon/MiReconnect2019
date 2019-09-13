//
//  SpeakerListScreen.swift
//  ReconnectSpeakers
//
//  Created by Oussama Ajerd on 7/18/19.
//  Copyright © 2019 Oussama Ajerd. All rights reserved.
//

import UIKit

//var myIndex = 0
var speakers: [Speaker] = []

class SpeakerListScreen: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //speakers = createArray()
        parseSpeakersCSV()
       
        // Do any additional setup after loading the view.
    }
    
    
    func parseSpeakersCSV(){
        do {
            let csv = try CSV(
                name: "speakers",
                extension: "csv",
                bundle: .main,
                delimiter: ",",
                encoding: .utf8)
            let rows = csv!.namedRows
            
            for row in rows{
                let speakerName = row["speakerName"]!
                let speakerImage = row["speakerImage"]!
                let namePlaceHolder = row["namePlaceHolder"]!
                let circleImage = row["circleImage"]!
                let speakerTitle = row["speakerTitle"]!
                let speakerBio = row["speakerBio"]!
                let BGImage = row["BGImage"]!
                
                let speaker = Speaker(speakerName: speakerName, speakerImage: UIImage(named: speakerImage)!, namePlaceholder: UIImage(named: namePlaceHolder)!, circleImage: UIImage(named: circleImage)!, speakerTitle: speakerTitle, speakerBio: speakerBio, BGImage: UIImage(named: BGImage)!)
                
                speakers.append(speaker)
                
            }
            
            
        } catch {
            // Catch errors from trying to load files
        }
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
   
//    func createArray() -> [Speaker]{
//        var tempArray: [Speaker] = []
//        let Oussama = Speaker(image: UIImage(named: "p5")!, speakerName: "Oussama Ajerd", namePlaceholder: UIImage(named: "testnameplaceholder")!, profileImage: UIImage(named:"ProfilePic")!, speakerTitle: "CEO of Ajerd LLC", speakerBio: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.")
//        let Oussama1 = Speaker(image: UIImage(named: "p4")!, speakerName: "Oussama Ajerd", namePlaceholder: UIImage(named: "testnameplaceholder")!, profileImage: UIImage(named:"p2")!, speakerTitle: "Works for Suhaib", speakerBio: "He makes him coffee and copies")
//
////        let yasirFahmy = Speaker(image: UIImage(named: "p5")!, name: "Yasir Fahmy", namePlaceholder: UIImage (named: "testnameplaceholder")!)
////        let ayeshaPrime = Speaker(image: UIImage(named: "p2")!, name: "Ayesha Prime", namePlaceholder: UIImage (named: "testnameplaceholder")!)
////        let abuTaleb = Speaker(image: UIImage(named: "p3")!, name: "Abu Taleb", namePlaceholder: UIImage (named: "testnameplaceholder")!)
////        let yasirFahmy1 = Speaker(image: UIImage(named: "p1")!, name: "Yasir Fahmy", namePlaceholder: UIImage (named: "testnameplaceholder")!)
////        let ayeshaPrime1 = Speaker(image: UIImage(named: "p2")!, name: "Ayesha Prime", namePlaceholder: UIImage (named: "testnameplaceholder")!)
////        let abuTaleb1 = Speaker(image: UIImage(named: "p3")!, name: "Abu Taleb", namePlaceholder: UIImage (named: "testnameplaceholder")!)
////
////        tempArray.append(yasirFahmy)
////        tempArray.append(ayeshaPrime)
////        tempArray.append(abuTaleb)
////        tempArray.append(yasirFahmy1)
////        tempArray.append(ayeshaPrime1)
////        tempArray.append(abuTaleb1)
//          tempArray.append(Oussama)
//          tempArray.append(Oussama1)
//
//        return tempArray
//
//    }
    
    
    

}


extension SpeakerListScreen: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return speakers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentSpeaker = speakers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpeakerCell") as! SpeakerCell
        
        cell.setSpeaker(speaker: currentSpeaker)
        cell.backgroundColor = UIColor.clear
        
        
        return cell
    }
    
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "FromTableToCell", sender: self)
       tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
    
    
}



