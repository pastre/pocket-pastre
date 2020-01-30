//
//  Manager.swift
//  NC1
//
//  Created by Bruno Pastre on 24/01/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import UIKit

class Manager  {
    
    static let instance = Manager()
    
    var stories: [Story]!
    
    private init() {
        self.stories = [
            Story(name: "Apple Developer Academy", milestones: [
                
                Milestone(name: "Harmonify - Colors & Palettes", description: "This is an app I developed during the crash course at my Academy, and it's pourpuse was for me to learn color theory. I ended up, after all, turning it into a mathematical approach into color theory. This is one of my favorite apps becuse I feel like I played my best game in every way: design, maths, app development and color theory. Harmonify is now the app I`m using to learn about business and marketing strategies, since it sort of is a useful tool.", iconName: "harmonify"),
                Milestone(name: ".space", description: ".space is the result of my first mini-challenge at the Academy. Together with friends (Yumi, Barion and Filipe), we provided a tool for people to metaphorically organize their inner space and thoughts, by using abstract shapes, planets, and their orbits ", iconName: "dotspace"),
                
                Milestone(name: "Relibox", description: "This is the product of the second mini-challenge we had at the Academy. My group (Mari, Lari, Jess and Rubens) and I were motivated to link physical objects to digital memories by using NFC tags. It was a great experience for me, since I got to explore UX and UI designing most of the project, and help my friends improve their programming.", iconName: "relibox"),
                
                Milestone(name: "Cube H", description: "This was the last challenge we had at the Academy. My friends (Jota, Maykon and Barion) and I developed a multiplayer idle game focused around the mechanics of a startup. I was the main programmer, so I modeled the game's classes and protocols and implemented it. Maykon and I also trained a CNN model to recognize doodles, which was a pretty fun thing to learn how to do.", iconName: "cubeH"),
                
                Milestone(name: "Bubbles! Why not!", description: "This is the first app I have ever made. It was born as a WWDC entry, where I had my first contact with Apple technologies, 3D scenes, design and Augmented Reality. It was really fun to learn all that stuff, and a real challange to develop it in just 10 days", iconName: "bubbles"),

                Milestone(name: "Movie Genie", description: "The Movie Genie was developed during another Crash Course at the Academy. It is a service that provides a movie suggestion based on other movies that you judge.", iconName: "movieGenie"),
                Milestone(name: "Playing with PC", description: "Playing with PC is a quiz I developed for a Crash Course activity. I focused on learning about fonts, items disposition, information hierarchy and illustration. It is a game where you and PC, the main character, are studying for a test about the history of Computer Science.", iconName: "quiz"),
                Milestone(name: "Activities Manager", description: "This is the app I like the last between the ones I made. It is the product of a Crash Course which has the main goal to track time about activities and tasks. I learned about table views, timers, dispatch queue, and tried to design it according to Apple's Human Interface Guidelines. It was a nice challenge, but I'm not satisfied with the result.", iconName: "activities"),
                ],
                  
                iconName: "academyIcon"),

            
            Story(name: "AI", milestones: [
                
                Milestone(name: "Neural Networks", description: "I have some experience with neural networks, specially YOLO, which was used to detect people on a camera livestream and track them, using another algorithm, so that analytics about the place the camera was could be generated.", iconName: "neuralNetwork"),
                Milestone(name: "Computer Vision", description: "Computer vision is an area that i find to be very intersting. It involves a lot of math applied to images and abstract logic. I integrated a Background Subtraction algorithm, which was developed by a friend, into an architecture that supports multiple image processing algorithms.", iconName: "computerVision"),
                Milestone(name: "System Architectures", description: "Working at a startup, I developed what we called the 'brain' of the core technology. I modeled the database, and both modeled and coded the whole backend and frame processing pipeline. It was a really cool challenge, since I got to integrate plenty of awesome algorithms and measure their efficiency and balance their payload on the machine. ", iconName: "systemArchitecture"),
                Milestone(name: "Networking", description: "While working at the same startup, we had the idea of using WiFi to position people in space. Because of that, I learned a lot about networking and the low level WiFi protocol. I also learned a lot about the ESP 8266 and linux.", iconName: "networking"),
            
            ], iconName: "aiIcon"),


            Story(name: "Hobbies", milestones: [
                
                Milestone(name: "Readings", description: "I don't read a lot of books, but this hobby deserves a place here for it is the activity that most has developed who I am. I read since I was about 9, and back then would read only adventure-fantasy like books, like Harry Potter and Deltora Quest. By 13, I was way into classics, and devoured Sheakspeare's Hamlet all at once. By 16, I started to dive in some sociology, like Marx, and, by 18, into the deeps of Nietzsche's philosofy. Although I went through some of the biggest in history, like Kant or Plato, it is, now, Nietzsche's nihilistic mindset that catches most of my thoughts. I started only in my late's 22 to read some post-1900 serious books, like Foucault and Paulo Freire.", iconName: "reading"),
//                Milestone(name: "Politics & Sociology", description: "TODO", iconName: "cubeH"),
                
                
//                Milestone(name: "Drinks", description: "TODO", iconName: "cubeH"),
                Milestone(name: "Music", description: "I started to play yhe guitar when I was 14, in highschool. I immedietly felt in love with it, and found myself in its own way of expression. Later on, I got an acoustic guitar, and a bass, which I played in a band on 2015. ", iconName: "guitar"),
//                Milestone(name: "Puzzles", description: "TODO", iconName: "puzzle"),
//                Milestone(name: "Camping", description: "TODO", iconName: "camping"),
//                Milestone(name: "Soccer", description: "TODO", iconName: "soccer"),
                
            ], iconName: "hobbyIcon"),
            
            Story(name: "Personal Projects", milestones: [

                Milestone(name: "Auto Adventures", description: "This is my approach to low-level software. On this project, I'm learning about firmware and low power driven circuits. It's existence is justified when I get to automate simple home tasks, like turning of lights, and to document it on some vehicle. I'm mostly wiriting Medium articles about this project, so I can better undestand my process of documentation and share with the community my attempts of solving the sometimes common problems we face.", iconName: "autoadventures"),
                Milestone(name: "Horarios PUCPR", description: "This is another one of my favorites. I learned so much by doing this project I don't event jnow where to start. On the backend, I learned how to develop REST APIs, using Flask and Django, with both SQL (PostgreeSQL) and No-SQL (Firebase Realtime-database) databases. I also learned a lot about Web Scrapping, using BeautifulSoap and Pyppeteer, and learned a lot about networking and how the web works. I also used Flutter for mobile development, and the app was both beautiful on the front-end and consistent on consuming the API. ", iconName: "horariosPUCPR"),
                Milestone(name: "433 mHz RF", description: "This is my tackle at learning hardware. I tried to develop some radio communication using at most basic components, like resistors and capacitors, and ICs. It was a  joyful journey to learn about such low level technology, and a real challenge to understand and master such complex systems by reading datasheets and interacting with the community. ", iconName: "radio"),
                
            ], iconName: "personalIcon"),
                        
            Story(name: "Music", milestones: [

                Milestone(name: "Mashing Neighbours", description: "TODO", iconName: "cubeH"),
                Milestone(name: "Guitar", description: "TODO", iconName: "cubeH"),
                Milestone(name: "Acoustic Guitar", description: "TODO", iconName: "cubeH"),
                Milestone(name: "Rap", description: "TODO", iconName: "cubeH"),
                
            ], iconName: "guitarIcon"),
            
            Story(name: "Personal Goals & Interests", milestones: [
                
                Milestone(name: "Psychology", description: "TODO", iconName: "cubeH"),
                Milestone(name: "Game Dev", description: "TODO", iconName: "cubeH"),
                Milestone(name: "UI & Animation Design", description: "TODO", iconName: "cubeH"),
                Milestone(name: "Bussiness", description: "TODO", iconName: "cubeH"),
                Milestone(name: "Physics", description: "TODO", iconName: "cubeH"),
                
            ], iconName: "readingIcon"),
        ]
    }
    
    func getStory(at index: Int) -> Story? {
        if index  < 0 { return nil }
        if index >= stories.count { return nil }
        
        return self.stories[index]
    }
    
}
