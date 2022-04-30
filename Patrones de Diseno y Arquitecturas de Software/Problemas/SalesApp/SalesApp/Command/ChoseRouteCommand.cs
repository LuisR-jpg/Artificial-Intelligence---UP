namespace SalesApp
{
    class ChoseRouteCommand: Command
    {
        protected override void Run()
        {
            GUI.SetNextPage(new StoresFormBuilder());
            GUI.CloseCurrentForm();
        }
        protected override void SetDescription()
        {
            description = "A route has been programmed";
        }
    }
}
