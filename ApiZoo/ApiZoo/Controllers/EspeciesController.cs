using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiZoo.Controllers
{
    public class EspecieController : ApiController
    {
        // GET: api/Especie
        public RespuestaApi Get()
        {
            RespuestaApi resultado = new RespuestaApi();
            List<Especie> listaEspecie = new List<Especie>();
            try
            {
                Db.Conectar();

                if (Db.EstaLaConexionAbierta())
                {
                    listaEspecie = Db.GetEspecies();
                }
                resultado.error = "";
                Db.Desconectar();
            }
            catch
            {
                resultado.error = "Se produjo un error";
            }

            resultado.totalElementos = listaEspecie.Count;
            resultado.dataEspecie = listaEspecie;
            return resultado;
        }

        // GET: api/Especie/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Especie
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Especie/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Especie/5
        public void Delete(int id)
        {
        }
    }
}
