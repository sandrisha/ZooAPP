using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiZoo.Controllers
{
    public class TiposController : ApiController
    {
        // GET: api/Tipos
        public RespuestaApi Get()
        {
            RespuestaApi resultado = new RespuestaApi();
            List<TiposAnimal> listaAnimales = new List<TiposAnimal>();
            try
            {
                Db.Conectar();

                if (Db.EstaLaConexionAbierta())
                {
                    listaAnimales = Db.GetTiposAnimales();
                }
                resultado.error = "";
                Db.Desconectar();
            }
            catch
            {
                resultado.error = "Se produjo un error";
            }

            resultado.totalElementos = listaAnimales.Count;
            resultado.dataAnimal = listaAnimales;
            return resultado;
        }

        // GET: api/Tipos/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Tipos
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Tipos/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Tipos/5
        public void Delete(int id)
        {
        }
    }
}
