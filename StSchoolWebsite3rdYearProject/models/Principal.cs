using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StSchoolWebsite3rdYearProject.models
{
    public class Principal
    {
        public int PrincipalId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
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