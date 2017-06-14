using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiZoo
{
    public class RespuestaApi
    {
        //Creando propiedades
        public int totalElementos { get; set; }

        public string error { get; set; }

        public List<TiposAnimal> dataAnimal { get; set; }

        public List<Clasificacion> dataClasificacion { get; set; }

        public List<Especie> dataEspecie { get; set; }
    }
}