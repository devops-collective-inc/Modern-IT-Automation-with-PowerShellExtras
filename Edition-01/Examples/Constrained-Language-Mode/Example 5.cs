// Compiled Cmdlet Code
using System.Management.Automation;

namespace SamplePowerShellModule
{
    [Cmdlet(VerbsCommon.Get, "Something")]
    public class GetSomething : Cmdlet
    {
        // Declare the parameters for the cmdlet.
        [Parameter(Mandatory = true)]
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private string name;

        protected override void ProcessRecord()
        {
            // We will create a PSObject which is an approved object
            PSObject pSObject = new PSObject();
            pSObject.Members.Add(new PSNoteProperty("Test Object", name));
            WriteObject(pSObject);
        }
    }
}
