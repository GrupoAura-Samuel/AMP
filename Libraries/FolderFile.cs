using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;


namespace AMP.Libraries
{
    /// <summary>
    /// 
    /// </summary>
    class FolderFile
    {
        /// <summary>
        /// 
        /// </summary>
        public FolderFile() 
        {

        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="args"></param>
        static void Main(string[] args)
        {
            FolderFile ff = new FolderFile();
            //System.Console.Write("Hola");
            int opc = 1;
            String texto, opcString;

            do
            {
                //System.Console.Clear();
                switch (opc)
                {
                    case 1:
                        System.Console.Write("Escriba el nombre del folder: ");
                        texto = System.Console.ReadLine().ToString();
                        //ff.addFolder("C:\\Users\\SamuelAura\\Documents\\Visual Studio 2010\\Projects\\FolderFile\\FolderFile\\Clientes", folder);
                        //ff.addFile("C:\\Users\\SamuelAura\\Documents\\Visual Studio 2010\\Projects\\FolderFile\\FolderFile\\Clientes", folder);
                        ff.writeFile("C:\\Users\\SamuelAura\\Documents\\Visual Studio 2010\\Projects\\FolderFile\\FolderFile\\Clientes", "samuel", texto);
                        break;

                    case 2:

                        break;

                    default:
                        System.Console.WriteLine("Opcion Incorrecta");
                        break;

                }


                System.Console.WriteLine("\n\n\n1 Para Continuar");
                System.Console.WriteLine("2 Para salir");

                opcString = System.Console.ReadLine();
                opc = Convert.ToInt32(opcString);

            } while (opc != 2);


            System.Console.ReadLine();
        }

        /// <summary>
        /// Funcion para agregar un archivo.
        /// Si el archivo Existe retorna True caso contrario retorna falso
        /// 1er Argumento: es la ruta donde se guardara el archivo
        /// 2do argumento es el nombre del archivo (por ejemplo: archivo1) sin la extension
        /// </summary>
        public bool addFile(String path, String File)
        {
            String file = path + "/" + File + ".txt";
            if (System.IO.File.Exists(file))
            {
                return true;
            }
            else
            {
                System.IO.StreamWriter sw = new System.IO.StreamWriter(file);
                sw.Close();
                return false;
            }
        }


        /// <summary>
        /// Esta Funcion es para Agregar o Crear un Nuevo Folder o directorio.
        /// 1er Argumento: es la ruta donde se guardara o creara el folder o directorio
        /// 2do argumento es el nombre del folder o directorio
        /// </summary>
        public void addFolder(String path, String Folder)
        {
            String pathString = System.IO.Path.Combine(path, Folder);
            System.IO.Directory.CreateDirectory(pathString);
        }

        /// <summary>
        /// Esta Funcion es la encargada de escribir en el archivo.
        /// 1er Argumento: es la ruta donde esta el folder o directorio
        /// 2do argumento es el nombre del archivo, sin la extension
        /// 3er argumento es el texto que se le va agregar al archivo
        /// </summary>
        public void writeFile(String path, String File, String texto)
        {
            String file = path + "/" + File + ".txt";
            System.IO.StreamWriter sw = null;
            if (!System.IO.File.Exists(file))
            {
                sw = new System.IO.StreamWriter(file);
                sw.Close();
            }

            try
            {
                sw = new StreamWriter(file, true, Encoding.ASCII);
                sw.WriteLine(texto);
                sw.Close();
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception: " + e.Message);
            }
            finally
            {
                Console.WriteLine("Executing finally block.");
            }

        }

        /// <summary>
        /// Esta Funcion es para modificar un archivo
        /// 
        /// </summary>
        public void modifyFile(String path, String File, String texto)
        {
            String file = path + "/" + File + ".txt";
        }

    }
}