//
//  ViewController.swift
//  PedirDatosDelServidor
//
//  Created by Netzer Rivera on 03/12/15.
//  Copyright © 2015 Netzer Rivera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var isbn: UITextField!
    @IBOutlet weak var texto: UITextView!
    
    @IBOutlet weak var limpiar: UIButton!
    @IBAction func limpiando(sender: AnyObject) {
        
        isbn.text = ""
    
    }
    
    @IBAction func buscar(sender: AnyObject) {
        texto.text = buscandoLibro(isbn.text!)
    }
    
    func buscandoLibro(idPagina: String)->String
    {
        let destino="https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + idPagina
        let url = NSURL(string: destino)
        let datos : NSData? = NSData(contentsOfURL: url!)
        
        if datos == nil
        {
            return ("Problemas con internet")
            
            
        }
        var dat = NSString(data: datos!, encoding: NSUTF8StringEncoding)
        if dat! as String == "{}" {
            dat = "No encontrado"
            
            
        }
        return dat! as String
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

}

