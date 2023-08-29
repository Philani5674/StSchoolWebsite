using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StSchoolWebsite3rdYearProject.models
{
    public class User
    {
        public int UserId { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Role { get; set; }
        public int DepartmentId { get; set; }

        public User(int userId, string username, string password, string role, int departmentId)
        {
            UserId = userId;
            Username = username;
            Password = password;
            Role = role;
            DepartmentId = departmentId;
        }
    }
}