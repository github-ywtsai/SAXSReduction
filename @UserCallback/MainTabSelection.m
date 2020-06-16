function MainTabSelection(app,event)
switch app.MainTabGroup.SelectedTab
    case app.ImageTab
        app.UserControlTabGroup.Visible = 'on';
    case app.ProfileTab
        app.UserControlTabGroup.Visible = 'on';
    case app.MaskConfigTab
        app.UserControlTabGroup.Visible = 'off';
    case app.RegionofInterestTab
        app.UserControlTabGroup.Visible = 'off';
    case app.ExperimentalConditionsTab
        app.UserControlTabGroup.Visible = 'off';
    case app.MultiProfileTab
        app.UserControlTabGroup.Visible = 'on';
end