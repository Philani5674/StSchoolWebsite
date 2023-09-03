using System.Data.Linq.Mapping;

namespace StSchoolWebsite3rdYearProject.models
{
    [Table(Name = "Users")]

    public class User
    {
        [Column(Name = "UserId") ]
        public int UserId { get; set; }

        [Column(Name = "Username")]
        public string Username { get; set; }
        
        [Column(Name = "Password")]
        public string Password { get; set; }
        
        [Column(Name = "Role")]
        public string Role { get; set; }

        [Column(Name = "DepartmentId")]
        public int DepartmentId { get; set; }

        public User(int userId, string username, string password, string role, int departmentId)
        {
            UserId = userId;
            Username = username;
            Password = password;
            Role = role;
            DepartmentId = departmentId;
        }

        User()
        {

        }
    }
}