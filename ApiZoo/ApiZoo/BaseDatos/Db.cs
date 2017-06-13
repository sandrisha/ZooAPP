using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ApiZoo
{
    public class Db
    {
        private static SqlConnection conexion = null;

        public static void Conectar()
        {
            try
            {
                // PREPARO LA CADENA DE CONEXIÓN A LA BD
                string cadenaConexion = @"Server=.\sqlexpress;
                                          Database=zoo;
                                          User Id=testzoo;
                                          Password=!Curso@2017;";

                // CREO LA CONEXIÓN
                conexion = new SqlConnection();
                conexion.ConnectionString = cadenaConexion;

                // TRATO DE ABRIR LA CONEXION
                conexion.Open();
               
            }
            catch (Exception)
            {
                if (conexion != null)
                {
                    if (conexion.State != ConnectionState.Closed)
                    {
                        conexion.Close();
                    }
                    conexion.Dispose();
                    conexion = null;
                }
            }
        }

        public static bool EstaLaConexionAbierta()
        {
            return conexion.State == System.Data.ConnectionState.Open;
        }

        public static void Desconectar()
        {
            if (conexion != null)
            {
                if (conexion.State != ConnectionState.Closed)
                {
                    conexion.Close();
                }
            }
        }

        public static List<TiposAnimal> GetTiposAnimales()
        {
            List<TiposAnimal> resultado = new List<TiposAnimal>();
            //LLAMO A LA BASE DE DATOS

            //PREPARO EL PROCEDIMIENTO A EJECUTAR
            string procedimiento = "dbo.GetTiposAnimales";

            // PREPARAMOS EL COMANDO PARA EJECUTAR EL PROCEDIMIENTO ALMACENADO (LA BD)
            SqlCommand comando = new SqlCommand(procedimiento, conexion);
            //INDICO QUE LO QUE VOY A EJECUTAR ES UN PROCED ALMACENADO StoreProcedure
            comando.CommandType = CommandType.StoredProcedure;
            //EJECUTO EL COMANDO
            SqlDataReader reader = comando.ExecuteReader();
            // PROCESO EL RESULTADO Y LO METO EN LA VARIABLE
            while (reader.Read())
            {
                TiposAnimal ClaseDeAnimal = new TiposAnimal();
                ClaseDeAnimal.id = (long)reader["id"];
                ClaseDeAnimal.denominacion = reader["denominacion"].ToString();
                // añadir a la lista que voy a devolver
                resultado.Add(ClaseDeAnimal);
            }
            return resultado;
        }



    }
}