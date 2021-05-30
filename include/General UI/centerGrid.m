function column = centerGrid(app,ColumnWidth,RowHeight)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Delete content in center column
delete(app.CenterPanel.Children)

% Create GridCenterMain
app.ExtUI.GridCenterMain = uigridlayout(app.CenterPanel);
app.ExtUI.GridCenterMain.ColumnWidth = ColumnWidth;
app.ExtUI.GridCenterMain.RowHeight = RowHeight;
app.ExtUI.GridCenterMain.BackgroundColor = [1 1 1];

% Column
column = app.ExtUI.GridCenterMain;