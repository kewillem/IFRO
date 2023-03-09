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
    public partial class ContatoForm : Form
    {
        private MySqlConnection conexao;

        private MySqlCommand comando;

        public ContatoForm()
        {

            InitializeComponent();            

        }

        private void Conexao()
        {
            string conexaoString = "server=localhost;database=app_contato_bd;user=root;password=root;port=3360";
            conexao = new MySqlConnection(conexaoString);
            comando = conexao.CreateCommand();
            
            conexao.Open();            
        }

        private void btnSalvar_Click(object sender, EventArgs e)
        {
            Conexao();
            try
            {
                if (!rdSexo1.Checked && !rdSexo2.Checked || dateDataNascimento.Text == "" || txtNome.Text == "" || txtEmail.Text == "" || txtTelefone.Text == "")
                {
                    MessageBox.Show("Marque uma opção!");
                }
                else
                {                    
                    var nome = txtNome.Text;
                    var email = txtEmail.Text;
                    var tel = txtTelefone.Text;
                    var data_nasc = dateDataNascimento.Text;
                    var sexo = "Feminino";
                    
                    if (rdSexo1.Checked)
                    {
                        sexo = "Masculino";
                    }

                    string query = "INSERT INTO contato_cont (nome_cont, email_cont, telefone_cont, data_nasc_cont, sexo_cont) VALUES (@_nome, @_email, @_telefone, @_data_nasc, @_sexo)";
                    var comando = new MySqlCommand(query, conexao);

                    comando.Parameters.AddWithValue("@_nome", nome);
                    comando.Parameters.AddWithValue("@_email", email);
                    comando.Parameters.AddWithValue("@_telefone", tel);
                    comando.Parameters.AddWithValue("@_data_nasc", data_nasc);
                    comando.Parameters.AddWithValue("@_sexo", sexo);

                    comando.ExecuteNonQuery();
                    conexao.Close();
                    MessageBox.Show("Salvo com sucesso!");
                    this.Close();                                        
                }
            }catch (Exception ex)
            {
                MessageBox.Show($"Ocorreu um erro ao salvar os dados({ex.GetHashCode()})");           
            }
            
        }
    }
}
