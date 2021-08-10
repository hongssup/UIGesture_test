//
//  PageControlLandscapeViewController.swift
//  uigesture_test
//
//  Created by SeoYeon Hong on 2021/08/03.
//

import UIKit

class PageControlLandscapeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
    @IBOutlet weak var contentView: UIView!
    
    var slides: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
    }

    func createSlides() -> [UIView] {
        let slide1 = UIView()
        slide1.backgroundColor = .blue
        
        let slide2 = UIView()
        slide2.backgroundColor = .yellow
        
        let slide3 = UIView()
        slide3.backgroundColor = .orange
        
        let slide4 = UIView()
        slide4.backgroundColor = .green
        
        return [slide1, slide2, slide3, slide4]
    }
    
    func setupSlideScrollView(slides : [UIView]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: bgView.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width, height: bgView.frame.height * CGFloat(slides.count))
        //scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollView.frame.height * 4)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: 0, y: (bgView.frame.height) * CGFloat(i), width: view.frame.width, height: bgView.frame.height)
            scrollView.addSubview(slides[i])
        }
    }

}
