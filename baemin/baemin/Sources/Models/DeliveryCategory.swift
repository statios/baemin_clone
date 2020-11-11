//
//  Category.swift
//  baemin
//
//  Created by Stat.So on 2020/11/11.
//

import UIKit

enum DeliveryCategory: CaseIterable {
  case fastfood
  case seafood
  case chicken
  case pizza
  case sushi
  case rice
  case bakery
  case coffee
}

extension DeliveryCategory {
  var image: UIImage? {
    switch self {
    case .fastfood: return Image.Illust.fastfood42
    case .seafood: return Image.Illust.seafood42
    case .chicken: return Image.Illust.chicken42
    case .pizza: return Image.Illust.pizza42
    case .sushi: return Image.Illust.sushi42
    case .rice: return Image.Illust.rice42
    case .bakery: return Image.Illust.bakery42
    case .coffee: return Image.Illust.coffee42
    }
  }
  var title: String {
    switch self {
    case .fastfood: return Text.seafood
    case .seafood: return Text.fastfood
    case .chicken: return Text.chicken
    case .pizza: return Text.pizza
    case .sushi: return Text.sushi
    case .rice: return Text.rice
    case .bakery: return Text.bakery
    case .coffee: return Text.coffee
    }
  }
}
