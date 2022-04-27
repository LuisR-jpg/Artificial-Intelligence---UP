namespace SalesApp
{
    class WelcomeFormBuilder: Builder
    {
        public override void CreateForm()
        {
            form = new Welcome();
            Builder.sizeStandard = form.Size;
            FormatForm(true);
        }
        public override void AddButtons() {}
        public override void AddOtherComponents() {}
    }
}
