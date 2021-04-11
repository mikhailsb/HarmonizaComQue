using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace Testes_Harmoniza.BD
{
    public class conexaoBD
    {
        private readonly MySqlConnection conexao;
        public conexaoBD()
        {
            conexao = new MySqlConnection("server=localhost; User ID=teste1harmocomque; database=teste1harmocomque; password=TESTE123");
            conexao.Open();
        }
        public void Dispose()
        {
            if (conexao.State == System.Data.ConnectionState.Open)
                conexao.Close();
        }

        public void executaComando(string strComando)
        {
            var vComando = new MySqlCommand
            {
                CommandText = strComando,
                CommandType = System.Data.CommandType.Text,
                Connection = conexao
            };
            vComando.ExecuteNonQuery();
        }

        public MySqlDataReader retornaComando(string strComando)
        {
            var vComando = new MySqlCommand(strComando, conexao);

            return vComando.ExecuteReader();
        }
    }
}