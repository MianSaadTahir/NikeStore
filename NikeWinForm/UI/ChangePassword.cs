﻿using NikeDLL.DL.DB;
using NikeDLL.Utils;
using System;
using System.Windows.Forms;

namespace NikeWinForm.UI
{
    public partial class ChangePassword : Form
    {
        private UserDB userDB;
        public ChangePassword()
        {
            InitializeComponent();
            string connectionString = ConnectionManager.GetConnectionString();
            userDB = new UserDB(connectionString);
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            AdminMainMenu main_Menu = new AdminMainMenu();
            main_Menu.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(textBox1.Text) || string.IsNullOrWhiteSpace(textBox2.Text))
            {
                MessageBox.Show("Please fill in all fields.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            string username = textBox1.Text;
            string newPassword = textBox2.Text;

            try
            {
                bool passwordChanged = userDB.ChangePassword(username, newPassword);

                if (passwordChanged)
                {
                    MessageBox.Show("Password changed successfully.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    ClearInputFields();

                }
                else
                {
                    MessageBox.Show("Failed to change password. Username not found.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    ClearInputFields();

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                ClearInputFields();
            }
        }
        private void ClearInputFields()
        {
            textBox1.Text = "";
            textBox2.Text = "";
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void ChangePassword_Load(object sender, EventArgs e)
        {

        }
    }
}
