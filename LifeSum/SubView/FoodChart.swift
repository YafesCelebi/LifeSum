//
//  FoodChart.swift
//  LifeSum
//
//  Created by H. Murat GÖÇMEZ on 3.07.2022.
//

import UIKit

class FoodChart: UIView {
    
    private var labelColor1 = UIColor(red: 0.73, green: 0.73, blue: 0.73, alpha: 1.00)
    private var lineColor1 = UIColor(red: 0.83, green: 0.83, blue: 0.83, alpha: 1.00)

    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var lblTitle: UILabel = {
        let label = UILabel()
        label.textColor = labelColor1
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .center
        label.text = AppData.sharedInstance.title
        label.translatesAutoresizingMaskIntoConstraints = false
    return label }()
    
    lazy var lblCalories: UILabel = {
        let label = UILabel()
        label.textColor =  UIColor(white: 1, alpha: 0.8)
        label.font = UIFont.systemFont(ofSize: 50)
        label.textAlignment = .center
        label.text = "\(AppData.sharedInstance.calories)"
        label.translatesAutoresizingMaskIntoConstraints = false
    return label }()
    
    lazy var lblCaloriesPerServe:UILabel = {
        let label = UILabel()
        label.textColor = labelColor1
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        label.text = "Calories per serving"
        label.translatesAutoresizingMaskIntoConstraints = false
    return label }()
    
    lazy var lblCarbsHeader: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.text = "CARBS"
        label.translatesAutoresizingMaskIntoConstraints = false
    return label }()
    
    lazy var lblCarbs: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.text = "\(Int(AppData.sharedInstance.carbs))%"
        label.translatesAutoresizingMaskIntoConstraints = false
    return label }()
    
    
    lazy var lblProteinHeader: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.text = "PROTEIN"
        label.translatesAutoresizingMaskIntoConstraints = false
    return label }()
    
    
    lazy var lblProtein: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.text = "\(Int(AppData.sharedInstance.protein))%"
        label.translatesAutoresizingMaskIntoConstraints = false
    return label }()
    
    lazy var lblFatHeader: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.text = "FAT"
        label.translatesAutoresizingMaskIntoConstraints = false
    return label }()
    
    lazy var lblFat: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.text = "\(Int(AppData.sharedInstance.fat))%"
        label.translatesAutoresizingMaskIntoConstraints = false
    return label }()
    
    lazy var btnMoreInfo: UIButton = {
        let btn = UIButton(type:.system)
        btn.setTitle("MORE INFO", for: .normal)
        btn.setTitleColor(UIColor(white: 1, alpha: 0.7), for: .normal)
        btn.titleLabel?.font =  UIFont.systemFont(ofSize: 25)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 36
       // btn.addTarget(self, action: #selector(btnMoreAction), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
    return btn }()
    
    override func draw(_ rect: CGRect) {
        self.addSubview(self.containerView)
        let widthcircle = self.frame.width*0.65
        self.containerView.frame = CGRect(x: widthcircle/4, y: self.frame.height*0.1, width: widthcircle, height: widthcircle)
        self.drawOval()
        self.addSubviews()
        self.setConstraint()
    }
    
    //add oval shape
    private func drawOval() {
        let path = UIBezierPath(ovalIn: containerView.bounds)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.orange.cgColor
        shapeLayer.lineWidth = 0
        shapeLayer.strokeColor = UIColor.black.cgColor
        self.containerView.backgroundColor = .clear
        self.containerView.layer.addSublayer(shapeLayer)
    }
    //set constraint of ui elements
    private func setConstraint() {
        
        self.lblTitle.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant:  self.containerView.frame.height*0.22).isActive = true
        self.lblTitle.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor).isActive = true
        self.lblTitle.widthAnchor.constraint(equalToConstant: self.frame.width*0.60).isActive = true
        self.lblTitle.heightAnchor.constraint(equalToConstant: self.frame.height*0.04).isActive = true
        self.lblTitle.layer.addBorder(edge: UIRectEdge.bottom, color: lineColor1, thickness: 2.0, labelX: self.containerView.frame.width*0.28, labelHeight: self.containerView.frame.height*0.15, lineWidth: self.containerView.frame.width*0.35)
        
        self.lblCalories.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor).isActive = true
        self.lblCalories.centerXAnchor.constraint(equalTo:self.containerView.centerXAnchor).isActive = true
        self.lblCalories.widthAnchor.constraint(equalToConstant: self.frame.width*0.30).isActive = true
        self.lblCalories.heightAnchor.constraint(equalToConstant: self.frame.height*0.08).isActive = true
        
        self.lblCaloriesPerServe.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant:  self.containerView.frame.height*0.6).isActive = true
        self.lblCaloriesPerServe.centerXAnchor.constraint(equalTo:self.containerView.centerXAnchor).isActive = true
        self.lblCaloriesPerServe.widthAnchor.constraint(equalToConstant: self.frame.width*0.50).isActive = true
        self.lblCaloriesPerServe.heightAnchor.constraint(equalToConstant: self.frame.height*0.04).isActive = true
    
        
        self.lblProteinHeader.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height*0.50).isActive = true
        self.lblProteinHeader.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor).isActive = true
        self.lblProteinHeader.widthAnchor.constraint(equalToConstant: self.frame.width*0.20).isActive = true
        self.lblProteinHeader.heightAnchor.constraint(equalToConstant: self.frame.height*0.04).isActive = true
        self.lblProteinHeader.layer.addBorder(edge: UIRectEdge.bottom, color: lineColor1, thickness: 2.0, labelX: 0, labelHeight: self.frame.height*0.05, lineWidth: self.frame.width*0.20)
        
        self.lblProtein.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height*0.55).isActive = true
        self.lblProtein.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor).isActive = true
        self.lblProtein.widthAnchor.constraint(equalToConstant: self.frame.width*0.18).isActive = true
        self.lblProtein.heightAnchor.constraint(equalToConstant: self.frame.height*0.04).isActive = true
        
        
        self.lblCarbsHeader.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height*0.50).isActive = true
        self.lblCarbsHeader.leftAnchor.constraint(equalTo: self.lblProteinHeader.leftAnchor, constant: self.frame.width*(-0.25)).isActive = true
        self.lblCarbsHeader.widthAnchor.constraint(equalToConstant: self.frame.width*0.2).isActive = true
        self.lblCarbsHeader.heightAnchor.constraint(equalToConstant: self.frame.height*0.04).isActive = true
        self.lblCarbsHeader.layer.addBorder(edge: UIRectEdge.bottom, color: lineColor1, thickness: 2.0, labelX: 0, labelHeight: self.frame.height*0.05, lineWidth: self.frame.width*0.2)
        
        self.lblCarbs.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height*0.55).isActive = true
        self.lblCarbs.leftAnchor.constraint(equalTo: self.lblProtein.leftAnchor, constant: self.frame.width*(-0.25)).isActive = true
        self.lblCarbs.widthAnchor.constraint(equalToConstant: self.frame.width*0.18).isActive = true
        self.lblCarbs.heightAnchor.constraint(equalToConstant: self.frame.height*0.04).isActive = true
        
        self.lblFatHeader.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height*0.50).isActive = true
        self.lblFatHeader.rightAnchor.constraint(equalTo: self.lblProteinHeader.rightAnchor, constant: self.frame.width*0.25).isActive = true
        self.lblFatHeader.widthAnchor.constraint(equalToConstant: self.frame.width*0.2).isActive = true
        self.lblFatHeader.heightAnchor.constraint(equalToConstant: self.frame.height*0.04).isActive = true
        self.lblFatHeader.layer.addBorder(edge: UIRectEdge.bottom, color: lineColor1, thickness: 2.0, labelX: 0, labelHeight: self.frame.height*0.05, lineWidth: self.frame.width*0.2)
        
        self.lblFat.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height*0.55).isActive = true
        self.lblFat.rightAnchor.constraint(equalTo: self.lblProtein.rightAnchor, constant: self.frame.width*0.25).isActive = true
        self.lblFat.widthAnchor.constraint(equalToConstant: self.frame.width*0.18).isActive = true
        self.lblFat.heightAnchor.constraint(equalToConstant: self.frame.height*0.04).isActive = true
 
        self.btnMoreInfo.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height*0.80).isActive = true
        self.btnMoreInfo.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor).isActive = true
        self.btnMoreInfo.widthAnchor.constraint(equalToConstant: self.frame.width*0.85).isActive = true
        self.btnMoreInfo.heightAnchor.constraint(equalToConstant: self.frame.width*0.19).isActive = true
    }
    
    // add ui elements to view
    private func addSubviews(){
        self.containerView.addSubview(self.lblTitle)
        self.containerView.addSubview(self.lblCalories)
        self.containerView.addSubview(self.lblCaloriesPerServe)
        self.addSubview(self.lblProteinHeader)
        self.addSubview(self.lblProtein)
        self.addSubview(self.lblCarbsHeader)
        self.addSubview(self.lblCarbs)
        self.addSubview(self.lblFatHeader)
        self.addSubview(self.lblFat)
        self.addSubview(self.btnMoreInfo)
    }
    
    
}
