namespace api
{
    public class MailServerConfig
    {
        public MailServerConfig()
        {
            Host = "mail";
            Port = 1025;
        }
        public string Host { get; set; }
        public int Port { get; set; }
    }
}
