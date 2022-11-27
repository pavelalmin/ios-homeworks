//
//  Post.swift
//  navigation
//
//  Created by Pavel Almin on 14.09.2022.
//

import Foundation
import UIKit

struct DataSource {
    let author: String?
    let image: String?
    let description: String?
    let likes: Int?
    let views: Int?
    var title: String?
}

class Post {

    static func getDataSource() -> [DataSource]{

        let dataSource = [
            DataSource(author: "Владлен Минаев", image: "Screenshot", description: "Ваше приложение должно полностью соответствовать макетам. Не делайте ничего лишнего, это усложнит проверку Вашей работы.", likes: 34, views: 100),
            DataSource(author: "Петр Голубков", image: "Screenshot1", description: "Happy to pick our tradition back up again: Free event in the Port of Ibiza on Wednesday, 21 September 2022. Happy to pick our tradition back up again: Free event in the Port of Ibiza on Wednesday, 21 September 2022. Happy to pick our tradition back up again: Free event in the Port of Ibiza on Wednesday, 21 September 2022", likes: 346, views: 1050),
            DataSource(author: "Елена Гулаева", image: "Screenshot2", description: "Рад снова возобновить нашу традицию: бесплатное мероприятие в порту Ибицы в среду, 21 сентября 2022 г.", likes: 324, views: 600),
            DataSource(author: "Саша Брин", image: "Screenshot4", description: "Rad snova vozobnovit' nashu traditsiyu: besplatnoye meropriyatiye v portu Ibitsy v sredu, 21 sentyabrya 2022 g. Rad snova vozobnovit' nashu traditsiyu: besplatnoye meropriyatiye v portu Ibitsy v sredu, 21 sentyabrya 2022 g. Rad snova vozobnovit' nashu traditsiyu: besplatnoye meropriyatiye v portu Ibitsy v sredu, 21 sentyabrya 2022 g.", likes: 54, views: 1000)
        ]
        return dataSource
    }
}
