using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiZoo
{
    public class Especie
    {
        public long idEspecie { get; set; }
        public int idClasificacion { get; set; }
        public long idTipoAnimal { get; set; }
        public string nombre { get; set; }
        public short nPatas { get; set; }
        public bool esMascota { get; set; }
    }
}