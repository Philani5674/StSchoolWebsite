using Microsoft.VisualStudio.TestTools.UnitTesting;
using StSchoolWebsite3rdYearProject.models;

namespace StSchoolWebsite3rdYearProjectTests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            Registration reg = new Registration(1,1,1,2020,2000,5000);
            var a = reg.isgreater();

            UnitTest1.Equals(a, true);

        }
    }
}
