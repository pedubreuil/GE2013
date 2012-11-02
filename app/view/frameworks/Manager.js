Ext.define('GlobeExpert.view.frameworks.Manager', {
	extend:'Ext.panel.Panel',
	alias: 'widget.frameworksmanager',
	requires:['GlobeExpert.view.frameworks.Catalog','GlobeExpert.view.frameworks.Owned','GlobeExpert.view.frameworks.Edition'],
	items:[{
		xtype:'frameworkscatalog'
	},{
		xtype:'frameworksowned'
	},{
		xtype:'frameworksedition'
	}]
});