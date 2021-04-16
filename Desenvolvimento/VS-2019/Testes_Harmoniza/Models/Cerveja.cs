using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Testes_Harmoniza.Models
{
    public class Cerveja
    {
        public int IDCerveja { get; set; }
        public string Nome { get; set; }
        public int Estilo { get; set; }
        public float ABV { get; set; }
        public int IBU { get; set; }
        public string Descricao { get; set; }
        public int Conteudo { get; set; }
        public string Visual { get; set; }
        public string Olfativo { get; set; }
        public string Gustativo { get; set; }
        public int Temperatura { get; set; }
    }
}