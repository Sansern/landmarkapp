//
//  SwiftUIView.swift
//  landmarkapp
//
//  Created by Sansern Wuthirat on 10/20/21.
//

import SwiftUI

struct SwiftUIView: View {
    @State var firstName = ""
       @State var lastName = ""
       @State var birthdate = Date()

   var dateFormatter: DateFormatter = {
           let dateFormatter = DateFormatter()
           dateFormatter.dateStyle = .medium
           
           return dateFormatter
       }()
       let age = Int()
       init() {
           let age = Calendar.current.dateComponents([.year], from: birthdate, to: Date())
               .year
       }

    var body: some View {
        Form{
                   Section(header: Text("Personal data")){
                       TextField("Enter first name", text: $firstName)
                       TextField("Enter last name", text: $lastName)
                       DatePicker("Birthdate", selection: $birthdate,in: ...Date(), displayedComponents:.date)
                   }
                   Section(header: Text("Final info")){
                       HStack{
                           Image(systemName: "person.crop.circle")
                               .resizable()
                               .frame(width: 50, height: 50, alignment: .center)
                           Spacer()
                           VStack{
                               Text("\(firstName) \(lastName)")
                                   .font(.headline)
                               Text("\(birthdate)")
                                   .font(.subheadline)
                           }
                           Spacer()
                           Image(systemName: "1.square.fill")
                               .resizable()
                               .frame(width: 50, height: 50)
                               .foregroundColor(.blue)
                       }
                       .padding(.horizontal ,10)
                   }
               }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
