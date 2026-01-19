//
//  ImagePickerBox.swift
//  thebeans
//
//  Created by OCUBE on 2024/02/06.
//

import Foundation
import SwiftUI
import UIKit

struct ImagePickerBox: View{
    
    @Binding var uiImageArray:Array<UIImage>
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    var body: some View {
        Button(action: {
            self.sourceType = .photoLibrary
            self.isImagePickerDisplay.toggle()
            
        }) {
            if selectedImage != nil {
                VStack{
                    Text("사업자등록증 업로드")
                        .font(.system(size: 14))
                        .padding(.horizontal,20)
                        .frame(width:UIScreen.main.bounds.width-60,height: 40)
                        .background(ColorCodes.loginInsertTextColor.color())
                        .cornerRadius(10)
                        .foregroundColor(Color.white)
                        .accentColor(Color.white)
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
    //                                        .clipShape(Circle())
                        .frame(width:UIScreen.main.bounds.width-60,height: UIScreen.main.bounds.width-60)
                        .cornerRadius(10)
                        .onAppear{
                            uiImageArray.append(selectedImage!)
                        }
                }
                
            } else {
                Text("사업자등록증 업로드")
                    .font(.system(size: 14))
                    .padding(.horizontal,20)
                    .frame(width:UIScreen.main.bounds.width-60,height: 40)
                    .background(ColorCodes.loginInsertTextColor.color())
                    .cornerRadius(10)
                    .foregroundColor(Color.white)
                    .accentColor(Color.white)
            }
            
        }
        .sheet(isPresented: self.$isImagePickerDisplay) {
            ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
        }
    }
}


struct ImagePickerView: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    var sourceType: UIImagePickerController.SourceType
        
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = self.sourceType
        imagePicker.delegate = context.coordinator // confirming the delegate
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {

    }

    // Connecting the Coordinator class with this struct
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: ImagePickerView
    
    init(picker: ImagePickerView) {
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.selectedImage = selectedImage
        self.picker.isPresented.wrappedValue.dismiss()
    }
    
}
