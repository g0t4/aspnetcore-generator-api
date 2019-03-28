using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Faker;

namespace api.Controllers
{
    // Just use action name as route
    [Route("[action]")]
    public class GenerateController : ControllerBase
    {
        [HttpGet]
        public IEnumerable<string> Names(Range range)
            => range.Of(Name.FullName);

        [HttpGet]
        public IEnumerable<string> PhoneNumbers(Range range)
            => range.Of(Phone.Number);

        [HttpGet]
        public IEnumerable<int> Numbers(Range range)
            => range.Of(RandomNumber.Next);

        [HttpGet]
        public IEnumerable<string> Companies(Range range)
            => range.Of(Company.Name);

        [HttpGet]
        public IEnumerable<string> Paragraphs(Range range)
            => range.Of(() => Lorem.Paragraph(3));

        [HttpGet]
        public IEnumerable<string> CatchPhrases(Range range)
            => range.Of(Company.CatchPhrase);

        [HttpGet]
        public IEnumerable<string> Marketing(Range range)
            => range.Of(Company.BS);

        [HttpGet]
        public IEnumerable<string> Emails(Range range)
            => range.Of(Internet.Email);

        [HttpGet]
        public IEnumerable<string> Domains(Range range)
            => range.Of(Internet.DomainName);
    }
}
