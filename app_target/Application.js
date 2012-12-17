//dynamic dependency loader
Ext.Loader.setConfig({enabled:true});

console.log('will define application');
Ext.application({
    name: 'GlobeExpert',
	appFolder: 'app',
	autoCreateViewport:true,	// will search for Viewport.js automatically
    launch:function() {
	
	console.log('Application#launch BEGIN');
	
	Ext.create('GlobeExpert.view.Viewport');
		
	console.log('Application#launch END');
	
		/*, {
            items: {
                html: 'My App'
            }
        });

	Ext.apply(this, {
			items:[{
                    html: 'Hello World',
                    height: 250,
					width: 150,
					region: 'center',
                    xtype: 'panel'
			}]
		});
		console.log('ITEMS created in Viewport');
		this.callParent(arguments);
		console.log('application is ready');*/
    }
});

console.log('application defined');
