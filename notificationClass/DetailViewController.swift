//
//  DetailViewController.swift
//  notificationClass
//
//  Created by hoanganh on 4/8/19.
//  Copyright © 2019 hoanganh. All rights reserved.
//

import UIKit

extension Notification.Name{
    static let notifications = Notification.Name("key")
}
class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var txtname: UITextField!
    
    
    @IBOutlet weak var txtprice: UITextField!
    var perSon1: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        changceDat()
//        if let perSon = perSon1, let imageData = perSon.image{
//        func changceDat() {
        if perSon1 != nil{
            let imageData = perSon1?.image
            image.image = UIImage(data: imageData!)
            txtname.text = perSon1?.name
            txtprice.text = perSon1?.price
        }
        
       
//        }
//        }.
        // Do any additional setup after loading the view.
    }
//    func changceDat() {
//        let imageData = perSon1?.image
//        image.image = UIImage(data: imageData!)
//        txtname.text = perSon1?.name
//        txtprice.text = perSon1?.price
//    }
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func Cick(_ sender: Any) {
        if image.image?.pngData() != nil && (txtname.text?.count)! > 0 && (txtprice.text?.count)! > 0 {
            
            perSon1 = Person(image: (image.image?.pngData())!, name: txtname.text!, price: txtprice.text!)
            
            NotificationCenter.default.post(name: .notifications, object: perSon1)
            
            
            
            navigationController?.popViewController(animated: true)
        }else{
    showAlert()
        }
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        image.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    
    func showAlert(){
        let alert = UIAlertController(title: "Vui lòng nhập đủ dữ liệu", message: "Đại ngu vãi ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        self.present(alert, animated: true, completion: nil)
    }
   

}

