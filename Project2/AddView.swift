//
//  AddView.swift
//  Project2
//
//  Created by Liam Propst on 3/28/22.
//

import SwiftUI


//The view used to add a city to the existing list
//NOTE: by default a city will not be in the favorites tab

struct AddView: View {
    
    @State var name: String = ""
    @State var country: String = ""
    @State var desc: String = ""
    @State var imageName: String = ""
    @State var image: UIImage?
    @State var finalImage: Image?
    
    //I must use a UIImage because that is what the photopicker takes and returns
    // It is easy after that to convert the UIImage to an Image which is what final image is.
    
    @State private var isShowingPhotoPicker = false
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        
        ZStack{
            VStack{
                Text("Add a City")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                Button {
                    isShowingPhotoPicker = true
                } label: {
                    VStack{
                        //if we selected an image then set the image
                        //else display the default big sur image
                        if image != nil {
                            Image(uiImage: image!)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 200)
                                .clipShape(Circle())
                                .padding()
                        }
                        else{
                            Image("bigsur")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 200)
                                .clipShape(Circle())
                            Text("Click to Edit Image")
                                .foregroundColor(.black)
                        }
                    }
                }
                
                TextField("Name", text: $name)
                    .padding(.leading, 40)
                    .padding(.trailing, 40)
                    .foregroundColor(Color.black)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.vertical)
                TextField("Country", text: $country)
                    .padding(.leading, 40)
                    .padding(.trailing, 40)
                    .foregroundColor(Color.black)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.vertical)
                TextField("Description", text: $desc)
                    .padding(.leading, 40)
                    .padding(.trailing, 40)
                    .foregroundColor(Color.black)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.vertical)
                
                Button(action: {
                    //if we selected an image add the city to the list with the selected image
                    //else add the city to the list with the default picture enabled which is passed in by photoname.
                    if image != nil{
                        finalImage = Image(uiImage: image!)
                        modelData.cities.append(City(name: name, country: country,
                                                     desc: desc, imageName: imageName,
                                                     id: Int.random(in: 1...1000), image: finalImage))
                        name = ""
                        country = ""
                        desc = ""
                        image = nil
                    }
                    else{
                        imageName = "bigsur"
                        modelData.cities.append(City(name: name, country: country,
                                                     desc: desc, imageName: imageName,
                                                     id: Int.random(in: 1...1000), image: nil))
                        name = ""
                        country = ""
                        desc = ""
                        imageName = ""
                    }
                    
                }) {
                    //Button view
                    HStack {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .font(.title)
                        Text("Add")
                            .frame(width: 40, height: 20)
                            
                    }
                }
                .buttonStyle(GradientBackgroundStyle())
            }
            .sheet(isPresented: $isShowingPhotoPicker, content: {
                PhotoPicker(profileImage: $image)
            })
        }
        
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}

