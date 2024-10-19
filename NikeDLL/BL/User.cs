﻿using NikeDLL.DL.DB;

namespace NikeDLL.BL
{
    public class User
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string Role { get; set; }

        public User(string username, string password, string role)
        {
            Username = username;
            Password = password;
            Role = role;
        }

        public void SignUp()
        {

        }

        public bool SignIn()
        {

            return true;
        }

        private UserDB userDB;

        public User(string connectionString)
        {
            userDB = new UserDB(connectionString);
        }

        public bool ChangePassword(string username, string newPassword)
        {
            return userDB.ChangePassword(username, newPassword);
        }

    }
}
