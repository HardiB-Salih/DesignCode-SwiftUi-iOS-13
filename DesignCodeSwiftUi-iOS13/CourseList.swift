//
//  CourseList.swift
//  DesignCodeSwiftUi-iOS13
//
//  Created by HardiBSalih on 22.08.2022.
//

import SwiftUI

struct CourseList: View {
    @State var courses = courseData
    @State var active = false
    
    var body: some View {
        ZStack {
            Color.white
            
            ScrollView {
                VStack(spacing: 30) {
                    Text("Courses")
                        .font(.largeTitle).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                        .padding(.top, 30)
                        .blur(radius: active ? 20 : 0)

                
                    ForEach(courses.indices, id: \.self) { index in
                        GeometryReader { geometry in
                            CourseView(show: self.$courses[index].show, courses: courses[index], active: $active)
                                .offset(y: self.courses[index].show ? -geometry.frame(in: .global).minY : 0)
                        }
    //                    .frame(height: self.courses[index].show ? screen.height : 280)
                        .frame(height: 280)
                        .frame(maxWidth: self.courses[index].show ? .infinity : screen.width - 60)
                        .zIndex(self.courses[index].show ? 1 : 0)
                    }
                }
                .frame(width: screen.width)
            }
            .statusBar(hidden: active ? true : false )
        }
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    @Binding var show : Bool
    var courses : Course
    @Binding var active : Bool

    var body: some View {
        ZStack(alignment: .top) {
            
            VStack(alignment: .leading, spacing: 30.0) {
                Text("Learn Advanced SwiftUI skills take take your apps to the next level, with techniques such as API Data, packages and CMS!")
                Text("Info about this course")
                    .font(.title).bold()
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                Text("Consequat interdum varius sit amet mattis. A arcu cursus vitae congue mauris rhoncus aenean vel. Integer vitae justo eget magna fermentum iaculis. Vel facilisis volutpat est velit egestas. Id diam vel quam elementum pulvinar etiam non. Purus sit amet volutpat consequat mauris nunc congue nisi vitae. Parturient montes nascetur ridiculus mus mauris vitae")
            }
            .padding(30)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity : 280)
            .offset(y: show ? 340 : 0)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 20)
            .opacity(show ? 1 : 0)
        

            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text(courses.title)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        Text(courses.subtitle)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    Spacer()
                    ZStack {
                        Image(uiImage: courses.logo)
                            .opacity(show ? 0 : 1)
                        
                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                        }
                        .frame(width: 36, height: 36)
                        .background(.black)
                        .clipShape(Circle())
                        .opacity(show ? 1 : 0)

                    }
                }
                Spacer()
                Image(uiImage: courses.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140, alignment: .top)
            }.padding(show ? 30 : 20)
                .padding(.top, show ? 30 : 0)
    //            .frame(width: screen.width - 60, height: 280)
                .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)
                .background(Color(courses.color))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color(courses.color).opacity(0.3), radius: 20, x: 0, y: 20)
                .onTapGesture {
                    self.show.toggle()
                    self.active.toggle()
                }
            
        }
        .frame(height: show ? screen.height : 280)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: show)
            .edgesIgnoringSafeArea(.all)

    }
}





//Set the data model via Array
//This is going to store the show state for each variation of the cards

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    //Update with URL of Image
    var image: UIImage
    var logo: UIImage
    var color: UIColor
    var show: Bool
    
}

//Created the mock Data
//Each array is using a Data model, and set show to false by default
//I've updated the image to use a URL from DropBox, we also have to make sure that the link has
//the 'dl.' added after the '//'
var courseData = [
    Course(title: "Protyping for Designing in SwiftUI", subtitle: "18 Sections", image: #imageLiteral(resourceName: "Illustration5"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), show: false),
    Course(title: "Advanced Designing in SwiftUI", subtitle: "18 Sections", image: #imageLiteral(resourceName: "Illustration4"), logo: #imageLiteral(resourceName: "Logo2"), color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), show: false),
    Course(title: "UI Design for Developers", subtitle: "18 Sections", image: #imageLiteral(resourceName: "Card3"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), show: false)
]
