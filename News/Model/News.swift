//
//  News.swift
//  News
//
//  Created by Taron on 19.07.22.
//

import Foundation
import UIKit

struct News {
    let image: UIImage?
    let articleTitle: String
    let articleText: String
    let publishDate: String
    let tags: [String]
    let source: String
    let sourceURL: String
    let viewsCount: Int
    let likesCount: Int
    let dislikesCount: Int
    
    static let dummy = [
        News(image: UIImage(named: "putinerdogan"), articleTitle: "Putin to meet Erdoğan in Iran", articleText: "Russian President Vladimir Putin is set to meet his Turkish counterpart Recep Tayyip Erdoğan in Iran next week as international efforts intensify to unblock Black Sea shipping routes and allow the resumption of Ukrainian grain shipments. Kremlin spokesman Dmitry Peskov confirmed reports the meeting will take place when Putin is in Tehran next Tuesday. “We informed about the upcoming high-level contacts between Putin and Erdoğan, this meeting will also be held there,” he said. Erdoğan spoke by phone Monday with Putin and Ukraine’s President Volodymyr Zelenskyy, seeking an agreement to relax Russia’s blockade of Ukrainian seaports and allow grain exports to resume.", publishDate: "19/07/22 13:00", tags:["Politics", "Russia", "Turkey", "Ukraine", "Iran"], source: "www.politico.eu", sourceURL: "https://www.politico.eu/article/vladimir-putin-russia-recep-tayyip-erdogan-turkey-to-meet-in-iran-visit/", viewsCount: 2000, likesCount: 900, dislikesCount: 1100),
        News(image: UIImage(named: "covid"), articleTitle: "One in 18 has Covid in the UK", articleText: "Nearly 3.5 million people, or one in 18, has the virus - that's up from 2.7m, or one in 25, the week before. The rise is being driven by fast-spreading sub-variants of Omicron, called BA.4 and BA.5.", publishDate: "18/07/22 16:44", tags: ["Virus", "Covid", "Covid19", "Pandemic", "Infection", "BBC", "UK"], source: "www.bbc.com", sourceURL: "https://www.bbc.com/news/health-62176865", viewsCount: 12000, likesCount: 467, dislikesCount: 5100),
        News(image: UIImage(named: "jlo"), articleTitle: "J Lo and Ben Affleck Marry in Las Vegas", articleText: "Months after getting engaged, the celebrity couple obtained a marriage license in Nevada over the weekend. On Sunday (July 17), Lopez confirmed the happy news of their Las Vegas wedding in a heartfelt letter sent to fans subscribed to her “On the JLo” mailing list. “We did it,” Lopez announced in the newsletter, which featured a number of personal wedding day snapshots. “Love is beautiful. Love is kind. And it turns out love is patient. Twenty years patient.”.She went on to describe the couple’s day: “Exactly what we wanted. Last night we flew to Vegas, stood in line for a license with four other couples, all making the same journey to the wedding capital of the world. Behind us two men held hands and held each other. In front of us, a young couple who made the three hour drive from Victorville on their daughter’s second birthday — all of us wanting the same thing — for the world to recognize us as partners and to declare our love to the world through the ancient and nearly universal symbol of marriage.”", publishDate: "18/07/22 13:55", tags: ["JLo", "BenAffleck", "Marriage", "Vegas", "Celebrities"], source: "www.billboard.com", sourceURL: "https://www.billboard.com/music/music-news/jennifer-lopez-ben-affleck-married-1235115262/", viewsCount: 25000, likesCount: 4500, dislikesCount: 965),
        News(image: UIImage(named: "zombie"), articleTitle: "Rob Zombie's The Munsters Sets Streaming Debut", articleText: "Following last week’s release of the trailer for The Munsters, director Rob Zombie took to Instagram to announce that his highly-anticipated adaptation will officially be heading to Netflix this coming fall. In his post, Zombie shares his excitement about the horror comedy remake’s coinciding release with Tim Burton’s The Addams Family series Wednesday.", publishDate: "17/07/22 17:30", tags: ["Movies", "TVShows", "Zombies", "Addams", "ComingSoon", "2022"], source: "www.comingsoon.net", sourceURL: "https://www.comingsoon.net/movies/news/1231039-rob-zombie-the-munsters-streaming-debut", viewsCount: 16000, likesCount: 3400, dislikesCount: 1200)
    ]
}
