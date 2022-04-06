//
//  PhotoPicker.swift
//  Project2
//
//  Created by Liam Propst on 4/5/22.
//

import Foundation

import SwiftUI

//This is a fairly complicated structure that is used to allow a user to select and upload a photo from their photo library.


struct PhotoPicker: UIViewControllerRepresentable {
    
    @Binding var profileImage: UIImage?
    
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPicker: self)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let photoPicker: PhotoPicker
        
        init(photoPicker: PhotoPicker) {
            self.photoPicker = photoPicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage{
                photoPicker.profileImage = image
            } else{
                //return an alert that the user did not select an image
            }
            picker.dismiss(animated: true)
        }
    }
    
}
