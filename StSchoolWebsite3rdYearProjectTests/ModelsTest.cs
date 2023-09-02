using Microsoft.VisualStudio.TestTools.UnitTesting;
using StSchoolWebsite3rdYearProject.models;

namespace StSchoolWebsite3rdYearProjectTests
{
    [TestClass]
    public class RegistrationTest
    {
        [TestMethod]
        public void IsAmountPaidTest()
        {
            Registration reg = new Registration(1,1,1,2020,2000,5000);
            var a = reg.isgreater();

            RegistrationTest.Equals(a, true);

        }

        [TestMethod]
        public void getNewReistration()
        {

        }
        [TestMethod]
        public void getRegistrationAmount()
        {

        }
        [TestMethod]
        public void getStudentDetails()
        {

        }


    }

    [TestClass]
    public class StudentTest
    {
        [TestMethod]
        public void getAllStdudents()
        {

        }
        [TestMethod]
        public void addNewStudent()
        {

        }
        [TestMethod]
        public void getStudent()
        {

        }
    }
}
