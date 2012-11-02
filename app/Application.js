//dynamic dependency loader
Ext.Loader.setConfig({enabled:true});

console.log('will define application');
Ext.application({
    name: 'GlobeExpert',
	appFolder: 'app',
	autoCreateViewport:true,	// will search for Viewport.js automatically
    launch:function() {
		console.log('application is ready');
    }
});