[LibreOffice Programming](https://flywire.github.io/lo-p/index.html)

### Calc

	Get all property names of a cell
	
	XSpreadsheetDocument chartsDocument = loadDestDocument(chartsFilePath);
	XSpreadsheet destSheet3 = getSpreadsheet(chartsDocument, 0);
	int row = 1 + getNumberOfRows(destSheet3); 
	com.sun.star.table.XCellRange destCellRange3 = destSheet3.getCellRangeByName("A" + row + ":G" + row);
	com.sun.star.table.XCell destCell = destCellRange3.getCellByPosition(0, 0);
	com.sun.star.beans.XPropertySet destPropSet = UnoRuntime.queryInterface( com.sun.star.beans.XPropertySet.class, destCell);
	Property[] props = destPropSet.getPropertySetInfo().getProperties();
	for (Property p : props) {
		System.out.println(p.Name);
	}
