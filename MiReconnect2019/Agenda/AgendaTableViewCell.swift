//
//  AgendaTableViewCell.swift
//  AgendaPage
//
//  Created by Suhaib AlMutawakel on 7/30/19.
//  Copyright © 2019 Suhaib AlMutawakel. All rights reserved.
//

import UIKit
import Foundation
import UserNotifications

protocol agendaDelegate {
    func reminderPressed()
}


class AgendaTableViewCell: UITableViewCell
{
    
    // @IBOutlet weak var ImageBackground: UIImageView!
    // I do not know why are you using this
    
    var delegate: agendaDelegate?
    var userDefault = UserDefaults.standard
    
    @IBOutlet weak var speakerImage: UIImageView!
    @IBOutlet weak var sessionTitle: UILabel!
    @IBOutlet weak var speakerName: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var remindBtn: UIButton!
    
    // It's not a very good idea to add `!` to a variable here, but I'm going with the flow :)
    private var agenda: Agenda!
    
    
    //Setting up the agenda cell based on the info received from tableview
    func setAgenda(agenda: Agenda){
        self.agenda = agenda
        speakerImage.image = UIImage(named: agenda.speakerImage)
        //speakerImage.image = agenda.speakerImage
        
        sessionTitle.text = agenda.sessionTitle
        //startTime.text = "\(agenda.startTimeHours) : \(agenda.startTimeMinutes)"
        if agenda.startTimeMinutes == 0{
            startTime.text = String(agenda.startTimeHours) + ":" + "00"
        }
        else{
            startTime.text = String(agenda.startTimeHours) + ":" + String(agenda.startTimeMinutes)
        }
        
        duration.text = agenda.duration
        speakerName.text = agenda.speakerName
        //Setting the button tag equal to index so we keep track of buttons created
        //        remindBtn.tag = myIndex
        //
        //        remindBtn.setImage(agenda.isSelected ? UIImage(named: "bellOn") : UIImage(named: "bellOff"), for: .normal)
        configureReminderImaage()
    }
    
    //Function that handles once the remind button is pressed
    @IBAction func btnPressed(_ sender: Any) {
        
        agenda.hasReminder = !agenda.hasReminder
        configureReminderImaage()
        //When the button is pressed for the first time it is set to on
        if agenda.hasReminder {
            let id : String =  String(remindBtn!.tag)
            setNotification(id: id)
           // saveReminderSetting()
            
        } else {
            let id : String =  String(remindBtn!.tag)
            removeNotificaiton(id: id)
        }
        
    }
    
    func configureReminderImaage() {
        let reminderImageName = agenda.hasReminder ? "bellOn" : "bellOff"
        remindBtn.setImage(UIImage(named: reminderImageName), for: .normal)
    }
    
//    func saveReminderSetting () {
//        userDefault.set(remindBtn.tag, forKey: "bellOn")
//    }

//    func checkReminderSettings () {
//        let hasReminderSetting = userDefault.bool(forKey: "bellOn")
//
//        if hasReminderSetting {
//            agenda.hasReminder = true
//        }
    
//    }
    
    //trying to fix the repeated button reminder
    //    override func prepareForReuse() {
    //        super.prepareForReuse()
    //        remindBtn.setImage(UIImage(named: "bellOff"), for: .normal)
    //    }
    //
    
    
    func setNotification (id : String) {
        let center = UNUserNotificationCenter.current()
        
        let reminderTime: Int = 15
        let content = UNMutableNotificationContent()
        let lectureTitle = agendas[remindBtn.tag].sessionTitle
        content.title = lectureTitle
        content.body = " \(lectureTitle) with \(agendas[remindBtn.tag].speakerName) is about to start in 15 minutes. Head to main hall."
        content.categoryIdentifier = "alarm"
        content.userInfo = ["btnID": id]
        content.sound = UNNotificationSound.default
        
        var dateComponents = DateComponents()
        dateComponents.month = 9
        dateComponents.day = 12
        dateComponents.hour = agendas[remindBtn.tag].startTimeHours
        dateComponents.minute = agendas[remindBtn.tag].startTimeMinutes

        //dateComponents.day = 10
        //dateComponents.hour = agendaItems[remindBtn.tag].startTimeHours

        if agendas[remindBtn.tag].startTimeMinutes < reminderTime {
            dateComponents.hour = agendas[remindBtn.tag].startHoursMilitary - 1
            dateComponents.minute = 60 - reminderTime
        }else
        {
            dateComponents.hour = agendas[remindBtn.tag].startHoursMilitary
            dateComponents.minute = agendas[remindBtn.tag].startTimeMinutes - reminderTime
        }
       
       

//        dateComponents.hour = 18
//        dateComponents.minute = 14

        //dateComponents.minute = agendaItems[remindBtn.tag].startTimeMinutes

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        //        Repeating the reminder/notification instead of set time
        //        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        
        //let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        center.add(request)
        
    }
    
    
    func removeNotificaiton(id : String){
        let center = UNUserNotificationCenter.current()
        
        
        center.getPendingNotificationRequests { (notifications) in
            //print("Count: \(notifications.count)")
            for item in notifications {
                //let userInfo = item.content.userInfo
                
                
                //                let userInfo:Dictionary<AnyHashable,Any?> = item.content.userInfo
                //                let infoDict :  Dictionary = userInfo as! Dictionary<String,String?>
                //                let notifcationObjectId : String = infoDict["btnID"]!!
                
                //var dict : Dictionary = Dictionary<AnyHashable,Any>()
                //let yourData = userInfo["btnId"]
                
                //print(notifcationObjectId)
                

                let notifcationObjectId = item.identifier

                
                if id == notifcationObjectId {
                    center.removePendingNotificationRequests(withIdentifiers: [id])
                    //center.removeDeliveredNotifications(withIdentifiers: ["btnID"])
                    print("done")
                    print(id, notifcationObjectId)
                }
               
            }
            
        }
        
       
    
    }
    
    
    
    //    //@IBAction func remindPressed(_ sender: Any) {
    //        delegate?.reminderPressed()
    //       // remindBtn.setImage(UIImage(named: "belllicon"), for: .normal)
    //
    //
    //        let center = UNUserNotificationCenter.current()
    //
    //        let content = UNMutableNotificationContent()
    //        let lectureTitle = agendaItems[remindBtn.tag].sessionTitle
    //        content.title = lectureTitle
    //        content.body = "Lecture: \(lectureTitle) is about to start in 5 minutes. Head to main hall."
    //        content.categoryIdentifier = "alarm"
    //        content.userInfo = ["customData": "fizzbuzz"]
    //        content.sound = UNNotificationSound.default
    //
    //        var dateComponents = DateComponents()
    //        dateComponents.month = 8
    //        dateComponents.day = 29
    //        dateComponents.hour = agendaItems[remindBtn.tag].startTimeHours
    //        dateComponents.minute = agendaItems[remindBtn.tag].startTimeMinutes
    //        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
    //
    //        //Repeating the reminder/notification instead of set time
    //        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
    //
    //        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    //        center.add(request)
    //    }
    
    
    
    
    
    
    
    
    //
    //    var agenda: Agenda! {
    //        didSet{
    //            updateUI()
    //        }
    //    }
    //
    //    func updateUI() {
    //        //ImageBackground.image = UIImage(named: agenda.placeholder)
    ////        ImageBackground.layer.shadowOpacity = 0.2 // opacity, 20%
    ////        ImageBackground.layer.shadowColor = UIColor.init(red:0.20, green:0.52, blue:0.90, alpha:1.0).cgColor
    ////        ImageBackground.layer.shadowRadius = 5 // HALF of blur
    ////        ImageBackground.layer.shadowOffset = CGSize(width: 0, height: 2) // Spread x, y
    ////        ImageBackground.layer.masksToBounds =  false
    //
    //    }
    //
    
}
