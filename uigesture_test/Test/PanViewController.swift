//
//  PanViewController.swift
//  uigesture_test
//
//  Created by SeoYeon Hong on 2021/07/02.
//

import UIKit

class PanViewController: UIViewController {

    @IBOutlet weak var panView: UIView!
    var view1 = UIView()
    var view2 = UIView()
    var view3 = UIView()
    var viewIndex: Int = 1
    var width: CGFloat?
    var height: CGFloat?

    override func viewDidLoad() {
        super.viewDidLoad()
        let safearea = view.safeAreaLayoutGuide.layoutFrame
        //let width:CGFloat = safearea.width
        //let height:CGFloat = panView.bounds.size.height
        
        panView.addSubview(view3)
        panView.addSubview(view2)
        panView.addSubview(view1)
        panView.subviews.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        view1.backgroundColor = .blue
        view2.backgroundColor = .orange
        //view1.frame = CGRect(x: 0, y: 0, width: height, height: height)
        view1.centerXAnchor.constraint(equalTo: panView.centerXAnchor).isActive = true
        view1.heightAnchor.constraint(equalTo: panView.heightAnchor).isActive = true
        view1.widthAnchor.constraint(equalTo: panView.widthAnchor).isActive = true
        width = CGFloat(panView.frame.width)
        //view1.frame.width = CGFloat(panView.frame.width)
        height = CGFloat(panView.frame.height)
        //view1.center = view.center
        //view2.frame = CGRect(x: view.bounds.width/2, y: 0, width: swipeView.frame.height, height: swipeView.frame.height)
 
        var views = [view1, view2, view3]
        
        panView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    }
    

    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: panView)
        let width = CGFloat(width!)
        print(width)
        switch gesture.state {
        case .began:
            //print("began")
            break
        case .changed:
            
            view1.transform = CGAffineTransform(translationX: translation.x, y: 0)
            break
        case .ended:
            //UIView.animate(withDuration: 0.4, animations: { self.view1.transform = .identity })
            if translation.x < 0 {
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: { self.view1.transform = CGAffineTransform(translationX: -width, y: 0) })
            } else {
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: { self.view1.transform = CGAffineTransform(translationX: width, y: 0) })
            }
            
            break
        default:
            break
        }
    }

}
