Ext.define('GlobeExpert.view.frameworks.Owned', {
	extend:'Ext.panel.Panel',
	alias: 'widget.frameworksowned',
	items:[{
		xtype:'panel',
		text:'tree'
	},{
		xtype:'button',
		text:'add new analysis framework'	
	},{
		xtype:'button',
		text:'add new field'
	},{
		xtype:'button',
		text:'add new segment'
	}]
});