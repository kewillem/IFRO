using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace AppContatoForm
{
    public partial class FormListar : Form
    {
        private MySqlConnection conexao;

        private MySqlCommand comando;
        public FormListar()
        {
            InitializeComponent();
            CarregarDados();
        }
        private void Conexao()
        {
            string conexaoString = "server=localhost;database=app_contato_bd;user=root;password=root;port=3360";
            conexao = new MySqlConnection(conexaoString);
            comando = conexao.CreateCommand();

            conexao.Open();
        }

        private void dgvExibir_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void FormListar_Load(object sender, EventArgs e)
        {

        }
        private void CarregarDados()
        {
            Conexao();
            string query = "SELECT * FROM contato_cont";
            var comando = new MySqlCommand(query, conexao);
            var adapter = new MySqlDataAdapter(comando);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            dgvExibir.DataSource = dt;
            dt.Columns["id_cont"].ColumnName = "id";
            dt.Columns["nome_cont"].ColumnName= "nome";
            dt.Columns["email_cont"].ColumnName = "email";
            dt.Columns["telefone_cont"].ColumnName = "telefone";
            dt.Columns["data_nasc_cont"].ColumnName = "data de nascimento";
            dt.Columns["sexo_cont"].ColumnName = "sexo";
            
        }
    }
}
