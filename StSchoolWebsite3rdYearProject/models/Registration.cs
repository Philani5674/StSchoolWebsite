using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StSchoolWebsite3rdYearProject.models
{
    public class Registration
    {
        public int RegistrationId { get; set; }
        public int StudentId { get; set; }
        public int ClassId { get; set; }
        public int RegistrationYear { get; set; }
        public decimal AmountPaid { get; set; }
        public decimal Fees { get; set; }
        private decimal adding { get; set; }

        public Registration(int registrationId, int studentid, int classid, int registrationyear, decimal amaountpaid, decimal fees)
        {
            RegistrationId = registrationId;
            StudentId = studentid;
            ClassId = classid;
            RegistrationYear = registrationyear;
            AmountPaid = amaountpaid;
            Fees = fees;

        }

        public bool isgreater()
        {
            return AmountPaid > Fees || AmountPaid == Fees;
        }

        public bool pay(decimal amount)
        {
            adding = amount + AmountPaid;

            if (!isgreater())
            {
                new SchoolDatabaseManager().updatePayment(StudentId, adding);
                AmountPaid = adding;
                return true;
            }
            return false;

        }

    }


}