//
//  ContactUsViewController.swift
//  imageSlider
//
//  Created by Suhaib AlMutawakel on 8/2/19.
//  Copyright © 2019 Suhaib AlMutawakel. All rights reserved.
//
import Foundation
import UIKit
import SafariServices
import MessageUI
import MapKit

class ContactUsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    @IBOutlet weak var backButton: UIButton!
    
    var imageArray = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"),UIImage(named: "4"),UIImage(named: "5"),UIImage(named: "6")]
    
    var effect:UIVisualEffect!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCollectionViewCell
        
        cell.imgImage.image = imageArray[indexPath.row]
        
        return cell
    }
    
    
    //When facebook Button is pressed it takes you to facebook page of event
    @IBAction func facebookBtnPressed(_ sender: Any) {
        showSafariVC(for: "https://www.facebook.com/mireconnect")
    }
    
    //When email button is prssed it calls showMailComposer function
    //That composes an email to designated
    @IBAction func emailBtnPressed(_ sender: Any) {
        showMailComposer()
    }
    
    
    //When instagram button is pressed it takes you to instagram page of event
    @IBAction func instagramBtnPressed(_ sender: Any) {
        showSafariVC(for: "https://www.instagram.com/mireconnect/")
    }
    
    
    //Function: takes string and opens Safari browser with that page
    func showSafariVC(for url: String) {
        guard let url = URL(string: url) else {
            //Show an invalid URL error alert
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
    
    
    //Function: the composes an email and presenets it
    //You can set the different components of an email
   
    func showMailComposer() {

        guard MFMailComposeViewController.canSendMail() else {
            //Show alert informing the user
            return
        }

        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["info@mireconnect.org"])
        composer.setSubject("Qumri Dev Rocks")
        composer.setMessageBody("Suhaib and Oussama are the best", isHTML: false)

       // self.navigationController.presentViewController(mail, animated: true, completion: nil)

        present(composer, animated: true)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var doneButton: UIButton!
    
    //Pop over set up for Kids Club
    // CODE
    @IBOutlet var kidsClubPopOver: UIView!
    
    @IBAction func kidsClubDoneBtn(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.kidsClubPopOver.transform = CGAffineTransform.init(scaleX: 2.3, y: 2.4)
            self.kidsClubPopOver.alpha =  0
            
        }) { (success:Bool)in
            self.kidsClubPopOver.removeFromSuperview()
    
        }    }
    
    
    @IBAction func kidsClubOpenPopOver(_ sender: Any) {
        animateIn()
    }
    
    //Suhaib
    //Adding the Calling Button
    @IBOutlet weak var CallButton: CustomButtons!
    
    @IBAction func CallButtonPressed(_ sender: Any) {
        makePhoneCall(phoneNumber: phoneNumber)
    }

    var phoneNumber = "(206)788-6392"
    //Function to make a call using the String above to change the phone number
    func makePhoneCall(phoneNumber: String) {
        
        if let phoneURL = NSURL(string: ("tel://" + phoneNumber)) {
            
            let alert = UIAlertController(title: ("Call " + phoneNumber + "?"), message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
                UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    //End Suhaib
    
    //--------------------------
    //--------------------------
    
    
    //Pop over set up for Address
    // CODE
    
    @IBOutlet var addressPopOver: UIView!
    
    @IBAction func addressDoneBtn(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.addressPopOver.transform = CGAffineTransform.init(scaleX: 2.3, y: 2.4)
            self.addressPopOver.alpha =  0
            
        }) { (success:Bool)in
            self.addressPopOver.removeFromSuperview()
        }    }
    
    @IBAction func addressOpenPopOver(_ sender: Any) {
        

        self.view.addSubview(addressPopOver)
        addressPopOver.center = self.view.center
        
        addressPopOver.transform = CGAffineTransform.init(scaleX: 2.3, y: 2.4)
        addressPopOver.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.addressPopOver.alpha = 1
            self.addressPopOver.transform = CGAffineTransform.identity
        }
    }
    
    @IBOutlet weak var mapButton: UIImageView!
    
    
    @IBAction func mapButtonPressed(_ sender: Any) {
        let latitude: CLLocationDegrees = 42.314270
        let longitude: CLLocationDegrees = -83.197378
        
        let regionDistance: CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2D(latitude: latitude,longitude: longitude)
        
        let regionSpan = MKCoordinateRegion(center: coordinates,latitudinalMeters: regionDistance,longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placeMark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placeMark)
        
        mapItem.name = "Reconnect Conference Location"
        mapItem.openInMaps(launchOptions: options)
    }
    
    
    //--------------------------
    //--------------------------
    
    
    //Pop over set up for About Us
    // CODE
    
    @IBOutlet var aboutusPopOver: UIView!
    
    @IBAction func aboutusDontBtn(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.aboutusPopOver.transform = CGAffineTransform.init(scaleX: 2.3, y: 2.4)
            self.aboutusPopOver.alpha =  0
            
        }) { (success:Bool)in
            self.aboutusPopOver.removeFromSuperview()
        }
    }
    
    @IBAction func aboutusOpenPopOver(_ sender: Any) {
        self.view.addSubview(aboutusPopOver)
        aboutusPopOver.center = self.view.center
        
        aboutusPopOver.transform = CGAffineTransform.init(scaleX: 2.3, y: 2.4)
        aboutusPopOver.alpha = 0
    
        UIView.animate(withDuration: 0.4) {
            self.aboutusPopOver.alpha = 1
            self.aboutusPopOver.transform = CGAffineTransform.identity
            
            
        }
    }
    
    
    //animation Function
    func animateIn() {
        self.view.addSubview(kidsClubPopOver)
        kidsClubPopOver.center = self.view.center
        
        kidsClubPopOver.transform = CGAffineTransform.init(scaleX: 2.3, y: 2.4)
        kidsClubPopOver.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.kidsClubPopOver.alpha = 1
            self.kidsClubPopOver.transform = CGAffineTransform.identity
        }
    }
    
    func animationOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.kidsClubPopOver.transform = CGAffineTransform.init(scaleX: 2.3, y: 2.4)
            self.kidsClubPopOver.alpha =  0
            
        }) { (success:Bool)in
            self.kidsClubPopOver.removeFromSuperview()
        }
    }
}



//Extension that handles options after email is done
//I.e cancels emails, saves drafts, deletes draft...
extension ContactUsViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            //Show error alert
            controller.dismiss(animated: true)
            return
        }
//
//        switch result {
//        case .cancelled:
//            print("Cancelled")
//        case .failed:
//            print("Failed to send")
//        case .saved:
//            print("Saved")
//        case .sent:
//            print("Email Sent")
//        }
        
        controller.dismiss(animated: true)
    }
}
