//
//  CreateItemVC.swift
//  Practice
//
//  Created by Berkin Sili on 23.11.2019.
//  Copyright © 2019 Berkin Sili. All rights reserved.
//

//TODO: - HANDLE INPUT EVENTS, ADD ATTRIBUTE TO UI ELEMENTS, MAKE UI FIXES, ADD CATEGORY COLOR TO DORPDOWN CELLS, CHANGE DROP DOWN INPUT TYPE TO BUTTON

import UIKit

class CreateItemVC: UIViewController {
    
    var interactor: CreateItemBusinessLogic?

    //MARK: - UIElements
    var formContainerView =  UIView()
    
    var itemNameLabel = UILabel()
    var dueDateLabel = UILabel()
    var notesLabel = UILabel()
    var categoryNameLabel = UILabel()
    
    var itemNameTextField = UITextField()
    var dueDateTextField = UITextField()
    var notesTextView = UITextView()
    var categoryNameTextField = UITextField()
    var categoryNamesDropDown = DropDownView()
    
    var doneButton = UIButton()
    
    //MARK: - Variables
    var itemModel: CreateItemModel? //TODO: - Update as user Inputs
    var categoryNameList: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.vcInitialized()
        self.itemModel = CreateItemModel()
    }
    //MARK: Constants
    private let vSOfLines: CGFloat = 10.0//VerticalSpaceOfLines
    private let hSToContainer: CGFloat = 20.0 //horizontalSpaceToContainer
    private let heOfLine: CGFloat = 30.0 //heightOfLine
    private let wiOfLabel: CGFloat = 60.0//widthOfLabel
    private let leOfInputFields: CGFloat = 20.0//leadingOfInputFields
    private let vsOfButton: CGFloat = 30.0//vertical space to form view of done button
    
    private let delayBeforeDismiss = 2.0

    
    //MARK: UI Setup
    private func setupContainerView() {
        self.view.addSubview(formContainerView)
        formContainerView.translatesAutoresizingMaskIntoConstraints = false
        formContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 4/5).isActive = true
        formContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/3).isActive = true
        formContainerView.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1).isActive = true
        formContainerView.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 1).isActive = true
    }
    private func addLabelToContainer(labelView: UIView, top: UIView) {
        DispatchQueue.main.sync {
            labelView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                labelView.topAnchor.constraint(equalTo: top.topAnchor, constant: self.vSOfLines),
                labelView.leadingAnchor.constraint(equalTo: formContainerView.leadingAnchor, constant: self.hSToContainer),
                labelView.bottomAnchor.constraint(equalTo: labelView.topAnchor, constant: heOfLine),
                labelView.trailingAnchor.constraint(equalTo: labelView.leadingAnchor, constant: wiOfLabel)
            ])
            self.formContainerView.addSubview(labelView)
        }
    }
    private func addTextFieldToContainer(textField: UIView, leading: UIView) {
        DispatchQueue.main.sync {
            textField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                textField.topAnchor.constraint(equalTo: leading.topAnchor, constant: 0),
                textField.leadingAnchor.constraint(equalTo: leading.trailingAnchor, constant: leOfInputFields),
                textField.bottomAnchor.constraint(equalTo: leading.bottomAnchor, constant: 0),
                textField.trailingAnchor.constraint(equalTo: formContainerView.trailingAnchor, constant: hSToContainer)
            ])
            self.formContainerView.addSubview(textField)
        }
    }
    private func addNotesInputField() {
        DispatchQueue.main{
            notesTextView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                notesTextView.topAnchor.constraint(equalTo: notesLabel.topAnchor, constant: 0),
                notesTextView.leadingAnchor.constraint(equalTo: notesLabel.trailingAnchor, constant: leOfInputFields),
                notesTextView.bottomAnchor.constraint(equalTo: notesLabel.bottomAnchor, constant: 0),
                notesTextView.trailingAnchor.constraint(equalTo: formContainerView.trailingAnchor, constant: hSToContainer)
            ])
            self.formContainerView.addSubview(notesTextView)
        }
    }
    
    private func addDoneButton(){
        DispatchQueue.main {
            doneButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                doneButton.widthAnchor.constraint(equalTo: formContainerView.widthAnchor, multiplier: 2/3),
                doneButton.centerXAnchor.constraint(equalTo: formContainerView.centerXAnchor),
                doneButton.bottomAnchor.constraint(equalTo: formContainerView.bottomAnchor, constant: vsOfButton),
                doneButton.heightAnchor.constraint(equalToConstant: 40.0)
            ])
            self.formContainerView.addSubview(doneButton)
        }
    }
    
    private func openDropDown() {
        DispatchQueue.main {
            categoryNamesDropDown.delegate = self
            let width = categoryNameTextField.frame.width
            let height: CGFloat = 100.0
            let dropDownX = categoryNameTextField.frame.origin.x
            let dropDownY = categoryNameTextField.frame.origin.y + categoryNameTextField.frame.height
            categoryNamesDropDown.configureDropDownMenu()
            
            categoryNamesDropDown.frame = CGRect(x: dropDownX, y: dropDownY, width: width, height: height)
            view.addSubview(categoryNamesDropDown)
        }
    }
    
    
    //MARK: - Private functions
    private func showError(message:String) {
        //TODO: - Implement
    }
    
    private func displayNameTakenError(message: String) {
        //TODO: Implement
    }
    
    private func displaySuccessMessage(message: String) {
        //TODO: Display Success Message
    }
    
    private func showCategoryList(names: [String]) {
        self.openDropDown()
    }
}

extension CreateItemVC: CreateItemDisplayLogic {
    func setupUI(vm: CreateItemVM) {
        self.vm = vm
        DispatchQueue.main.sync {
            setupContainerView()
            
            addLabelToContainer(labelView: categoryNameLabel, top: formContainerView)
            categoryNameLabel.text = vm.parentCategoryLabel
            addLabelToContainer(labelView: itemNameLabel, top: itemNameLabel)
            itemNameLabel.text = vm.itemNameLabel
            addLabelToContainer(labelView: dueDateLabel, top: itemNameLabel)
            dueDateLabel.text = vm.dueDateLabel
            addLabelToContainer(labelView: notesLabel, top: dueDateLabel)
            notesLabel.text = vm.notesLabel
            
            addDoneButton()
            doneButton.titleLabel?.text = vm.doneButton
            
            addTextFieldToContainer(textField: categoryNameTextField, leading: categoryNameLabel)
            addTextFieldToContainer(textField: itemNameTextField, leading: itemNameLabel)
            addTextFieldToContainer(textField: dueDateTextField, leading: dueDateLabel)
            addNotesInputField()
        }
    }
    func signContract() {
        let interactor = CreateItemInteractor()
        let presenter = CreateItemPresenter()
        self.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = self
    }
    
    func displayCategoryList(categoryNames: [String]) {
        self.categoryNameList = categoryNames
    }
    
    func displayError(message: String) {
        self.showError(message: message)
    }
    
    func displayNameError(message: String) {
        self.displayNameTakenError(message)
    }
    
    func displaySuccess(message: String) {
        self.displaySuccessMessage(message: message)
        DispatchQueue.main.asyncAfter(deadline: .now() + delayBeforeDismiss) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func doneButtontapped(with item: CreateItemModel) {
        interactor?.createItem(with: item)
    }
}
extension CreateItemVC: DropDownContainerProtocol {
    func getOptions() -> [String] {
        return self.categoryNameList ?? []
    }
    
    func setSelected(index: Int) {
        categoryNameTextField.text = categoryNameList?[index]
        self.itemModel?.parentCategoryIndex = index
    }
    
    
}
