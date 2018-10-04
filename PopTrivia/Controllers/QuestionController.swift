//
//  QuestionController.swift
//  PopTrivia
//
//  Created by Markus Varner on 10/4/18.
//  Copyright © 2018 CreakyDoor. All rights reserved.
//

import Foundation

class QuestionController{
    
    //singleton
    static let shared = QuestionController()
    private init (){}
    
    //Source of Truth
    var genreDict : [String : [Topic]] = [:]
    
}

extension QuestionController{
    
    func createQuiz(){
        //Topic Marvel
        
        let m1 = Question(questionText: "Chris Evans turned down the role of Captain America twice before accepting it, because he initially wasn't comfortable taking on that level of commitment and fame.", correctAnswer: true)
        let m2 = Question(questionText: "Iron Man director Jon Favreu insisted that Robert Downey Jr not star in it, despite the suggestion being suggested multiple times. He finally gave in.", correctAnswer: false)
        let m3 = Question(questionText: "There’s a reference to Black Panther in Iron Man 2, as Wakanda is shown on the map in the background.", correctAnswer: true)
        let m4 = Question(questionText: "The ship in Guardians of the Galaxy is called Madonna after Peter Quill’s childhood crush, Madonna.", correctAnswer: false)
        let m5 = Question(questionText: "Both Chris Hemsworth and his brother Liam auditioned for the role of Thor.", correctAnswer: true)
        let m6 = Question(questionText: "Jeremy Renner was helped by Special Olympic archers to prepare for playing Hawkeye.", correctAnswer: false)
        let m7 = Question(questionText: "Neil de Grasse Tyson worked on Doctor Strange by advising on science and philosophy.", correctAnswer: false)
        let m8 = Question(questionText: "Pre-Avengers, Mark Ruffallo was actually considered to play Hulk in The Incredible Hulk.", correctAnswer: true)
        let m9 = Question(questionText: "The “catch up” list Captain America carries with him in The Winter Soldier is different for different countries.", correctAnswer: true)
        let m10 = Question(questionText: "The \"He's my friend from work!\" line in Thor: Ragnarok was suggested by a child from the Make a Wish foundation who was visiting the set that day.", correctAnswer: true)
        
        let mQuestions: [Question] = [m1,m2,m3,m4,m5,m6,m7,m8,m9,m10]
        
        let topicMarvel = Topic(name: "Marvel", questions: mQuestions)
        
        //Topic DC
        
        let d1 = Question(questionText: "Batman's suit is made from the strongest material known in any comic universe. Plot Armor.", correctAnswer: true)
        let d2 = Question(questionText: "According to Superman: Birthright, Superman has the power to see the the “aura” of all living creatures. Refusing to take any life and extinguish this “life-energy,” the Man of Steel abstains from eating meat and becomes a vegetarian.", correctAnswer: true)
        let d3 = Question(questionText: "Tim Burton listened to Prince’s music constantly while shooting Batman, and said the musician’s songs had a major influence on the creation of the film’s version of the Joker. Prince eventually wrote songs for the film, but Burton reportedly hated them and only used them because he was contractually obliged.", correctAnswer: true)
        let d4 = Question(questionText: "Batman Kills the Joker at the end of the Dark Knight", correctAnswer: false)
        let d5 = Question(questionText: "Heath Ledger died after watching Batman V Superman in 2016", correctAnswer: false)
        let d6 = Question(questionText: "David Bowie was considered to play the Joker in Tim Burton’s 1989 Batman film. Though the role went to Jack Nicholson, a few Batman comic artists continue to base their drawings of the Joker on David Bowie.", correctAnswer: true)
        let d7 = Question(questionText: "Zack Snyder briefly considered hiring former-Batman actor Michael Keaton to play a completely new role in Batman v Superman: Dawn of Justice, in order to emphasize it’s distinction from The Dark Knight trilogy.", correctAnswer: false)
        let d8 = Question(questionText: "Introduced as a member of the Green Lantern Corps in 1985, Dkrtzy RRR is a sentient math equation.", correctAnswer: true)
        let d9 = Question(questionText: "When permitted a chance to write his own Batman series, Clerks director Kevin Smith retroactively rewrote one of the most pivotal scenes from the origin comic Batman: Year One to include the Dark Knight peeing himself in fright.", correctAnswer: true)
        let d10 = Question(questionText: "Batman does not wear boots in Batman Returns. Instead, his Batsuit is comprised of body armor connected to a pair of Air Jordan 6.", correctAnswer: true)
        
        let dQuestions: [Question] = [d1,d2,d3,d4,d5,d6,d7,d8,d9,d10]
        let topicDC = Topic(name:"DC", questions: dQuestions)
        
        //Topic Harry Potter
        let hp1 = Question(questionText: "The scenes at 4 Privet Drive were originally shot on an actual street with real houses. They shot in a real house in a community called Picket Post Close. But they ended up having to build identical model houses because they didn't have access to the house for reshoots.", correctAnswer: true)
        let hp2 = Question(questionText: "Every letter to Harry were actually hand written — TWICE. The first batch of Hogwarts acceptance letters the graphics team hand wrote for the movie turned out to be too heavy for the owls to carry, which meant that they had to individually hand write thousands of them all over again!", correctAnswer: true)
        let hp3 = Question(questionText: "The producers tried to give Daniel Radcliffe green eyes like in the books, but failed. Sadly, Daniel had a terrible allergic reaction to his green contact lenses and had to stop wearing them. He is now blind.", correctAnswer: false)
        let hp4 = Question(questionText: " The trio's reaction to the great hall was real. The cast hadn't seen the great hall prior to shooting the sorting hat scene.", correctAnswer: true)
        let hp5 = Question(questionText: "The Duke Humfrey's Library made a huge exception for filming The Restricted Section scene. Even though the historic library usually strictly forbids bringing flames into the library for any reason, they made an exception for Harry Potter. It was the first exception in hundreds of years.", correctAnswer: true)
        let hp6 = Question(questionText: "J.K. Rowling could have played Harry's mom. She was offered the role of Lily Potter in the Mirror of Erised scene, but she turned it down and the role went to Geraldine Somerville instead.", correctAnswer: true)
        let hp7 = Question(questionText: "J.K. Rowlings requested that the entire cast be White.", correctAnswer: false)
        let hp8 = Question(questionText: "No cars were harmed in the making of the Whomping Willow scene. The Ford Anglia was unharmed while filming the scene where Harry and Ron crashed into the Whomping Willow.", correctAnswer: false)
        let hp9 = Question(questionText: "Rupert Grint has an actual severe case of arachnophobia. So he didn't have to do much acting in the scene where he and Harry meet Aragog.", correctAnswer: true)
        let hp10 = Question(questionText: "The radish earrings worn by Luna Lovegood weren't actually made by Evanna Lynch, the actress who played her.", correctAnswer: false)
        
        
        let hpQuestions: [Question] = [hp1,hp2,hp3,hp4,hp5,hp6,hp7,hp8,hp9,hp10]
        let topicHarryPotter = Topic(name:"Harry Potter", questions: hpQuestions)
        
        //Genre Movie
        let movieTopics: [Topic] = [topicMarvel,topicDC,topicHarryPotter]
        genreDict["Movies"] = movieTopics
        
    }
    
}

