namespace SalesApp
{
    class CreateRouteCommand : Command
    {
        Logistics logistics;
        public CreateRouteCommand()
        {
            logistics = Logistics.GetInstance();
        }
        protected override void Run()
        {
            logistics.CreateRoute();
        }
        protected override void SetDescription()
        {
            description = "Creating Route";
        }
    }
}
