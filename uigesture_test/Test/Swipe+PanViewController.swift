//
//  Swipe+PanViewController.swift
//  uigesture_test
//
//  Created by SeoYeon Hong on 2021/08/10.
//

import UIKit

class Swipe_PanViewController: UIViewController {
    let mView = UIView()
    var slides: [Slide] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //mView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
        mView.frame = CGRect(x: 0, y: 0, width: view.frame.width * CGFloat(4), height: 300)
        
        view.addSubview(mView)
        mView.translatesAutoresizingMaskIntoConstraints = false
        mView.backgroundColor = .systemGray6
        slides = createSlides()
        for i in 0 ..< 4 {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: 300)
            mView.addSubview(slides[i])
        }
    }
    
    func createSlides() -> [Slide] {
        let slide1 = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.slide.backgroundColor = .blue

        let slide2 = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.slide.backgroundColor = .yellow

        let slide3 = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.slide.backgroundColor = .orange

        let slide4 = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide4.slide.backgroundColor = .green

        return [slide1, slide2, slide3, slide4]
    }


   

}
