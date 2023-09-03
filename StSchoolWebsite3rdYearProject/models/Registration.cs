using System.Data.Linq.Mapping;

namespace StSchoolWebsite3rdYearProject.models
{

    [Table(Name = "Registration")]
    public class Registration
    {
        [Column(Name = "RegistrationId")]
        public int RegistrationId { get; set; }
        [Column(Name = "StudentId")] 
        public int StudentId { get; set; }
        [Column(Name = "ClassId")] 
        public int ClassId { get; set; }
        [Column(Name = "RegistrationYear")] 
        public int RegistrationYear { get; set; }
        [Column(Name = "AmountPaid")] 
        public decimal AmountPaid { get; set; }
        [Column(Name = "Fees")] 
        public decimal Fees { get; set; }
        private decimal adding { get; set; }

        Registration()
        {

        }
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