﻿console.log('will define viewport');
Ext.define('GlobeExpert.view.ViewPort', {
	exend:'Ext.container.Viewport',
	//layout:'fit',	
    layout: 'border',
    items: [{
        region: 'north',
        html: '<h1 class="x-panel-header">Page Title</h1>',
        autoHeight: true,
        border: false,
        margins: '0 0 5 0'
    }, {
        region: 'west',
        collapsible: true,
        title: 'Navigation',
        width: 150
        // could use a TreePanel or AccordionLayout for navigational items
    }, {
        region: 'south',
        title: 'South Panel',
        collapsible: true,
        html: 'Information goes here',
        split: true,
        height: 100,
        minHeight: 100
    }, {
        region: 'east',
        title: 'East Panel',
        collapsible: true,
        split: true,
        width: 150
    }, {
        region: 'center',
        xtype: 'tabpanel', // TabPanel itself has no title
        activeTab: 0,      // First tab active by default
        items: {
            title: 'Default Tab',
            html: 'The first tab\'s content. Others may be added dynamically'
        }
    }]

	initComponent: function() {
		console.log('init component Viewport');
		/*Ext.apply(this, {
			items:[{
                    html: 'Hello World',
                    height: 250,
                    xtype: 'panel'
			}]
		});*/
		this.callParent();
		console.log('init component Viewport DONE');
	}
});
console.log('has defined viewport');
