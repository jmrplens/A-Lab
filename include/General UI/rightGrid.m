function column = rightGrid(app,ColumnWidth,RowHeight)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Create GridRightMain
app.ExtUI.GridRightMain = uigridlayout(app.RightPanel);
app.ExtUI.GridRightMain.ColumnWidth = ColumnWidth;
app.ExtUI.GridRightMain.RowHeight = RowHeight;
app.ExtUI.GridRightMain.Scrollable = 'on';
app.ExtUI.GridRightMain.BackgroundColor = [1 1 1];

% Column
column = app.ExtUI.GridRightMain;