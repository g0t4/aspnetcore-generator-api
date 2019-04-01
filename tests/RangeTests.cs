using api.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Linq;

namespace tests
{
    [TestClass]
    public class RangeTests
    {
        [TestMethod]
        public void TestMethod1()
        {
            var range = new Range { Count = 3 };

            var generated = range.Of(() => "");

            Assert.AreEqual(3, generated.Count());
        }
    }
}
