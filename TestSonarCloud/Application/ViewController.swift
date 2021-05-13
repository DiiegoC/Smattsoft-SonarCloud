//
//  ViewController.swift
//  TestSonarCloud
//
//  Created by Diego Cruz on 29/04/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableMascotas: UITableView!
    var listaMascotas = [Mascotas]()
    var imagenesAnimales = [aguila, gato, perro, hamster, tortuga]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuracionInicial()
    }

    /// # Funciones
    func configuracionInicial() {
        configureNavigationDefault()
        tableMascotas.dataSource = self
        tableMascotas.delegate = self
        print("")
        let x = 10
        if x > 0 {
            if x > 8 {
                if x > 9 {
                    if x == 12 {
                        print("igual")
                    }
                }
            }
        }
    }
    
    func moveTable() {
        if listaMascotas.count > 8 {
            let indexPath = IndexPath(row: listaMascotas.count - 1, section: 0)
            tableMascotas.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    func displayMyAlertMessage(_ title: String, userMessage: String) {
        let myAlert = UIAlertController(title: title, message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: TextosApp.btnAccep.rawValue, style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        present(myAlert, animated: true, completion: nil)
    }
    
    @IBAction func agregarMascotaNueva(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: TextosApp.addTitle.rawValue, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: TextosApp.btnCance.rawValue, style: .cancel, handler: nil))
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = TextosApp.placeholder.rawValue
        })
        alert.addAction(UIAlertAction(title: TextosApp.btnAccep.rawValue, style: .default, handler: { [self] action in
            if !alert.textFields!.first!.text!.isEmpty, let name = alert.textFields?.first?.text {
                listaMascotas.append(Mascotas(nombre: name, imagen: imagenesAnimales.randomElement()!))
                tableMascotas.reloadData()
                moveTable()
            } else {
                displayMyAlertMessage(MSJAddMascota.msjTitle.rawValue, userMessage: MSJAddMascota.msjMessage.rawValue)
            }
        }))
        self.present(alert, animated: true)
    }
}

//MARK: OTHER SOURCES
/// # Extensión: Tabla
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaMascotas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = listaMascotas[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TextosApp.cellID.rawValue)
        cell?.textLabel?.text = item.nombre
        cell?.textLabel?.numberOfLines = 0
        cell?.imageView?.clipsToBounds = true
        cell?.imageView?.frame.size = CGSize(width: 24, height: 24)
        cell?.imageView?.layer.cornerRadius = 10
        cell?.imageView?.image = UIImage(named: item.imagen)
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = listaMascotas[indexPath.row]
        let message = "\(item.nombre) es un \(item.imagen)"
        let message2 = "\(item.nombre) es una \(item.imagen)"
        let msjInfo = item.imagen == "tortuga" ? message2 : message
        displayMyAlertMessage(TextosApp.msjTittle.rawValue, userMessage: msjInfo)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

/// # Extensión: Barra de navegación
extension UIViewController {
    func configureNavigationDefault() {
        title = TextosApp.titleApp.rawValue
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = UIColor.blue
        let titleDict: NSDictionary = [NSAttributedString.Key.foregroundColor: UIColor.blue]
        navigationController?.navigationBar.titleTextAttributes = titleDict as?
            [NSAttributedString.Key: Any]
        navigationController?.navigationBar.largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.blue]
    }
}
