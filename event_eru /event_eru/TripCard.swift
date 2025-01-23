//
//  TripCard.swift
//  eru_etkinlik
//
//  Created by şeyma gizem sivri on 30.10.2024.
//


import SwiftUI

struct TripCard: Identifiable,Hashable{
  var id : UUID = .init()
  var title : String
  var subTitle : String
  var image : String
  let type: String
}


var TripCards : [TripCard] = [
  .init(title: "etkinlik5", subTitle: "Sine Tekno 2", image: "et5",type: "Sinema"),
  .init(title: "etkinlik1", subTitle: "Kariyer ve Kişisel Gelişim Eğitimi", image: "et1",type: "Eğitim"),
  .init(title: "etkinlik2", subTitle: "Aşı Bilimi Kongresi", image: "et2",type: "Kongre"),
  .init(title: "etkinlik3", subTitle: "Evim Kampüs Festivali", image: "et3",type: "Konser"),
  .init(title: "etkinlik4", subTitle: "Prof. Dr. Mete Gündoğan Kongresi", image: "et4",type: "Kongre")

]
