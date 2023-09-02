using System.Data.Linq.Mapping;

namespace StSchoolWebsite3rdYearProject.models
{
    [Table(Name = "Principal")]

    public class Principal
    {
        [Column(Name = "PrincipalId")]
        public int PrincipalId { get; set; }
       
        [Column(Name = "FirstName")] 
        public string FirstName { get; set; }
       
        [Column(Name = "LastName")]
        public string LastName { get; set; }
        
        [Column(Name = "UserId")] 
        public int UserId { get; set; }

        public Principal(int principalId, string firstName, string lastName, int userId)
        {
            PrincipalId = principalId;
            FirstName = firstName;
            LastName = lastName;
            UserId = userId;
        }
    }


}