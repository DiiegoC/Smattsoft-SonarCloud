//
//  ReglasSwift.swift
//
//  Created by Diego Cruz on 07/05/21.
//

// MARK: REGLAS PARA CODIFICACIÓN IOS

////  Parameter - SINTAXIS
///
/// # Los archivos deberán de contener 400 líneas de código como máximo
/// # Las clases deberán de contener 200 líneas de código como máximo, utilizar extensiones para lograr esta cantidad.
/// # Las líneas de código deberán de ser menores a 120 caracteres (recomendación)


////  Parameter - SINTAXIS
/// # Las variables deberán de estar en notación de camello
    var NombreUsuario: String = ""     //Incorrecto
    static let SERVER = "SERVER"       //Incorrecto
    var nombreCliente: String = ""     //
    var ciudadNacimiento = ""          // Correcto
    var nombreComprador: String = ""      //

/// # Las declaraciones de enumeraciones deben de comenzar por una mayuscula
enum tipoUsuario {
    /// Los diferentes paramaetros dentro de la enumeración deben de comenzar con minuscula. (camel case)
    case Administrador  //Incorrecto
    case VENDEDOR       //Incorrecto
    case usuarioNormal  //Correcto
    case comprador      //Correcto
}

/// # No utilizar acentos o simbolos y caracteres especiales en nombres de funciones, variables, métodos, etc.
    @IBOutlet weak var LabelOpciónCliente: UILable!     //Incorrecto
    @IBOutlet weak var labelOpcionCliente: UILable!     //Correcto

/// # Las funciones no deberán de estar vacías, agrega un comentario diciendo porque lo está.
    func init() {}                               // Incorrecto
    func obtenerDatos() {}                       // Incorrecto
    func didChangueServer(successfully: Bool) {} // Incorrecto
    func didChangueServer(successfully: Bool) {  // Correcto
        //Some action
    }
    func init() {
        //Add init func - It's empty 'cause ....
    }

/// # No agregar variables con codigo sensible como direcciones IP o URL's.
/// Es necesario que estos datos estén codificados o vengan desde un WS. Lo ideal es que sea encriptado o codificado.
    var urlServer = "https://www.google.com.mx/"       //Incorrecto
///Se puede optar por codificar el dato en diferentes segmentos como es el ejemplo de abajo.
    var urlServerVC: String {
        return "\("https://" + "google" + ".com.mx/")"
    }
/// Tambien, para que no se defina como una ruta o URL o se lea como un error de la norma S1075 se puede optar por:
    var url1 = "https://"       // El separador "/" debe de ir al final de la linea que agrega
    var url2 = "google.com/"    // Evite agregar el delimitador "/" al inicio de su variable, de lo contrario, se reconocerá como una URL, aunque esta no lo sea
    let urlFalsa = "/nombreDeUsuario/" //De esta forma es una URL falsa positiva. Elimine el primer "/" y concatenela al final del elemento anterior o delimite con un "/" + "etc".

/// # Desùés de una "," deberá de ir un espacio, y cuando se usen ":", no deberá de haber un espacio antes pero si uno después de utilizarlo. Aplica en cualquier declaración de función, variable, outlet, etc.
    var ciudadNacimiento : String()     //Incorrecto
    var ciudadNatal: String()     //Correcto

/// # Evitar este tipo de validaciones, tambien evitar el uso de paréntesis en funciones condicionales.
    if !(nombreCliente == nombreComprador) {}     //Incorrecto
    if nombreCliente != nombreComprador {}        //Correcto

/// # Evitar bloques de código repetidos en diferentes archivos. Optar por crear una función global y pasarle el parámetro que permita retornar el valor deseado.
    /// Este bloque de codigo está presente en 6 archivos.
    if !message.urlArchivo.isEmpty {
        let imageJPG = message.urlArchivo.contains(".jpg")
        let imagePNG = message.urlArchivo.contains(".png")
        let imageJPEG = message.urlArchivo.contains(".jpeg")
        if imageJPG || imagePNG || imageJPEG {
            imgViewFile?.image = UIImage(named: "filImages")
        } else if message.urlArchivo.contains(".pdf") {
            imgViewFile?.image = UIImage(named: "filePDF")
        } else {
            imgViewFile?.image = UIImage(named: "fileSimple")
        }
    } else {
        imgViewFile?.image = UIImage(named: logo)
    }
    
    /// Crear una función global para solucionar esto y sólo basta con llamarla en donde se repita el código
    func validarTipoArchivo(message: MensajeModel) -> String {
        var imageTipo: String()
        if !message.urlArchivo.isEmpty {
            let imageJPG = message.urlArchivo.contains(".jpg")
            let imagePNG = message.urlArchivo.contains(".png")
            let imageJPEG = message.urlArchivo.contains(".jpeg")
            if imageJPG || imagePNG || imageJPEG {
                imageTipo = "filImages"
            } else if message.urlArchivo.contains(".pdf") {
                imageTipo = "filePDF"
            } else {
                imageTipo = "fileSimple"
            }
        } else {
            imageTipo = "fileSimple"
        }
        return imageTipo
    }

    /// Ahora solo deberás de llamar la función en tu bloque repetido
    func validarMensajes(mensajeRecibido: MensajeModel) {
        labelNombre.text = mensajeRecibido.nombre
        labelMensaje.text = mensajeRecibido.mensaje
        imageMensaje.image = UIImage(named: validarTipoArchivo(message: mensajeRecibido)    //La funciona arrojará un string con el nombre de la imagen contenido en los assets, de esta manera ya no debes de repetir las mismas validaciones en diferentes clases.
    }

/// # Verificar que no tengas dos o más funciones con el mismo contenido dentro de ellas. Es redundante.
    func fillListaContactos(listaContactosModel: [Contactos]) {
        listaContactos = listaContactosModel
        tableViewContactos.reloadData()
    }
    func llenarTabla(listaContactosModel: [Contactos]) {
        listaContactos = listaContactosModel
        tableViewContactos.reloadData()
    }

/// # Verificar no repetir la misma condición cuando uses operadores ternarios
    let tipoUsuario = clienteObjeto.tipo.isAdmin ? "Administrador": "Usuario simple"

/// # Procura utilizar funciones que no impliquen un uso excesivo de Case dentro de un Switch. La complejidad de una función hace mayor carga en el procesador. Opta por utilizar protocolos.

/// # No utilizar más de 1 IF dentro de un IF.
    // Incorrecto
    if x > 0 {
        if w > 3 {
            if f - y {
                
            }
        }
    }
    // Correcto
    if x > 0 where w > 3 {
        validarDatos(f)
    }

/// # Si usas un IF dentro de otro IF, asegurate de que cuente con más de una condición.
    // Incorrecto
    if condition1 {
        if condition2 {
            doSomething()
        }
    }

    if let y = someOptional {
        if x > 0 {
            doSomething()
        }
    }
    // Correcto
        if condition1 && condition2 {
            doSomething()
        }
        
        if let y = someOptional where x > 0 {
            doSomething()
        }
        
        if x > 0, let y = someOptional {
            doSomething()
        }
        
/// # No forzar casteos. En celdas para tablas o colecciones, para castear vistas o controllers.
    // Incorrecto, si el casteo falla entonces tu aplicación falla.
    let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! ListaContactosTableViewCell
    // Correcto: Un guard es una sentencia que verifica que tu validación sea certera, en caso contrario a que no se cumpla retornará un valor que definas o bien tu aplicación no se cerrará
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? ListaContactosTableViewCell else {
        return UITableView.emptyCell()
    }

    //Incorrecto
    let centerVC = self.storyboard?.instantiateViewController(withIdentifier: ctrlID) as! UsuarioViewController
    //Correcto
    guard let centerVC = self.storyboard?.instantiateViewController(
        withIdentifier: ctrlID) as? UsuarioViewController
    else {
        _ = "No se puede acceder al controlador"
        return
    }

/// # Procura utilizar variables globales para evitar redundancia dentro del código
    /// Clase 1 : UsuarioViewController
    var idCliente = 0
    /// Clase 2 : UsuarioViewController
    var idCliente = 0
    /// Clase 3 : UsuarioViewController
    var idCliente = 0
    /// Crear una variable global en un archivo de extensiones o de su preferencia
    var idCliente = 0
    /// Ahora en tus clases solo mandas a traer un variable
    idCliente = model.idCliente

/// # Si no utilizas variables declaradas en protocolos o métodos, mejor eliminalas.
    viewModel.registerDidChangesObtenerEventos = { (finished, error) in
        if error {
            //Do some action
        }
        /// Variable finished no usada. Eliminala.
    }

/// # No utilizar dos closures en la misma sección de código. Fuerza la memoria y se vuelve más complejo de optimizar
    //Incorrecto
    foo(42) { (x: Int) in
        bar(x) { (x: Int) in
          foobar(x) { // Noncompliant
            print(x * 42)
          }
          print(x + 42)
        }
        print(x - 42)
    }

    //Correcto
    func multPlus(x:Int) {
      foobar(x) {
        print(x * 42)
      }
      print(x + 42)
    }

    foo(42) { (x: Int) in
        bar(x, multPlus)
        print(x - 42)
    }


/// # Procura que tus funciones no requieran de tantas validaciones, uso de arios cilos for, if, switchs, etc.
/// # Cuando haces esto haces una funcion completa de entender y de mantener. Opta por dividir tu funcion en varias o bien, si es repetitiva creala como una extensión para ahorrar lineas de código y emplearla en otros controladores.

/// # No utilizar dos closures en la misma sección de código. Fuerza la memoria y se vuelve más complejo de optimizar
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        /// Evitar el uso de funciones así. En caso de metodos delegados puedes crear las validaciones dentro de los archivos de celdas o por medio de xibs validar el tipo de acciones que requieras.
        if cell = cell1 {
            for item in lista {
                if item == x {
                   //Do some
                }
            }
        }
        if cell = cell2 {
            for item in lista {
                if item == y {
                    //Do some
                }
            }
        }
        if cell = cell3 {
            for item in lista {
                if item == x {
                    //Do some
                }
            }
        }
        if cell = cell4 {
            for item in lista {
                if item == z {
                    //More validations
                }
            }
        }
        /// Puedes optar por este tipo de configuración y dentro de la funcion confiureCell, haces las validaciones necesarias.
        if cell = cell5 {
            configureCell5(data: mensajeBO)
        }
    }

/// # El archivo de localizables deberás usarlo solo en caso de que requieras o pleneas traducir tu aplicación. En caso contrario puedes optar por crear un archivo con los strings que utilizarás a modo de variables con el texto que utilizarás.
/// # La idea es reducir tu codigo y que las lineas no se hagan complejas de entender

    labelNombre.text = NSLocalizedString("Nombre de usuario", comment: "Nombre de usuario")
    static let nombreUsuario = "Nombre de usuario"
    
/// # Para los mensajes o alertas puedes crear variables con mensajes ya predefinidos, como titulos de alertas y mensajes, variable globales para nombres de controladores, mensajes o diferentes strings que requieras.

/// # Evita delcaraciones de variables no utilizadas
    func platilloElegido() {
        var comida = listaPlatillos.nombrePlato /// No se está usando esta variable.
        return nombrePlato = "Arroz"
    }

/// # Evita declaraciones de parentesis no usados o sin función alguna.
    // Incorrecto
    zoomRect.origin.x = newCenter.x - ((zoomRect.size.width / 2.0))
    // Correcto
    zoomRect.origin.x = newCenter.x - zoomRect.size.width / 2.0

/// # Evita las declaraciones privadas si es que no las utilizarás
    private func resizeImageForLandscape() {
        //Do some
    }
    func resizeImageForLandscape() {
        //Do some
    }

/// # Evita repetir las mismas acciones en diferentes condiciones
    //Incorrecto
    if UIDevice.current.orientation.isPortrait {
        shouldResize = true
    } else if UIDevice.current.orientation.isLandscape {
        shouldResize = true
    }
    //Correcto. Pasas el valor directamente o bien, si la declaración inicial es verdadero no hay necesidad de redefinir valor. En caso de que la variable no tenga alguna función lo mejor es eliminarla.
    shouldResize = true

/// # Evita repetir el nombre de diferentes variables en diferentes sitios
    // Incorrecto: Se repiten dos variables creadas con el mismo nombre pero diferente o mismo dato
    var nombreUno = ""
    func llenarDatos() {
        var nombreUno = 10
    }
    // Correcto
    var nombreUno = ""
    func llenarDatos() {
        var nombreDos = 10
    }
