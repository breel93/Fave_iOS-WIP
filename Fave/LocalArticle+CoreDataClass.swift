//
//  LocalArticle+CoreDataClass.swift
//  Fave
//
//  Created by Kola Emiola on 10/07/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//
//

import Foundation
import CoreData


class LocalArticle: NSManagedObject {
  @nonobjc class func fetchRequest() -> NSFetchRequest<LocalArticle> {
    return NSFetchRequest<LocalArticle>(entityName: "LocalArticle")
  }
  
  @NSManaged var title: String?
  @NSManaged var articleDescription: String?
  @NSManaged var author: String?
  @NSManaged var url: URL?
  @NSManaged var urlToImage: String?
  @NSManaged var savingDate: Date?
  @NSManaged var source: String?
  
  static func saveArticle(_ article: Article) {
    let localArticle = LocalArticle(context: CoreDataManager.shared.managedObjectContext)
    
    localArticle.title = article.title
    localArticle.articleDescription = article.description
    localArticle.urlToImage = article.urlToImage
    localArticle.url = article.url
    localArticle.savingDate = Date()
    localArticle.source = article.source?.name
  }
}
