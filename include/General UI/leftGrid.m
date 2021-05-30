function column = leftGrid(app,ColumnWidth,RowHeight)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Create GridRightMain
app.ExtUI.GridLeftMain = uigridlayout(app.LeftPanel);
app.ExtUI.GridLeftMain.ColumnWidth = ColumnWidth;
app.ExtUI.GridLeftMain.RowHeight = RowHeight;
app.ExtUI.GridLeftMain.Scrollable = 'on';
app.ExtUI.GridLeftMain.BackgroundColor = [1 1 1];

% Column
column = app.ExtUI.GridLeftMain;