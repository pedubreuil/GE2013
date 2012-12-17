Ext.define('GlobeExpert.view.frameworks.Edition', {
	extend:'Ext.panel.Panel',
	alias: 'widget.frameworksedition',
	items:[{
		xtype:'panel',
		text:'item name editable'
	},{
		xtype:'panel',
		text:'item description editable'
	},{
		xtype:'panel',
		text:'item scope editable (hidden sometimes)'	
	},{
		xtype:'panel',
		text:'keywords list editable (hidden sometimes)'
	},
	{
		xtype:'button',
		text:'save'
	}]
});